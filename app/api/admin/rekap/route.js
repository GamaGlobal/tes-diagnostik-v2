// GET /api/admin/rekap            -> rekap SEMUA peserta (1 baris = 1 peserta)
// GET /api/admin/rekap?sesiId=... -> rekap 1 peserta
// Header: x-panitia-pin (sama seperti endpoint admin lain)
//
// Ini pasangan dari /api/admin/jawaban-mentah: kalau yang itu "1 baris = 1
// jawaban", endpoint ini "1 baris = 1 peserta" -- bentuk yang sama dengan
// sheet "Hasil Tes Diagnostik" di tes diagnostik v1 (Apps Script/Code.gs),
// supaya dua dataset itu bisa ditumpuk dan dianalisis bersama.
//
// Sumbernya view v_rekap_hasil (lihat db/009_nis_dan_rekap_sinkron.sql):
// skor domain Verbal/Numerik/Figural/Memori dihitung ulang di SQL dari
// tabel jawaban + bank_soal, jadi tidak perlu dihitung lagi di klien.
//
// CATATAN penamaan yang gampang tertukar:
//   - kolom "Level IST" di sheet v1 = jenjang (SMA/SMP)  -> di sini `level_ist`
//   - kolom "Klasifikasi" di sheet v1                    -> di sini `klasifikasi`
//     (di tabel `hasil`, klasifikasi IQ memang disimpan di kolom level_ist)
import { sql } from '../../../../lib/db';

export async function GET(req) {
  const pin = req.headers.get('x-panitia-pin');
  if (!pin || pin !== process.env.PANITIA_PIN) {
    return Response.json({ error: 'PIN panitia salah' }, { status: 401 });
  }

  const { searchParams } = new URL(req.url);
  const sesiId = searchParams.get('sesiId');
  // default: hanya sesi yang sudah punya hasil. ?termasukBelumSelesai=1 untuk semua.
  const termasukBelumSelesai = searchParams.get('termasukBelumSelesai') === '1';

  try {
    const rows = sesiId
      ? await sql`select * from v_rekap_hasil where sesi_id = ${sesiId}`
      : termasukBelumSelesai
        ? await sql`select * from v_rekap_hasil order by sekolah, kelas, nama`
        : await sql`
            select * from v_rekap_hasil
            where status <> 'mengerjakan'
            order by sekolah, kelas, nama
          `;

    return Response.json({ rows });
  } catch (err) {
    console.error('rekap error:', err);
    const pesan = /v_rekap_hasil/.test(err?.message || '')
      ? 'View v_rekap_hasil belum ada. Jalankan migrasi db/009_nis_dan_rekap_sinkron.sql dulu (npm run db:migrate).'
      : 'Gagal mengambil rekap dari server: ' + (err?.message || 'tidak diketahui');
    return Response.json({ error: pesan }, { status: 500 });
  }
}
