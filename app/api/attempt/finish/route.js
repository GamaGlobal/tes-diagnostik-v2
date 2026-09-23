// POST /api/attempt/finish
// Body: { sesiId, dipaksaOleh? }
//
// Dipakai baik oleh siswa sendiri (saat klik "Selesai") MAUPUN tombol
// "Kirim Manual / Paksa Selesai" milik panitia di monitor-live — endpoint yang
// SAMA PERSIS, karena hasil selalu dihitung ulang dari tabel `jawaban` yang
// sudah tersimpan sejak soal-soal itu dijawab, bukan dari payload klien.
import { sql } from '../../../../lib/db';
import { computeHasil } from '../../../../lib/scoring';

export async function POST(req) {
  const { sesiId, dipaksaOleh } = await req.json();

  const [sesi] = await sql`select jenjang, versi_memori from sesi_tes where id = ${sesiId}`;
  if (!sesi) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });

  const rows = await sql`
    select b.kategori, b.sub_kategori, b.tipe, j.jawaban_teks, j.benar
    from jawaban j join bank_soal b on b.kode_soal = j.kode_soal
    where j.sesi_id = ${sesiId}
  `;

  // Total soal yang SEBENARNYA ditugaskan untuk jenjang ini (dipakai sebagai
  // penyebut skor di computeHasil, lihat komentar di lib/scoring.js) — bukan
  // cuma yang sempat dijawab. Untuk BAKAT dipecah per sub_kategori karena tiap
  // sub-tes (MIPA/IPS/BHS/dst.) punya jumlah soal & bobot sendiri-sendiri.
  // Kategori ME (Ingatan) punya 4 varian pasangan berbeda di bank_soal
  // (db/010_versi_memori.sql) tapi satu sesi cuma pernah ditugaskan SATU
  // varian (lihat app/api/attempt/soal) -- jadi dihitung terpisah di sini
  // memakai versi_memori sesi ini, supaya penyebut skornya tetap 20/24
  // (jumlah soal varian itu saja), bukan total ke-4 varian digabung.
  const totalRowsLain = await sql`
    select kategori, sub_kategori, count(*)::int as total
    from bank_soal
    where (jenjang = ${sesi.jenjang} or jenjang = 'semua') and kategori <> 'ME'
    group by kategori, sub_kategori
  `;
  const [meTotal] = await sql`
    select count(*)::int as total
    from bank_soal
    where jenjang = ${sesi.jenjang} and kategori = 'ME'
      and sub_kategori is not distinct from ${sesi.versi_memori}
  `;
  const totalRows = [...totalRowsLain, { kategori: 'ME', sub_kategori: null, total: meTotal.total }];
  const totalPerKategori = {};
  for (const r of totalRows) {
    if (r.kategori === 'BAKAT') {
      totalPerKategori[`BAKAT_${r.sub_kategori}`] = (totalPerKategori[`BAKAT_${r.sub_kategori}`] || 0) + r.total;
    } else {
      totalPerKategori[r.kategori] = (totalPerKategori[r.kategori] || 0) + r.total;
    }
  }

  const hasil = computeHasil(rows, sesi.jenjang, totalPerKategori);

  // `lengkap`: false kalau ADA bagian (IST atau BAKAT) yang belum dijawab
  // penuh sesuai jumlah soal yang seharusnya. Kalau salah satu bagian tidak
  // pernah dimuat sama sekali (mis. dipaksa selesai sebelum tes bakat
  // dibuka), hasil.bakatLengkap akan undefined -- itu juga dihitung sebagai
  // "belum lengkap", supaya panitia tidak salah kira hasilnya utuh.
  const lengkap = (hasil.iqLengkap ?? true) && (hasil.bakatLengkap ?? true);

  await sql`
    insert into hasil (sesi_id, level_ist, subskor, riasec, gaya_belajar, bakat,
                        total_benar, total_soal, persentase, estimasi_iq, sumber, lengkap)
    values (
      ${sesiId}, ${hasil.iqClassification || null},
      ${hasil.iqScores ? JSON.stringify(hasil.iqScores) : null}::jsonb,
      ${hasil.riasecScores ? JSON.stringify({ scores: hasil.riasecScores, topCode: hasil.riasecTopCode }) : null}::jsonb,
      ${hasil.gayaScores ? JSON.stringify({ scores: hasil.gayaScores, dominant: hasil.gayaDominant }) : null}::jsonb,
      ${hasil.bakatScores ? JSON.stringify({ scores: hasil.bakatScores, top: hasil.bakatTop, rekomendasi: hasil.bakatRekomendasi }) : null}::jsonb,
      ${hasil.iqTotalCorrect ?? null}, ${hasil.iqTotalMax ?? null}, ${hasil.iqPercentage ?? null}, ${hasil.iq ?? null},
      ${dipaksaOleh ? 'manual_panitia' : 'auto'}, ${lengkap}
    )
    on conflict (sesi_id) do update set
      level_ist = excluded.level_ist, subskor = excluded.subskor,
      riasec = excluded.riasec, gaya_belajar = excluded.gaya_belajar, bakat = excluded.bakat,
      total_benar = excluded.total_benar, total_soal = excluded.total_soal,
      persentase = excluded.persentase, estimasi_iq = excluded.estimasi_iq,
      sumber = excluded.sumber, lengkap = excluded.lengkap, dihitung_at = now()
  `;

  await sql`
    update sesi_tes
    set status = ${dipaksaOleh ? 'selesai_paksa_panitia' : 'selesai_terkirim'},
        selesai_at = now(), finalized_by = ${dipaksaOleh || null}
    where id = ${sesiId}
  `;

  return Response.json({ ok: true, hasil });
}
