// POST /api/attempt/start
// Body: { username, password, jenjang, totalTahap }
// - Kalau ada sesi 'mengerjakan' ATAU 'terkunci_pelanggaran' milik siswa ini,
//   sesi itu di-resume — bukan bikin sesi baru. Sengaja ikut mencari sesi
//   yang TERKUNCI juga (bukan cuma 'mengerjakan'): kalau tidak, siswa yang
//   dikunci karena pelanggaran tinggal logout-login lagi untuk dapat sesi
//   baru yang bersih, dan kuncinya jadi percuma.
// - Password dicek pakai bcrypt, sama seperti pola auth SimTKA.
import { sql } from '../../../../lib/db';
import bcrypt from 'bcryptjs';
import { STATUS_TERKUNCI, JUMLAH_VERSI_MEMORI } from '../../../../lib/anti-curang';

export async function POST(req) {
  const { username, password, jenjang, totalTahap } = await req.json();

  const [siswa] = await sql`select * from siswa where username = ${username}`;
  if (!siswa || !(await bcrypt.compare(password, siswa.password))) {
    return Response.json({ error: 'Username/password salah' }, { status: 401 });
  }

  const [existing] = await sql`
    select * from sesi_tes
    where username = ${username} and status in ('mengerjakan', ${STATUS_TERKUNCI})
    order by mulai_at desc limit 1
  `;

  let sesi = existing;
  if (!sesi) {
    // Rotasi varian tugas Ingatan (v1..v4, lihat db/010_versi_memori.sql &
    // JUMLAH_VERSI_MEMORI): dihitung dari jumlah sesi jenjang yang sama yang
    // SUDAH ada sebelum sesi ini dibuat, supaya siswa yang login berurutan
    // (biasanya = berdekatan tempat duduk / satu per satu dipanggil panitia)
    // dapat varian yang bergantian, bukan varian yang sama terus-menerus.
    const [{ jumlah }] = await sql`
      select count(*)::int as jumlah from sesi_tes where jenjang = ${jenjang}
    `;
    const versiMemori = `v${(jumlah % JUMLAH_VERSI_MEMORI) + 1}`;

    [sesi] = await sql`
      insert into sesi_tes (username, jenjang, total_tahap, item_bank_version, versi_memori)
      values (${username}, ${jenjang}, ${totalTahap}, '2026-09-versi-memori', ${versiMemori})
      returning *
    `;
  }

  if (sesi.status === STATUS_TERKUNCI) {
    // Sesi ini dikunci karena pelanggaran berulang -> jangan kembalikan
    // soal/jawaban sama sekali, cukup beri tahu klien untuk tampilkan layar
    // terkunci. Panitia yang bisa membuka lewat panel /admin.
    return Response.json({ sesiId: sesi.id, locked: true, nama: siswa.nama });
  }

  // kembalikan jawaban yang SUDAH tersimpan di server, supaya kalau siswa reload
  // di device manapun / browser manapun, progresnya tidak hilang (bukan cuma
  // bergantung pada localStorage device itu saja seperti sistem lama)
  const jawabanTersimpan = await sql`
    select kode_soal, jawaban_teks from jawaban where sesi_id = ${sesi.id}
  `;

  // sisa waktu bagian yang sedang berjalan (kalau ada) dihitung dari deadline
  // absolut di server (tahap_deadline_at) — lihat db/004_tahap_waktu_anti_curang.sql
  // dan /api/attempt/mulai-bagian. Ini bikin login ulang di tengah bagian
  // berwaktu (mis. abis browser crash) tetap dapat sisa waktu yang BENAR,
  // bukan waktu penuh baru.
  const sisaDetik = sesi.tahap_deadline_at
    ? Math.max(0, Math.round((new Date(sesi.tahap_deadline_at) - new Date()) / 1000))
    : null;

  return Response.json({
    sesiId: sesi.id,
    locked: false,
    resumed: !!existing,
    tahapKe: sesi.tahap_ke,
    tahapFase: sesi.tahap_fase,
    sisaDetik,
    cheatCount: sesi.cheat_count,
    jawabanTersimpan,
    nama: siswa.nama, kelas: siswa.kelas, sekolah: siswa.sekolah,
  });
}
