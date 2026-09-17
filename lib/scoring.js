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

// `totalPerKategori`: { SE: 12, WA: 12, ... , BAKAT_MIPA: 8, ... } — jumlah soal
// yang SEBENARNYA ditugaskan untuk jenjang ini (dari bank_soal), dipakai
// sebagai PENYEBUT skor. Ini untuk memperbaiki bug lama: kalau dibiarkan
// null/undefined, fungsi ini fallback ke perilaku lama (penyebut = jumlah
// soal yang SUDAH DIJAWAB) — itulah yang membuat sesi yang di-"Paksa
// Selesaikan" saat baru dijawab 1-2 soal (dan kebetulan benar semua) bisa
// keluar 100% / IQ 135 "Sangat Superior": soal yang tidak sempat dijawab
// sama sekali tidak pernah dihitung sebagai salah, jadi tidak pernah
// menurunkan persentase. Dengan total asli sebagai penyebut, soal yang
// belum dijawab otomatis dianggap 0 (belum tentu salah, tapi tidak
// menyumbang skor), sehingga hasil sesi yang belum selesai tidak lagi
// tampak seperti skor sempurna.
export function computeHasil(rows, jenjang, totalPerKategori) {
  const hasil = {};

  // ---------- IST (SE/WA/AN/GE/RA/ZR/FA/WU/ME) ----------
  const istRows = rows.filter(r => IST_KATEGORI.has(r.kategori));
  const istKategoriTerpakai = new Set(istRows.map(r => r.kategori));
  if (totalPerKategori) {
    for (const k of Object.keys(DOMAIN_MAP)) {
      if (totalPerKategori[k]) istKategoriTerpakai.add(k);
    }
  }
  if (istKategoriTerpakai.size) {
    const perKategori = {}; // {SE:{correct,total,dijawab}, ...}
    for (const k of istKategoriTerpakai) {
      perKategori[k] = { correct: 0, total: (totalPerKategori && totalPerKategori[k]) || 0, dijawab: 0 };
    }
    for (const r of istRows) {
      const k = perKategori[r.kategori] || (perKategori[r.kategori] = { correct: 0, total: 0, dijawab: 0 });
      k.dijawab += 1;
      if (!totalPerKategori) k.total += 1; // fallback lama: tanpa total asli, pakai jumlah terjawab
      if (r.benar) k.correct += 1;
    }

    const perDomain = {}; // {Verbal:{correct,total}, ...}
    for (const [k, v] of Object.entries(perKategori)) {
      const domain = DOMAIN_MAP[k];
      if (!domain) continue;
      const d = perDomain[domain] || (perDomain[domain] = { correct: 0, total: 0 });
      d.correct += v.correct;
      d.total += v.total;
    }

    const totalCorrect = Object.values(perKategori).reduce((s, v) => s + v.correct, 0);
    const totalMax = Object.values(perKategori).reduce((s, v) => s + v.total, 0);
    const totalDijawab = Object.values(perKategori).reduce((s, v) => s + v.dijawab, 0);
    const pct = totalMax ? (totalCorrect / totalMax) * 100 : 0;
    let iq = Math.round(pct + 35);
    iq = Math.max(55, Math.min(145, iq));

    hasil.level = jenjang === 'sma' ? 'SMA' : 'SMP';
    hasil.iqScores = Object.fromEntries(Object.entries(perKategori).map(([k, v]) => [k, v.correct]));
    hasil.iqTotalCorrect = totalCorrect;
    hasil.iqTotalMax = totalMax;
    hasil.iqTotalDijawab = totalDijawab;
    hasil.iqLengkap = totalMax > 0 && totalDijawab >= totalMax;
    hasil.iqPercentage = Math.round(pct);
    hasil.iq = iq;
    hasil.iqClassification = classify(iq);
    hasil.iqDomain = Object.fromEntries(
      Object.entries(perDomain).map(([d, v]) => [d, v.total ? Math.round((v.correct / v.total) * 100) : 0])
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
  // Sama seperti IST di atas: penyebutnya HARUS jumlah soal bakat yang
  // sungguh-sungguh ditugaskan per sub-kategori (dari totalPerKategori,
  // dikirim dengan kunci "BAKAT_<sub_kategori>"), bukan cuma yang sempat
  // dijawab -- kalau tidak, sesi yang dipaksa selesai sebelum tes bakat
  // dikerjakan bisa salah tampil skor 100% pada sub-kategori yang baru
  // dijawab 1 soal dan kebetulan benar.
  const bakatRows = rows.filter(r => r.kategori === 'BAKAT');
  const bakatSubTerpakai = new Set(bakatRows.map(r => r.sub_kategori));
  if (totalPerKategori) {
    for (const k of Object.keys(BAKAT_LABELS)) {
      if (totalPerKategori[`BAKAT_${k}`]) bakatSubTerpakai.add(k);
    }
  }
  if (bakatSubTerpakai.size) {
    const byCat = {};
    for (const k of bakatSubTerpakai) {
      byCat[k] = { correct: 0, total: (totalPerKategori && totalPerKategori[`BAKAT_${k}`]) || 0, dijawab: 0 };
    }
    for (const r of bakatRows) {
      const c = byCat[r.sub_kategori] || (byCat[r.sub_kategori] = { correct: 0, total: 0, dijawab: 0 });
      c.dijawab += 1;
      if (!totalPerKategori) c.total += 1; // fallback lama
      if (r.benar) c.correct += 1;
    }
    const scores = {};
    let bakatTotalDijawab = 0, bakatTotalMax = 0;
    for (const k of Object.keys(BAKAT_LABELS)) {
      const st = byCat[k] || { correct: 0, total: 0, dijawab: 0 };
      scores[k] = st.total ? Math.round((st.correct / st.total) * 100) : 0;
      bakatTotalDijawab += st.dijawab;
      bakatTotalMax += st.total;
    }
    const top = topN(scores, 1)[0];
    hasil.bakatScores = scores;
    hasil.bakatTop = top;
    hasil.bakatRekomendasi = (jenjang === 'sma' ? BAKAT_DESC_SMA : BAKAT_DESC_SMP)[top];
    hasil.bakatLengkap = bakatTotalMax > 0 && bakatTotalDijawab >= bakatTotalMax;
  }

  return hasil;
}
