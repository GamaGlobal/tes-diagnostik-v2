// POST /api/attempt/start
// Body: { username, password, jenjang, totalTahap }
// - Kalau ada sesi 'mengerjakan' yang belum selesai milik siswa ini, sesi itu di-resume
//   (dikembalikan bersama semua jawaban yang sudah tersimpan) — bukan bikin sesi baru.
// - Password dicek pakai bcrypt, sama seperti pola auth SimTKA.
import { sql } from '../../../../lib/db';
import bcrypt from 'bcryptjs';

export async function POST(req) {
  const { username, password, jenjang, totalTahap } = await req.json();

  const [siswa] = await sql`select * from siswa where username = ${username}`;
  if (!siswa || !(await bcrypt.compare(password, siswa.password))) {
    return Response.json({ error: 'Username/password salah' }, { status: 401 });
  }

  const [existing] = await sql`
    select * from sesi_tes
    where username = ${username} and status = 'mengerjakan'
    order by mulai_at desc limit 1
  `;

  let sesi = existing;
  if (!sesi) {
    [sesi] = await sql`
      insert into sesi_tes (username, jenjang, total_tahap, item_bank_version)
      values (${username}, ${jenjang}, ${totalTahap}, '2026-08-audit-v2')
      returning *
    `;
  }

  // kembalikan jawaban yang SUDAH tersimpan di server, supaya kalau siswa reload
  // di device manapun / browser manapun, progresnya tidak hilang (bukan cuma
  // bergantung pada localStorage device itu saja seperti sistem lama)
  const jawabanTersimpan = await sql`
    select kode_soal, jawaban_teks from jawaban where sesi_id = ${sesi.id}
  `;

  return Response.json({
    sesiId: sesi.id,
    resumed: !!existing,
    tahapKe: sesi.tahap_ke,
    cheatCount: sesi.cheat_count,
    jawabanTersimpan,
    nama: siswa.nama, kelas: siswa.kelas, sekolah: siswa.sekolah,
  });
}
