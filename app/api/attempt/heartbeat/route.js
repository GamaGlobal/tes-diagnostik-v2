// POST /api/attempt/heartbeat
// Body: { sesiId, tahapKe, cheatCount }
// Hanya update progres (kolom ringan) — tidak menyentuh tabel jawaban/hasil sama
// sekali, jadi tidak ada lagi dua "sumber kebenaran" yang bisa saling tidak sinkron
// (dulu: LiveMonitor sheet vs Hasil Tes Diagnostik sheet).
import { sql } from '../../../../lib/db';

export async function POST(req) {
  const { sesiId, tahapKe, cheatCount } = await req.json();
  await sql`
    update sesi_tes
    set tahap_ke = ${tahapKe}, cheat_count = ${cheatCount}, heartbeat_at = now()
    where id = ${sesiId} and status = 'mengerjakan'
  `;
  return Response.json({ ok: true });
}
