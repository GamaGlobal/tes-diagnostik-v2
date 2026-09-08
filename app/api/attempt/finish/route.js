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

  const [sesi] = await sql`select jenjang from sesi_tes where id = ${sesiId}`;
  if (!sesi) return Response.json({ error: 'Sesi tidak ditemukan' }, { status: 404 });

  const rows = await sql`
    select b.kategori, b.sub_kategori, b.tipe, j.jawaban_teks, j.benar
    from jawaban j join bank_soal b on b.kode_soal = j.kode_soal
    where j.sesi_id = ${sesiId}
  `;

  const hasil = computeHasil(rows, sesi.jenjang);

  await sql`
    insert into hasil (sesi_id, level_ist, subskor, riasec, gaya_belajar, bakat,
                        total_benar, total_soal, persentase, estimasi_iq, sumber)
    values (
      ${sesiId}, ${hasil.iqClassification || null},
      ${hasil.iqScores ? JSON.stringify(hasil.iqScores) : null}::jsonb,
      ${hasil.riasecScores ? JSON.stringify({ scores: hasil.riasecScores, topCode: hasil.riasecTopCode }) : null}::jsonb,
      ${hasil.gayaScores ? JSON.stringify({ scores: hasil.gayaScores, dominant: hasil.gayaDominant }) : null}::jsonb,
      ${hasil.bakatScores ? JSON.stringify({ scores: hasil.bakatScores, top: hasil.bakatTop, rekomendasi: hasil.bakatRekomendasi }) : null}::jsonb,
      ${hasil.iqTotalCorrect ?? null}, ${hasil.iqTotalMax ?? null}, ${hasil.iqPercentage ?? null}, ${hasil.iq ?? null},
      ${dipaksaOleh ? 'manual_panitia' : 'auto'}
    )
    on conflict (sesi_id) do update set
      level_ist = excluded.level_ist, subskor = excluded.subskor,
      riasec = excluded.riasec, gaya_belajar = excluded.gaya_belajar, bakat = excluded.bakat,
      total_benar = excluded.total_benar, total_soal = excluded.total_soal,
      persentase = excluded.persentase, estimasi_iq = excluded.estimasi_iq,
      sumber = excluded.sumber, dihitung_at = now()
  `;

  await sql`
    update sesi_tes
    set status = ${dipaksaOleh ? 'selesai_paksa_panitia' : 'selesai_terkirim'},
        selesai_at = now(), finalized_by = ${dipaksaOleh || null}
    where id = ${sesiId}
  `;

  return Response.json({ ok: true, hasil });
}
