-- ============================================================
-- 009: SINKRONISASI DENGAN DATA TES DIAGNOSTIK v1 (Google Sheet / Code.gs)
--
-- Tujuan: hasil dari SimTKA-v2 (Postgres/Neon) bisa DITUMPUK dan DIANALISIS
-- BERSAMA dengan file "Hasil Tes Diagnostik" dari versi Apps Script, tanpa
-- perlu merapikan kolom manual. Caranya:
--
--   1. Tambah kolom `nis` di tabel siswa. Di v1, NIS adalah kunci identitas
--      peserta (5 digit) yang dipakai cek-hasil.html & dashboard-panitia.html.
--      Di v2 kuncinya `username`, jadi tanpa kolom ini kedua dataset tidak
--      bisa di-JOIN. Kalau username memang sudah berupa NIS 5 digit, kolom
--      ini otomatis terisi (backfill di bawah).
--
--   2. View `v_rekap_hasil`: 1 BARIS = 1 PESERTA (bukan 1 baris = 1 jawaban),
--      dengan isi kolom yang setara dengan sheet "Hasil Tes Diagnostik".
--      Skor domain (Verbal/Numerik/Figural/Memori) dihitung ulang di sini dari
--      tabel `jawaban` + `bank_soal` -- penyebutnya jumlah soal yang MEMANG
--      ditugaskan untuk jenjang tsb (jenjang peserta + soal 'semua'), bukan
--      cuma yang sempat dijawab; ini konsisten dengan lib/scoring.js supaya
--      sesi yang belum selesai tidak tampak seperti skor sempurna.
--
--   3. View `v_analisis_butir`: statistik per butir soal (tingkat kesulitan /
--      p-value + daya beda kasar), untuk audit kualitas bank soal.
--
-- Aman dijalankan berkali-kali.
-- ============================================================

alter table siswa
  add column if not exists nis text;

-- Backfill: kalau username-nya memang NIS (5 digit angka), pakai itu.
update siswa set nis = username
where nis is null and username ~ '^[0-9]{5}$';

create index if not exists idx_siswa_nis on siswa(nis) where nis is not null;

