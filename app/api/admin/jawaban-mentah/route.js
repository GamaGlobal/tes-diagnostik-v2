// GET /api/admin/jawaban-mentah?sesiId=<uuid>   -> jawaban mentah 1 sesi
// GET /api/admin/jawaban-mentah?semua=1          -> jawaban mentah SEMUA sesi
// Header: x-panitia-pin (sama seperti endpoint admin lain)
//
// Dipakai tombol "Unduh Jawaban" di panel /admin (lihat app/admin/page.js) --
// mengembalikan baris jawaban LENGKAP dengan konteksnya: teks soal, pilihan,
// kunci jawaban, jawaban siswa, DAN ringkasan skor sesi (level IQ, persentase,
// RIASEC/gaya/bakat) supaya panitia bisa langsung menganalisis dari satu
// file tanpa perlu buka panel lain / cross-reference manual.
//
// CATATAN: kolom SELECT sengaja ditulis lengkap di KEDUA cabang query di
// bawah (bukan dipisah jadi 1 potongan lalu disisipkan) karena `sql` dari
// @neondatabase/serverless (beda dgn postgres.js) TIDAK mendukung
// menyisipkan sql`...`/sql.unsafe(...) lain ke dalam sql`...` induk -- itu
// yang bikin endpoint ini crash sebelumnya pas dipanggil dgn semua=1.
import { sql } from '../../../../lib/db';

export async function GET(req) {
  const pin = req.headers.get('x-panitia-pin');
  if (!pin || pin !== process.env.PANITIA_PIN) {
    return Response.json({ error: 'PIN panitia salah' }, { status: 401 });
  }

  const { searchParams } = new URL(req.url);
  const sesiId = searchParams.get('sesiId');
  const semua = searchParams.get('semua') === '1';

  if (!sesiId && !semua) {
    return Response.json({ error: 'sesiId atau semua=1 wajib diisi' }, { status: 400 });
  }

  try {
    const rows = semua
      ? await sql`
          select
            s.id as sesi_id, si.nama, si.kelas, si.sekolah, s.jenjang,
            case s.status
              when 'selesai_terkirim' then 'Selesai (siswa sendiri)'
              when 'selesai_paksa_panitia' then 'Diselesaikan Panitia'
              when 'terkunci_pelanggaran' then 'Terkunci (pelanggaran)'
              else s.status
            end as status_sesi,
            s.selesai_at,
            h.level_ist, h.persentase as skor_ist_persen, h.total_benar, h.total_soal, h.estimasi_iq, h.lengkap,
            h.riasec ->> 'topCode' as riasec_top,
            h.gaya_belajar ->> 'dominant' as gaya_dominant,
            h.bakat ->> 'top' as bakat_top,
            b.urutan, b.kategori, b.sub_kategori, b.tipe,
            b.pertanyaan, b.pilihan::text as pilihan_json, b.jawaban_kunci,
            j.kode_soal, j.jawaban_teks, j.benar, j.dijawab_at
          from jawaban j
          join sesi_tes s on s.id = j.sesi_id
          join siswa si on si.username = s.username
          join bank_soal b on b.kode_soal = j.kode_soal
          left join hasil h on h.sesi_id = s.id
          order by si.nama, j.sesi_id, b.kategori, b.urutan
        `
      : await sql`
          select
            s.id as sesi_id, si.nama, si.kelas, si.sekolah, s.jenjang,
            case s.status
              when 'selesai_terkirim' then 'Selesai (siswa sendiri)'
              when 'selesai_paksa_panitia' then 'Diselesaikan Panitia'
              when 'terkunci_pelanggaran' then 'Terkunci (pelanggaran)'
              else s.status
            end as status_sesi,
            s.selesai_at,
            h.level_ist, h.persentase as skor_ist_persen, h.total_benar, h.total_soal, h.estimasi_iq, h.lengkap,
            h.riasec ->> 'topCode' as riasec_top,
            h.gaya_belajar ->> 'dominant' as gaya_dominant,
            h.bakat ->> 'top' as bakat_top,
            b.urutan, b.kategori, b.sub_kategori, b.tipe,
            b.pertanyaan, b.pilihan::text as pilihan_json, b.jawaban_kunci,
            j.kode_soal, j.jawaban_teks, j.benar, j.dijawab_at
          from jawaban j
          join sesi_tes s on s.id = j.sesi_id
          join siswa si on si.username = s.username
          join bank_soal b on b.kode_soal = j.kode_soal
          left join hasil h on h.sesi_id = s.id
          where j.sesi_id = ${sesiId}
          order by si.nama, j.sesi_id, b.kategori, b.urutan
        `;

    if (!semua && !rows.length) {
      // sesi valid tapi belum ada jawaban tersimpan sama sekali dianggap ok,
      // tapi sesi yang sama sekali tidak ada tetap 404-kan supaya panitia
      // tahu ID-nya salah / sudah terhapus.
      const [sesi] = await sql`select id from sesi_tes where id = ${sesiId}`;
      if (!sesi) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });
    }

    return Response.json({ rows });
  } catch (err) {
    // Jaring pengaman: kalau ada error tak terduga (query gagal dll), tetap
    // balas JSON yang valid dgn PESAN ASLINYA -- supaya kalau ada bug lagi,
    // panitia bisa langsung salin pesan errornya utk dilaporkan, bukan cuma
    // "Unexpected end of JSON input" yang tidak jelas sumbernya.
    console.error('jawaban-mentah error:', err);
    return Response.json({ error: 'Gagal mengambil data jawaban dari server: ' + (err.message || 'tidak diketahui') }, { status: 500 });
  }
}
