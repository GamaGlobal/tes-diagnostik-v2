// GET /api/attempt/soal?jenjang=smp
//
// PENTING: jawaban_kunci SENGAJA TIDAK dikirim ke klien sama sekali — beda
// dengan index.html lama yang menaruh kunci jawaban di array JS yang gampang
// dibaca lewat DevTools/"View Source". Di sini, benar/salah HANYA dihitung di
// server (lihat attempt/answer & attempt/finish), jadi klien betul-betul tidak
// pernah tahu jawaban yang benar sebelum submit.
import { sql } from '../../../../lib/db';
import { getSectionMeta } from '../../../../lib/sections';

export async function GET(req) {
  const { searchParams } = new URL(req.url);
  const jenjang = searchParams.get('jenjang') === 'sma' ? 'sma' : 'smp';

  const rows = await sql`
    select kode_soal, kategori, sub_kategori, tipe, urutan, pertanyaan, pilihan, meta
    from bank_soal
    where jenjang = ${jenjang} or jenjang = 'semua'
    order by kategori, urutan
  `;

  const meta = getSectionMeta(jenjang);
  const sections = meta.map(m => ({
    ...m,
    soal: rows
      .filter(r => r.kategori === m.id)
      .map(r => ({
        kodeSoal: r.kode_soal,
        subKategori: r.sub_kategori,
        pertanyaan: r.pertanyaan,
        pilihan: r.pilihan, // untuk figural/kubus ini array JSON-string / simbol, diparse di klien
        meta: r.meta,
      })),
  }));

  return Response.json({ jenjang, sections });
}
