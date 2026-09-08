// Porting dari computeResults() di index.html (tes-diagnostik-main), dipindah
// ke server dan dijalankan dari data yang sudah tersimpan di tabel `jawaban`
// (bukan dari payload yang dikirim klien) — sesuai prinsip di README.md.
//
// Input `rows`: hasil join jawaban+bank_soal, tiap baris:
//   { kategori, sub_kategori, tipe, jawaban_teks, benar }
// (satu baris = satu soal yang sudah dijawab siswa untuk sesi ini)
import {
  DOMAIN_MAP, classify, RIASEC_LABELS, GAYA_LABELS, BAKAT_LABELS,
  BAKAT_DESC_SMA, BAKAT_DESC_SMP, SKALA_RIASEC, SKALA_GAYA
} from './labels';

const IST_KATEGORI = new Set(Object.keys(DOMAIN_MAP)); // SE,WA,AN,GE,RA,ZR,FA,WU,ME

function topN(scores, n) {
  return Object.entries(scores).sort((a, b) => b[1] - a[1]).slice(0, n).map(([k]) => k);
}

export function computeHasil(rows, jenjang) {
  const hasil = {};

  // ---------- IST (SE/WA/AN/GE/RA/ZR/FA/WU/ME) ----------
  const istRows = rows.filter(r => IST_KATEGORI.has(r.kategori));
  if (istRows.length) {
    const perKategori = {}; // {SE:{correct,total}, ...}
    const perDomain = {};   // {Verbal:{correct,total}, ...}
    for (const r of istRows) {
      const k = perKategori[r.kategori] || (perKategori[r.kategori] = { correct: 0, total: 0 });
      k.total += 1;
      if (r.benar) k.correct += 1;

      const domain = DOMAIN_MAP[r.kategori];
      const d = perDomain[domain] || (perDomain[domain] = { correct: 0, total: 0 });
      d.total += 1;
      if (r.benar) d.correct += 1;
    }
    const totalCorrect = Object.values(perKategori).reduce((s, v) => s + v.correct, 0);
    const totalMax = Object.values(perKategori).reduce((s, v) => s + v.total, 0);
    const pct = totalMax ? (totalCorrect / totalMax) * 100 : 0;
    let iq = Math.round(pct + 35);
    iq = Math.max(55, Math.min(145, iq));

    hasil.level = jenjang === 'sma' ? 'SMA' : 'SMP';
    hasil.iqScores = Object.fromEntries(Object.entries(perKategori).map(([k, v]) => [k, v.correct]));
    hasil.iqTotalCorrect = totalCorrect;
    hasil.iqTotalMax = totalMax;
    hasil.iqPercentage = Math.round(pct);
    hasil.iq = iq;
    hasil.iqClassification = classify(iq);
    hasil.iqDomain = Object.fromEntries(
      Object.entries(perDomain).map(([d, v]) => [d, Math.round((v.correct / v.total) * 100)])
    );
  }

  // ---------- RIASEC (minat) ----------
  const riasecRows = rows.filter(r => r.kategori === 'RIASEC');
  if (riasecRows.length) {
    const byCat = {}; // {R:{sum,count}, ...}
    for (const r of riasecRows) {
      const value = SKALA_RIASEC.indexOf(r.jawaban_teks) + 1; // 1..4
      const c = byCat[r.sub_kategori] || (byCat[r.sub_kategori] = { sum: 0, count: 0 });
      c.sum += value; c.count += 1;
    }
    const scores = {};
    for (const k of Object.keys(RIASEC_LABELS)) {
      const st = byCat[k] || { sum: 0, count: 1 };
      scores[k] = Math.round((st.sum / (st.count * 4)) * 100);
    }
    hasil.riasecScores = scores;
    hasil.riasecTopCode = topN(scores, 3).join('');
  }

  // ---------- GAYA BELAJAR (VAK) ----------
  const gayaRows = rows.filter(r => r.kategori === 'GAYA');
  if (gayaRows.length) {
    const byCat = {};
    for (const r of gayaRows) {
      const value = SKALA_GAYA.indexOf(r.jawaban_teks) + 1;
      const c = byCat[r.sub_kategori] || (byCat[r.sub_kategori] = { sum: 0, count: 0 });
      c.sum += value; c.count += 1;
    }
    const scores = {};
    for (const k of Object.keys(GAYA_LABELS)) {
      const st = byCat[k] || { sum: 0, count: 1 };
      scores[k] = Math.round((st.sum / (st.count * 4)) * 100);
    }
    hasil.gayaScores = scores;
    hasil.gayaDominant = topN(scores, 1)[0];
  }

  // ---------- BAKAT DIFERENSIAL ----------
  const bakatRows = rows.filter(r => r.kategori === 'BAKAT');
  if (bakatRows.length) {
    const byCat = {};
    for (const r of bakatRows) {
      const c = byCat[r.sub_kategori] || (byCat[r.sub_kategori] = { correct: 0, count: 0 });
      c.count += 1;
      if (r.benar) c.correct += 1;
    }
    const scores = {};
    for (const k of Object.keys(BAKAT_LABELS)) {
      const st = byCat[k] || { correct: 0, count: 1 };
      scores[k] = Math.round((st.correct / st.count) * 100);
    }
    const top = topN(scores, 1)[0];
    hasil.bakatScores = scores;
    hasil.bakatTop = top;
    hasil.bakatRekomendasi = (jenjang === 'sma' ? BAKAT_DESC_SMA : BAKAT_DESC_SMP)[top];
  }

  return hasil;
}