-- ============ REKAP HASIL (1 baris = 1 peserta) ============
create or replace view v_rekap_hasil as
with domain_ist as (
  -- benar & total per domain IST, total dari bank_soal (soal yang ditugaskan),
  -- bukan dari jumlah soal yang sempat dijawab.
  select
    s.id                                        as sesi_id,
    d.domain,
    count(*)::int                               as total_soal,
    count(*) filter (where j.benar)::int        as benar
  from sesi_tes s
  join bank_soal b
    on (b.jenjang = s.jenjang or b.jenjang = 'semua')
  join (values
          ('SE','Verbal'), ('WA','Verbal'), ('AN','Verbal'), ('GE','Verbal'),
          ('RA','Numerik'), ('ZR','Numerik'),
          ('FA','Figural'), ('WU','Figural'),
          ('ME','Memori')
       ) as d(kategori, domain) on d.kategori = b.kategori
  left join jawaban j
    on j.sesi_id = s.id and j.kode_soal = b.kode_soal
  group by s.id, d.domain
),
domain_pivot as (
  select
    sesi_id,
    max(case when domain = 'Verbal'  and total_soal > 0 then round(benar * 100.0 / total_soal) end) as verbal_persen,
    max(case when domain = 'Numerik' and total_soal > 0 then round(benar * 100.0 / total_soal) end) as numerik_persen,
    max(case when domain = 'Figural' and total_soal > 0 then round(benar * 100.0 / total_soal) end) as figural_persen,
    max(case when domain = 'Memori'  and total_soal > 0 then round(benar * 100.0 / total_soal) end) as memori_persen
  from domain_ist
  group by sesi_id
),
pelanggaran_rekap as (
  select
    sesi_id,
    count(*)::int as jumlah,
    string_agg(jenis || ' @ ' || to_char(waktu, 'YYYY-MM-DD HH24:MI:SS'), ' | ' order by waktu) as detail
  from pelanggaran
  group by sesi_id
),
terjawab as (
  select sesi_id, count(*)::int as jumlah_terjawab
  from jawaban group by sesi_id
)
select
  -- identitas (setara kolom Nama/Sekolah/Kelas/NIS di sheet v1)
  s.id                                   as sesi_id,
  si.username,
  si.nis,
  si.nama,
  si.sekolah,
  si.kelas,
  s.jenjang,
  upper(s.jenjang)                       as level_ist,   -- 'SMA'/'SMP' (kolom "Level IST" di sheet v1)
  s.status,
  case s.status
    when 'selesai_terkirim'      then 'Selesai Normal'
    when 'selesai_paksa_panitia' then 'Selesai (Submit Paksa)'
    when 'terkunci_pelanggaran'  then 'Terkunci (pelanggaran)'
    when 'mengerjakan'           then 'Sedang Mengerjakan'
    else s.status
  end                                    as status_label,
  s.catatan_panitia,
  s.ditandai,
  s.mulai_at,
  s.heartbeat_at,
  s.selesai_at,
  coalesce(s.item_bank_version, '')      as item_bank_version,
  coalesce(t.jumlah_terjawab, 0)         as jumlah_terjawab,

  -- skor IST (subskor = {"SE":4,"WA":3,...}; klasifikasi ada di hasil.level_ist)
  h.subskor,
  h.total_benar,
  h.total_soal,
  h.persentase,
  h.estimasi_iq,
  h.level_ist                            as klasifikasi,  -- "Rata-rata"/"Superior"/dst.
  h.lengkap,
  h.sumber,
  h.dihitung_at,
  dp.verbal_persen,
  dp.numerik_persen,
  dp.figural_persen,
  dp.memori_persen,

  -- minat / gaya / bakat (bakat sudah 6 rumpun: MIPA IPS BHS INF VOK AGM)
  h.riasec       -> 'scores'             as riasec_scores,
  h.riasec      ->> 'topCode'            as riasec_top,
  h.gaya_belajar -> 'scores'             as gaya_scores,
  h.gaya_belajar->> 'dominant'           as gaya_dominant,
  h.bakat        -> 'scores'             as bakat_scores,
  h.bakat       ->> 'top'                as bakat_top,
  h.bakat       ->> 'rekomendasi'        as bakat_rekomendasi,

  -- anti-curang
  s.cheat_count,
  coalesce(pr.jumlah, 0)                 as pelanggaran_jumlah,
  coalesce(pr.detail, '')                as pelanggaran_detail
from sesi_tes s
join siswa si            on si.username = s.username
left join hasil h        on h.sesi_id = s.id
left join domain_pivot dp on dp.sesi_id = s.id
left join pelanggaran_rekap pr on pr.sesi_id = s.id
left join terjawab t     on t.sesi_id = s.id;

-- ============ ANALISIS BUTIR SOAL ============
-- p (tingkat kesulitan) = proporsi peserta yang menjawab benar.
-- Konvensi: p mendekati 1 = soal mudah, mendekati 0 = soal sulit.
-- Item likert (RIASEC/GAYA) tidak punya benar/salah, jadi diabaikan.
create or replace view v_analisis_butir as
select
  b.kode_soal,
  b.kategori,
  b.sub_kategori,
  b.jenjang,
  b.tipe,
  b.urutan,
  b.pertanyaan,
  b.jawaban_kunci,
  b.item_bank_version,
  count(j.*)::int                                              as dijawab,
  count(*) filter (where j.benar)::int                         as benar,
  case when count(j.*) > 0
       then round(count(*) filter (where j.benar) * 100.0 / count(j.*), 1)
  end                                                          as p_persen,
  case
    when count(j.*) = 0 then 'belum ada data'
    when count(*) filter (where j.benar) * 1.0 / count(j.*) >= 0.85 then 'terlalu mudah'
    when count(*) filter (where j.benar) * 1.0 / count(j.*) <= 0.20 then 'terlalu sulit'
    else 'layak'
  end                                                          as catatan_butir
from bank_soal b
left join jawaban j on j.kode_soal = b.kode_soal and j.benar is not null
group by b.kode_soal, b.kategori, b.sub_kategori, b.jenjang, b.tipe,
         b.urutan, b.pertanyaan, b.jawaban_kunci, b.item_bank_version;
