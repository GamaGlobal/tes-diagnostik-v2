// POST /api/attempt/buka-kunci-sendiri
// Body: { sesiId, kode }
// TANPA header PIN -- ini dipanggil dari HP peserta sendiri di layar
// "Tes Dikunci Sistem" (lihat app/tes/page.js), bukan dari panel /admin.
//
// Alternatif yang lebih ringan daripada panitia harus buka laptop & panel
// /admin satu per satu tiap ada peserta kena kunci pelanggaran: panitia
// cukup mengumumkan/membisikkan KODE_BUKA_KUNCI_SENDIRI (lihat
// .env.example -- SENGAJA beda dari PANITIA_PIN supaya akses ke panel admin
// tidak ikut bocor ke seluruh ruangan), peserta ketik sendiri kodenya.
//
// Percobaan salah dibatasi (AMBANG_PERCOBAAN_KODE, lib/anti-curang.js) per
// sesi supaya tidak bisa ditebak asal-asalan -- begitu limit habis, peserta
// wajib minta panitia buka lewat panel /admin (endpoint terpisah,
// /api/admin/buka-kunci, yang masih selalu tersedia sebagai jalur cadangan).
import { sql } from '../../../../lib/db';
import { AMBANG_PERCOBAAN_KODE } from '../../../../lib/anti-curang';

export async function POST(req) {
  const { sesiId, kode } = await req.json();
  if (!sesiId || !kode) {
    return Response.json({ error: 'sesiId dan kode wajib diisi' }, { status: 400 });
  }

  const [sesi] = await sql`
    select id, status, percobaan_kunci_gagal from sesi_tes where id = ${sesiId}
  `;
  if (!sesi) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });
  if (sesi.status !== 'terkunci_pelanggaran') {
    return Response.json({ error: 'Sesi ini sedang tidak dalam status terkunci' }, { status: 409 });
  }
  if (sesi.percobaan_kunci_gagal >= AMBANG_PERCOBAAN_KODE) {
    return Response.json({
      error: `Sudah ${AMBANG_PERCOBAAN_KODE}x salah memasukkan kode. Silakan minta panitia membuka lewat panel admin.`,
      habis: true,
    }, { status: 429 });
  }

  const kodeBenar = (process.env.KODE_BUKA_KUNCI_SENDIRI || '').trim();
  if (!kodeBenar || kode.trim() !== kodeBenar) {
    const [row] = await sql`
      update sesi_tes set percobaan_kunci_gagal = percobaan_kunci_gagal + 1
      where id = ${sesiId} returning percobaan_kunci_gagal
    `;
    const sisa = Math.max(0, AMBANG_PERCOBAAN_KODE - row.percobaan_kunci_gagal);
    return Response.json({
      error: sisa > 0 ? `Kode salah. Sisa ${sisa}x percobaan.` : `Kode salah. Percobaan habis, minta panitia buka lewat panel admin.`,
      sisaPercobaan: sisa,
    }, { status: 401 });
  }

  await sql`
    update sesi_tes
    set status = 'mengerjakan', cheat_count = 0, percobaan_kunci_gagal = 0, heartbeat_at = now()
    where id = ${sesiId}
  `;

  return Response.json({ ok: true });
}
