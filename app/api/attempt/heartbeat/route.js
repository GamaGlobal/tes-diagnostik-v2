// POST /api/attempt/heartbeat
// Body: { sesiId, tahapKe, tabToken }
//
// Hanya update progres (tahap_ke) + jadi denyut "masih aktif" untuk Live
// Monitor. cheat_count TIDAK lagi diterima/ditimpa dari sini — sebelumnya
// klien mengirim angka cheatCount-nya sendiri tiap 20 detik, yang gampang
// dipalsukan (tinggal selalu kirim 0). Sekarang cheat_count hanya pernah
// bertambah lewat /api/attempt/pelanggaran yang server sendiri yang
// increment saat kejadian benar-benar tercatat.
//
// tabToken dipakai deteksi "sesi ini juga sedang aktif di tab/perangkat
// lain": kalau tab_token tersimpan beda dengan punya pengirim DAN heartbeat
// terakhir dari tab itu masih baru (<25 detik, berarti tab itu betulan masih
// hidup, bukan sekadar bekas sesi lama yang belum kedaluwarsa), tab yang baru
// ini diberi tahu activeElsewhere:true tanpa merebut kepemilikan tab yang
// masih aktif tsb. Ini disengaja lunak (bukan mengunci layar) supaya koneksi
// yang sempat putus-nyambung tidak sampai mengunci siswa dari tes-nya sendiri.
import { sql } from '../../../../lib/db';
import { STATUS_TERKUNCI } from '../../../../lib/anti-curang';

export async function POST(req) {
  const { sesiId, tahapKe, tabToken } = await req.json();

  const [current] = await sql`
    select tab_token, heartbeat_at, tahap_deadline_at, cheat_count, status
    from sesi_tes where id = ${sesiId}
  `;
  if (!current) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });

  if (current.status !== 'mengerjakan') {
    // Sesi sudah dikunci (pelanggaran) atau sudah selesai (mis. tab LAIN
    // yang memicunya, atau diselesaikan paksa panitia) -- kabari tab ini
    // juga supaya UI-nya ikut sadar, tidak diam menunggu aksi berikutnya.
    return Response.json({
      ok: true, status: current.status, locked: current.status === STATUS_TERKUNCI,
      cheatCount: current.cheat_count,
    });
  }

  const detikSejakHeartbeatLain = (Date.now() - new Date(current.heartbeat_at).getTime()) / 1000;
  const tabLainMasihAktif = current.tab_token && current.tab_token !== tabToken && detikSejakHeartbeatLain < 25;

  const sisaDetik = current.tahap_deadline_at
    ? Math.max(0, Math.round((new Date(current.tahap_deadline_at) - new Date()) / 1000))
    : null;

  if (tabLainMasihAktif) {
    // jangan timpa kepemilikan tab & jangan update tahap_ke dari tab yang "kalah"
    return Response.json({ ok: true, status: current.status, locked: false, activeElsewhere: true, sisaDetik, cheatCount: current.cheat_count });
  }

  await sql`
    update sesi_tes
    set tahap_ke = ${tahapKe}, heartbeat_at = now(), tab_token = ${tabToken}
    where id = ${sesiId} and status = 'mengerjakan'
  `;

  return Response.json({ ok: true, status: current.status, locked: false, activeElsewhere: false, sisaDetik, cheatCount: current.cheat_count });
}
