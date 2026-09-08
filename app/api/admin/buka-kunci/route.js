// POST /api/admin/buka-kunci
// Header: x-panitia-pin (sama seperti /api/admin/monitor)
// Body: { sesiId }
//
// Membuka kembali sesi yang otomatis terkunci karena pelanggaran berulang
// (lihat /api/attempt/pelanggaran & lib/anti-curang.js), supaya siswa bisa
// melanjutkan tes-nya kalau panitia menilai itu keputusan yang tepat (mis.
// ternyata pindah tab tidak sengaja / masalah koneksi). cheat_count di-reset
// ke 0 juga -- kalau tidak, satu pelanggaran berikutnya akan langsung
// mengunci lagi karena hitungannya sudah lewat ambang sebelumnya.
//
// Panitia yang TIDAK ingin membuka & lebih memilih mengakhiri tes-nya saja
// tetap pakai tombol "Paksa Selesaikan" (POST /api/attempt/finish) yang
// sudah ada -- endpoint itu bekerja untuk sesi dengan status apa pun.
import { sql } from '../../../../lib/db';

export async function POST(req) {
  const pin = req.headers.get('x-panitia-pin');
  if (!pin || pin !== process.env.PANITIA_PIN) {
    return Response.json({ error: 'PIN panitia salah' }, { status: 401 });
  }

  const { sesiId } = await req.json();
  const [row] = await sql`
    update sesi_tes
    set status = 'mengerjakan', cheat_count = 0, heartbeat_at = now()
    where id = ${sesiId} and status = 'terkunci_pelanggaran'
    returning id
  `;
  if (!row) return Response.json({ error: 'Sesi tidak ditemukan / sedang tidak terkunci' }, { status: 404 });

  return Response.json({ ok: true });
}
