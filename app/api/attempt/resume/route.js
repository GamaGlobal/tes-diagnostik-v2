// GET /api/attempt/resume?sesiId=...
//
// Dipakai saat halaman /tes di-refresh. Sengaja TIDAK mempercayai progres
// (jawaban, bagian ke berapa, sisa waktu) yang disimpan di sessionStorage
// klien — itu bisa saja diubah manual lewat DevTools (Application ->
// Session Storage). sessionStorage cuma dipakai untuk simpan sesiId (biar
// tidak perlu login ulang pakai password), sementara progres yang
// SEBENARNYA selalu diambil ulang dari sini, dari database.
//
// sesiId adalah UUID acak dari server (bukan angka urut yang gampang
// ditebak), jadi aman dipakai sebagai "kunci" resume tanpa password —
// polanya sama seperti session token pada umumnya.
import { sql } from '../../../../lib/db';
import { STATUS_TERKUNCI } from '../../../../lib/anti-curang';

export async function GET(req) {
  const { searchParams } = new URL(req.url);
  const sesiId = searchParams.get('sesiId');
  if (!sesiId) return Response.json({ found: false }, { status: 400 });

  const [sesi] = await sql`
    select s.id, s.username, s.jenjang, s.status, s.tahap_ke, s.tahap_fase,
           s.tahap_deadline_at, s.cheat_count,
           si.nama, si.kelas, si.sekolah
    from sesi_tes s join siswa si on si.username = s.username
    where s.id = ${sesiId}
  `;
  if (!sesi) return Response.json({ found: false });

  if (sesi.status === STATUS_TERKUNCI) {
    // Sesi dikunci karena pelanggaran berulang -> refresh TIDAK boleh
    // membuka lagi soalnya, harus tetap di layar terkunci sampai panitia
    // membuka kunci lewat panel /admin.
    return Response.json({
      found: true, status: sesi.status, locked: true, selesai: false,
      nama: sesi.nama, cheatCount: sesi.cheat_count,
    });
  }

  if (sesi.status !== 'mengerjakan') {
    // Sudah selesai (dikirim sendiri ATAU diselesaikan paksa panitia) ->
    // refresh langsung tampilkan hasilnya lagi, bukan balik ke form login.
    const [hasil] = await sql`select * from hasil where sesi_id = ${sesiId}`;
    return Response.json({
      found: true, status: sesi.status, selesai: true,
      nama: sesi.nama, hasil: hasil ? formatHasil(hasil) : null,
    });
  }

  const jawabanTersimpan = await sql`
    select kode_soal, jawaban_teks from jawaban where sesi_id = ${sesiId}
  `;

  const sisaDetik = sesi.tahap_deadline_at
    ? Math.max(0, Math.round((new Date(sesi.tahap_deadline_at) - new Date()) / 1000))
    : null;

  return Response.json({
    found: true, status: sesi.status, selesai: false,
    sesiId: sesi.id, jenjang: sesi.jenjang,
    nama: sesi.nama, kelas: sesi.kelas, sekolah: sesi.sekolah,
    tahapKe: sesi.tahap_ke, tahapFase: sesi.tahap_fase, sisaDetik,
    jawabanTersimpan,
  });
}

function formatHasil(h) {
  return {
    iq: h.estimasi_iq, iqClassification: h.level_ist,
    iqTotalCorrect: h.total_benar, iqTotalMax: h.total_soal, iqPercentage: h.persentase,
    iqDomain: h.subskor,
    riasecScores: h.riasec?.scores, riasecTopCode: h.riasec?.topCode,
    gayaScores: h.gaya_belajar?.scores, gayaDominant: h.gaya_belajar?.dominant,
    bakatScores: h.bakat?.scores, bakatTop: h.bakat?.top, bakatRekomendasi: h.bakat?.rekomendasi,
  };
}
