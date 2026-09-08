// GET /api/admin/monitor
// Header: x-panitia-pin  (sama dengan PANITIA_PIN di env — dipakai juga oleh
// tombol "Paksa Selesaikan" di panel /admin, lihat README bagian Live Monitor)
//
// Mengembalikan gabungan sesi yang sedang berjalan ('mengerjakan') dan yang
// sudah selesai, supaya panel admin bisa menampilkan keduanya dari satu
// panggilan. Progres dihitung dari jumlah baris di tabel `jawaban`, bukan dari
// heartbeat saja, supaya tetap akurat walau heartbeat sempat gagal terkirim.
import { sql } from '../../../../lib/db';

export async function GET(req) {
  const pin = req.headers.get('x-panitia-pin');
  if (!pin || pin !== process.env.PANITIA_PIN) {
    return Response.json({ error: 'PIN panitia salah' }, { status: 401 });
  }

  try {
    const rows = await sql`
      select
        s.id as sesi_id, s.username, si.nama, si.kelas, si.sekolah,
        s.jenjang, s.status, s.tahap_ke, s.total_tahap, s.cheat_count,
        s.mulai_at, s.heartbeat_at, s.selesai_at,
        (select count(*)::int from jawaban j where j.sesi_id = s.id) as jumlah_terjawab,
        h.level_ist, h.persentase, h.estimasi_iq,
        h.riasec ->> 'topCode' as riasec_top,
        h.gaya_belajar ->> 'dominant' as gaya_dominant,
        h.bakat ->> 'top' as bakat_top
      from sesi_tes s
      join siswa si on si.username = s.username
      left join hasil h on h.sesi_id = s.id
      order by s.heartbeat_at desc
    `;
    return Response.json({ rows });
  } catch (err) {
    console.error('Gagal memuat live monitor:', err);
    return Response.json(
      { error: `Gagal memuat data dari database: ${err?.message || 'error tidak diketahui'}` },
      { status: 500 }
    );
  }
}
