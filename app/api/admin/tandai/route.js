// POST /api/admin/tandai
// Header: x-panitia-pin (sama seperti endpoint admin lain)
// Body: { sesiId, ditandai }
//
// Menandai (flag) sesi tertentu untuk ditinjau ulang panitia nanti -- mis.
// hasil yang tampak janggal, siswa yang perlu dipantau, dll. Ini murni
// penanda visual di panel admin (kolom `ditandai` di sesi_tes, lihat
// db/007_fitur_admin_tambahan.sql), tidak memengaruhi skor / status tes.
import { sql } from '../../../../lib/db';

export async function POST(req) {
  const pin = req.headers.get('x-panitia-pin');
  if (!pin || pin !== process.env.PANITIA_PIN) {
    return Response.json({ error: 'PIN panitia salah' }, { status: 401 });
  }

  try {
    const { sesiId, ditandai } = await req.json();
    if (!sesiId) return Response.json({ error: 'sesiId wajib diisi' }, { status: 400 });

    const [row] = await sql`
      update sesi_tes set ditandai = ${!!ditandai} where id = ${sesiId} returning id, ditandai
    `;
    if (!row) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });

    return Response.json({ ok: true, ditandai: row.ditandai });
  } catch (err) {
    console.error('tandai error:', err);
    return Response.json({ error: 'Gagal menandai sesi: ' + (err.message || 'tidak diketahui') }, { status: 500 });
  }
}
