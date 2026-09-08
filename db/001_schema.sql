-- ============================================================
-- SKEMA FINAL NEON (POSTGRES) — SIMULASI TES IST GAMA GLOBAL
-- Prinsip utama: jawaban disimpan PER SOAL, saat itu juga,
-- bukan ditumpuk untuk dikirim sekaligus di akhir tes. Hasil
-- SELALU dihitung ulang dari tabel `jawaban`, tidak pernah dari
-- payload yang dikirim klien.
-- ============================================================

create extension if not exists pgcrypto;

-- Akun siswa (mirror dari AKUN_SISWA_*.xlsx)
create table siswa (
  username     text primary key,
  password     text not null,        -- bcrypt hash
  nama         text not null,
  kelas        text,
  sekolah      text not null,
  created_at   timestamptz not null default now()
);

-- Bank soal (hasil extract dari index.html — lihat bank-soal/README-bank-soal.md)
-- jawaban_kunci disimpan sebagai TEKS ISI PILIHAN, bukan index — karena urutan
-- pilihan diacak per-sesi (shuffledMC() di index.html), index tidak stabil.
create table bank_soal (
  kode_soal          text primary key,      -- 'SE_smp_1', 'FA_sma_7', 'WU_semua_3', dst.
  kategori           text not null,         -- SE/WA/AN/GE/RA/ZR/FA/WU/ME/BAKAT/RIASEC/GAYA
  sub_kategori       text,                  -- BAKAT: MIPA/IPS/BHS/INF/VOK; RIASEC: R/I/A/S/E/C; GAYA: V/A/K
  jenjang            text not null,         -- 'smp' | 'sma' | 'semua'
  tipe               text not null,         -- 'pilihan_tunggal' | 'likert' | 'figural' | 'seri_angka' | 'kubus'
  urutan             int not null,
  pertanyaan         text,                  -- null utk item figural/kubus
  pilihan            jsonb not null,        -- array teks, ATAU array JSON-string kanonik (figural/kubus)
  jawaban_kunci      text,                  -- null utk likert (RIASEC/GAYA, tidak ada benar/salah)
  meta               jsonb,                 -- data render tambahan (seq figural, net kubus, pasangan ME, dst.)
  item_bank_version  text not null default '2026-08-audit-v2'
);
create index idx_bank_kategori on bank_soal(kategori, jenjang);

-- Satu baris = satu kali siswa mengambil tes
create table sesi_tes (
  id                 uuid primary key default gen_random_uuid(),
  username           text not null references siswa(username),
  jenjang            text not null,        -- 'smp' | 'sma'
  status             text not null default 'mengerjakan',
    -- 'mengerjakan' | 'selesai_terkirim' | 'selesai_paksa_panitia' | 'dibatalkan'
  tahap_ke           int not null default 0,
  total_tahap        int not null default 0,
  cheat_count        int not null default 0,
  item_bank_version  text,
  mulai_at           timestamptz not null default now(),
  heartbeat_at       timestamptz not null default now(),
  selesai_at         timestamptz,
  finalized_by       text                  -- null = siswa sendiri; diisi PIN panitia kalau dipaksa
);
create index idx_sesi_status on sesi_tes(status);
create index idx_sesi_username on sesi_tes(username);

-- JAWABAN — diautosave satu per satu, segera setelah siswa memilih.
create table jawaban (
  sesi_id       uuid not null references sesi_tes(id) on delete cascade,
  kode_soal     text not null references bank_soal(kode_soal),
  jawaban_teks  text not null,   -- ISI pilihan yg dipilih (bukan index)
  benar         boolean,         -- null utk item likert
  dijawab_at    timestamptz not null default now(),
  primary key (sesi_id, kode_soal)
);

create table pelanggaran (
  id         bigserial primary key,
  sesi_id    uuid not null references sesi_tes(id) on delete cascade,
  jenis      text not null,      -- mis. 'tab_switch'
  waktu      timestamptz not null default now()
);

-- Hasil akhir — selalu dihitung ulang dari `jawaban` (lihat lib/scoring.js)
create table hasil (
  sesi_id         uuid primary key references sesi_tes(id) on delete cascade,
  level_ist       text,          -- klasifikasi IQ ("Rata-rata", "Superior", dst.)
  subskor         jsonb,         -- {"SE":4,"WA":3,...} jumlah benar per kategori
  riasec          jsonb,         -- {"scores":{...},"topCode":"RSI"}
  gaya_belajar    jsonb,         -- {"scores":{...},"dominant":"V"}
  bakat           jsonb,         -- {"scores":{...},"top":"MIPA","rekomendasi":"..."}
  total_benar     int,
  total_soal      int,
  persentase      numeric(5,2),
  estimasi_iq     int,
  dihitung_at     timestamptz not null default now(),
  sumber          text not null default 'auto'  -- 'auto' | 'manual_panitia'
);

-- Live Monitor — satu sumber data langsung dari tabel, bukan sheet terpisah.
create view v_live_monitor as
select
  s.id as sesi_id, si.username, si.nama, si.kelas, si.sekolah,
  s.status, s.tahap_ke, s.total_tahap, s.cheat_count,
  s.mulai_at, s.heartbeat_at,
  (now() - s.heartbeat_at) as sejak_heartbeat_terakhir,
  h.sesi_id is not null as sudah_ada_hasil
from sesi_tes s
join siswa si on si.username = s.username
left join hasil h on h.sesi_id = s.id
order by s.heartbeat_at desc;
