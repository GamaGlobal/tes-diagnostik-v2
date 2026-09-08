// POST /api/attempt/answer  (REVISI: pakai jawaban_teks, bukan index — lihat
// schema/schema-bank_soal-REVISI.sql untuk alasannya: pilihan diacak per-sesi,
// jadi index tidak bisa dipakai sebagai kunci jawaban yang stabil)
// Body: { sesiId, kodeSoal, jawabanTeks }
import { sql } from '../../../../lib/db';
import { STATUS_TERKUNCI } from '../../../../lib/anti-curang';

export async function POST(req) {
  const { sesiId, kodeSoal, jawabanTeks } = await req.json();

  // Sebelumnya endpoint ini TIDAK mengecek status sesi sama sekali -- celah:
  // sesi yang sudah dikunci karena pelanggaran (atau sudah selesai) masih
  // bisa terus menerima jawaban baru selama sesiId-nya tahu. Sekarang jawaban
  // hanya diterima kalau sesi masih berstatus 'mengerjakan'.
  const [sesi] = await sql`select status from sesi_tes where id = ${sesiId}`;
  if (!sesi) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });
  if (sesi.status !== 'mengerjakan') {
    return Response.json(
      { error: 'Sesi terkunci atau sudah selesai', locked: sesi.status === STATUS_TERKUNCI },
      { status: 423 }
    );
  }

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
