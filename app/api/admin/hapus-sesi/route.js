// DELETE /api/admin/hapus-sesi
// Header: x-panitia-pin (sama seperti endpoint admin lain)
// Body: { sesiId }
//
// Menghapus sesi (mis. entri salah-input, siswa dobel klik "Mulai", data
// tes coba-coba panitia sendiri, dll). `on delete cascade` di skema
// (lihat db/001_schema.sql) otomatis ikut menghapus baris terkait di
// `jawaban`, `hasil`, dan `pelanggaran` -- jadi tidak ada sisa data yatim.
//
// SENGAJA tidak ada "undo": panitia diminta konfirmasi dulu di sisi klien
// (lihat app/admin/page.js) sebelum memanggil endpoint ini.
import { sql } from '../../../../lib/db';

export async function DELETE(req) {
  const pin = req.headers.get('x-panitia-pin');
  if (!pin || pin !== process.env.PANITIA_PIN) {
    return Response.json({ error: 'PIN panitia salah' }, { status: 401 });
  }

  const { sesiId } = await req.json();
  if (!sesiId) return Response.json({ error: 'sesiId wajib diisi' }, { status: 400 });

  const [row] = await sql`
    delete from sesi_tes where id = ${sesiId} returning id
  `;
  if (!row) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });

  return Response.json({ ok: true });
}
