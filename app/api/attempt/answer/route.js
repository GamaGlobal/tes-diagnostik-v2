// POST /api/attempt/answer  (REVISI: pakai jawaban_teks, bukan index — lihat
// schema/schema-bank_soal-REVISI.sql untuk alasannya: pilihan diacak per-sesi,
// jadi index tidak bisa dipakai sebagai kunci jawaban yang stabil)
// Body: { sesiId, kodeSoal, jawabanTeks }
import { sql } from '../../../../lib/db';

export async function POST(req) {
  const { sesiId, kodeSoal, jawabanTeks } = await req.json();

  const [soal] = await sql`select jawaban_kunci from bank_soal where kode_soal = ${kodeSoal}`;
  if (!soal) return Response.json({ error: 'Soal tidak ditemukan' }, { status: 404 });

  // null utk item likert (RIASEC/GAYA) yang memang tidak ada jawaban benar/salah
  const benar = soal.jawaban_kunci === null ? null : soal.jawaban_kunci === jawabanTeks;

  await sql`
    insert into jawaban (sesi_id, kode_soal, jawaban_teks, benar)
    values (${sesiId}, ${kodeSoal}, ${jawabanTeks}, ${benar})
    on conflict (sesi_id, kode_soal)
    do update set jawaban_teks = excluded.jawaban_teks,
                  benar = excluded.benar,
                  dijawab_at = now()
  `;

  return Response.json({ ok: true });
}
