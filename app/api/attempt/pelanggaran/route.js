// POST /api/attempt/pelanggaran
// Body: { sesiId, jenis }
//
// Dipanggil LANGSUNG saat kejadian terdeteksi di klien (pindah tab, copy,
// paste, klik kanan, dst) — bukan ditumpuk lalu dikirim lewat heartbeat tiap
// 20 detik seperti sebelumnya. Dua alasan:
//   1. Kalau tabnya keburu ditutup / koneksi putus sebelum heartbeat
//      berikutnya, kejadiannya tidak ikut hilang.
//   2. cheat_count di sesi_tes sekarang HANYA pernah bertambah lewat sini
//      (server yang increment), tidak lagi lewat angka yang dikirim klien di
//      heartbeat — klien tidak bisa lagi "reset" hitungannya sendiri.
//
// AMBANG_PELANGGARAN pelanggaran pertama = PERINGATAN saja. Begitu melewati
// ambang itu, sesi dikunci (status -> STATUS_TERKUNCI) di sini juga, supaya
// penguncian terjadi di titik yang SAMA dengan tempat pelanggaran dicatat
// (tidak bergantung pada heartbeat berikutnya yang bisa telat 20 detik).
import { sql } from '../../../../lib/db';
import { AMBANG_PELANGGARAN, STATUS_TERKUNCI } from '../../../../lib/anti-curang';

const JENIS_VALID = new Set([
  'tab_switch',       // pindah tab / minimize (visibilitychange)
  'blur_jendela',     // jendela kehilangan fokus (mis. alt-tab ke app lain)
  'copy',             // menyalin teks soal
  'paste',            // menempel teks ke area jawaban
  'klik_kanan',       // klik kanan / buka menu konteks di layar soal
  'sesi_ganda',       // sesi yang sama terdeteksi aktif di tab/device lain
]);

export async function POST(req) {
  const { sesiId, jenis } = await req.json();
  if (!sesiId) return Response.json({ error: 'sesiId wajib diisi' }, { status: 400 });
  const j = JENIS_VALID.has(jenis) ? jenis : 'lainnya';

  await sql`insert into pelanggaran (sesi_id, jenis) values (${sesiId}, ${j})`;

  const [row] = await sql`
    update sesi_tes set cheat_count = cheat_count + 1
    where id = ${sesiId} and status = 'mengerjakan'
    returning cheat_count
  `;
  if (!row) {
    // sesi sudah tidak berstatus 'mengerjakan' (sudah dikunci/selesai duluan
    // -- mis. oleh tab lain) -> tetap beri tahu klien supaya UI-nya ikut sadar
    return Response.json({ ok: true, cheatCount: null, locked: true, ambang: AMBANG_PELANGGARAN });
  }

  const cheatCount = row.cheat_count;
  let locked = false;
  if (cheatCount > AMBANG_PELANGGARAN) {
    await sql`update sesi_tes set status = ${STATUS_TERKUNCI} where id = ${sesiId} and status = 'mengerjakan'`;
    locked = true;
  }

  return Response.json({ ok: true, cheatCount, locked, ambang: AMBANG_PELANGGARAN });
}
