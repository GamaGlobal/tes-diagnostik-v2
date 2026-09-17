// GET /api/admin/jawaban-mentah?sesiId=<uuid>   -> jawaban mentah 1 sesi
// GET /api/admin/jawaban-mentah?semua=1          -> jawaban mentah SEMUA sesi
// Header: x-panitia-pin (sama seperti endpoint admin lain)
//
// Dipakai tombol "Unduh Jawaban" di panel /admin (lihat app/admin/page.js) --
// mengembalikan baris jawaban APA ADANYA dari tabel `jawaban` (dijoin info
// siswa & soal secukupnya untuk konteks), supaya panitia bisa mengecek
// manual kalau perlu, di luar skor yang sudah dihitung sistem.
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
    // PENTING: `sql` dari @neondatabase/serverless (beda dgn postgres.js) TIDAK
    // mendukung menyisipkan sql`...` lain di dalam sql`...` induk (itu bug versi
    // sebelumnya yang bikin endpoint ini crash pas dipanggil dgn semua=1 --
    // request selesai tanpa body, makanya di klien muncul error "Unexpected end
    // of JSON input"). Jadi query dipisah jadi 2 cabang lengkap, bukan disatukan
    // dgn kondisi ternary di dalam template.
    const rows = semua
      ? await sql`
          select
            s.id as sesi_id, si.nama, si.kelas, si.sekolah, s.jenjang, s.status,
            j.kode_soal, b.kategori, b.sub_kategori, j.jawaban_teks, j.benar, j.dijawab_at
          from jawaban j
          join sesi_tes s on s.id = j.sesi_id
          join siswa si on si.username = s.username
          join bank_soal b on b.kode_soal = j.kode_soal
          order by si.nama, j.sesi_id, b.kategori, b.urutan
        `
      : await sql`
          select
            s.id as sesi_id, si.nama, si.kelas, si.sekolah, s.jenjang, s.status,
            j.kode_soal, b.kategori, b.sub_kategori, j.jawaban_teks, j.benar, j.dijawab_at
          from jawaban j
          join sesi_tes s on s.id = j.sesi_id
          join siswa si on si.username = s.username
          join bank_soal b on b.kode_soal = j.kode_soal
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
    // balas JSON yang valid -- supaya di klien tidak muncul error generik
    // "Unexpected end of JSON input" yang tidak jelas sumbernya.
    console.error('jawaban-mentah error:', err);
    return Response.json({ error: 'Gagal mengambil data jawaban dari server.' }, { status: 500 });
  }
}
