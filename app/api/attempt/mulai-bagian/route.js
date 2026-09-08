// POST /api/attempt/mulai-bagian
// Body: { sesiId, tahapKe, fase }   fase: 'memorize' | 'mengerjakan'
//
// Dipanggil setiap kali siswa MEMULAI fase berwaktu (klik "Mulai Bagian",
// atau "Sudah Hafal, Mulai Soal" setelah fase menghafal). Server yang
// menentukan & mencatat kapan batas waktunya berakhir (tahap_deadline_at) —
// durasinya diambil dari lib/sections.js yang SAMA dipakai /api/attempt/soal,
// bukan dari body request, jadi klien tidak bisa mengirim durasi/deadline
// sendiri untuk curang dapat waktu lebih.
//
// Deadline absolut ini yang bikin refresh/reload AMAN: sisa waktu pada
// resume selalu = tahap_deadline_at - now(), bukan mulai hitung dari nol lagi.
import { sql } from '../../../../lib/db';
import { getSectionMeta } from '../../../../lib/sections';
import { STATUS_TERKUNCI } from '../../../../lib/anti-curang';

export async function POST(req) {
  const { sesiId, tahapKe, fase } = await req.json();
  if (fase !== 'memorize' && fase !== 'mengerjakan') {
    return Response.json({ error: 'fase tidak valid' }, { status: 400 });
  }

  const [sesi] = await sql`select jenjang, status from sesi_tes where id = ${sesiId}`;
  if (!sesi) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });
  if (sesi.status !== 'mengerjakan') {
    return Response.json(
      { error: 'Sesi terkunci atau sudah selesai', locked: sesi.status === STATUS_TERKUNCI },
      { status: 423 }
    );
  }

  const section = getSectionMeta(sesi.jenjang)[tahapKe];
  if (!section) return Response.json({ error: 'Bagian tidak ditemukan' }, { status: 404 });

  const durasiDetik = fase === 'memorize' ? section.memorizeDurasi : section.durasi;
  if (!durasiDetik) return Response.json({ error: 'Bagian ini tidak punya fase tersebut' }, { status: 400 });

  const [row] = await sql`
    update sesi_tes
    set tahap_ke = ${tahapKe}, tahap_fase = ${fase},
        tahap_mulai_at = now(), tahap_deadline_at = now() + make_interval(secs => ${durasiDetik})
    where id = ${sesiId} and status = 'mengerjakan'
    returning tahap_deadline_at
  `;

  return Response.json({ ok: true, deadlineAt: row.tahap_deadline_at, sisaDetik: durasiDetik });
}
