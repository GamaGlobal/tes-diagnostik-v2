// ============================================================
// Pemetaan kolom REKAP HASIL agar identik dengan sheet
// "Hasil Tes Diagnostik" milik tes diagnostik v1 (Apps Script / Code.gs).
//
// Kenapa perlu: panitia memegang dua sumber data — file Google Sheet dari
// sistem lama dan database SimTKA-v2. Kalau nama & urutan kolomnya sama
// persis, dua file itu tinggal ditumpuk (copy-paste / UNION) lalu dianalisis
// sebagai satu tabel, tanpa merapikan header manual.
//
// URUTAN kolom di bawah ini SENGAJA sama persis dengan headerHasil_() di
// Code.gs. Jangan menyisipkan kolom di tengah — kolom khas v2 ditaruh di
// blok terakhir (setelah 'Versi Bank Soal').
// ============================================================

// Rumpun bakat — 6 rumpun, harus sinkron dengan BAKAT_LABELS di lib/labels.js
// dan BAKAT_KOLOM di Code.gs.
export const BAKAT_KOLOM = [
  { key: 'MIPA', label: 'MIPA (%)' },
  { key: 'IPS', label: 'IPS (%)' },
  { key: 'BHS', label: 'Bahasa (%)' },
  { key: 'INF', label: 'Informatika (%)' },
  { key: 'VOK', label: 'Vokasi (%)' },
  { key: 'AGM', label: 'Keagamaan (%)' },
];

const IST_KATEGORI = ['SE', 'WA', 'AN', 'GE', 'RA', 'ZR', 'FA', 'WU', 'ME'];
const RIASEC_KEY = ['R', 'I', 'A', 'S', 'E', 'C'];

const DASH = '-';
const nz = (v) => (v === null || v === undefined || v === '' ? DASH : v);
const dariJson = (obj, key) => (obj && obj[key] !== undefined && obj[key] !== null ? obj[key] : DASH);
const waktu = (iso) => (iso ? new Date(iso).toLocaleString('id-ID') : DASH);

/**
 * Ubah satu baris v_rekap_hasil jadi objek dengan KUNCI = header sheet v1.
 */
export function barisRekapKeSheet(r) {
  const subskor = r.subskor || {};
  const riasec = r.riasec_scores || {};
  const gaya = r.gaya_scores || {};
  const bakat = r.bakat_scores || {};

  const out = {
    // --- blok identik dengan sheet v1 ---
    'Timestamp': waktu(r.selesai_at || r.dihitung_at || r.mulai_at),
    'Nama': nz(r.nama),
    'Sekolah': nz(r.sekolah),
    'Kelas': nz(r.kelas),
    'NIS': nz(r.nis || r.username),
    'Status': nz(r.status_label),
    'Catatan': nz(r.catatan_panitia),
    'Level IST': nz(r.level_ist),          // SMA / SMP
  };
  IST_KATEGORI.forEach(k => { out[k] = dariJson(subskor, k); });
  out['Total Benar'] = nz(r.total_benar);
  out['Total Soal'] = nz(r.total_soal);
  out['Persentase (%)'] = nz(r.persentase);
  out['Estimasi IQ'] = nz(r.estimasi_iq);
  out['Klasifikasi'] = nz(r.klasifikasi);  // "Rata-rata"/"Superior"/dst.
  out['Verbal (%)'] = nz(r.verbal_persen);
  out['Numerik (%)'] = nz(r.numerik_persen);
  out['Figural (%)'] = nz(r.figural_persen);
  out['Memori (%)'] = nz(r.memori_persen);

  out['Kode RIASEC (3 Besar)'] = nz(r.riasec_top);
  RIASEC_KEY.forEach(k => { out[`${k} (%)`] = dariJson(riasec, k); });

  out['Gaya Belajar Dominan'] = nz(r.gaya_dominant);
  out['Visual (%)'] = dariJson(gaya, 'V');
  out['Auditori (%)'] = dariJson(gaya, 'A');
  out['Kinestetik (%)'] = dariJson(gaya, 'K');

  out['Jumlah Pelanggaran'] = r.pelanggaran_jumlah ?? r.cheat_count ?? 0;
  out['Detail Pelanggaran'] = r.pelanggaran_detail || '';

  out['Bakat Dominan'] = nz(r.bakat_top);
  out['Rekomendasi Mapel Pilihan'] = nz(r.bakat_rekomendasi);
  BAKAT_KOLOM.forEach(b => { out[b.label] = dariJson(bakat, b.key); });

  out['Versi Bank Soal'] = nz(r.item_bank_version);

  // --- blok khas v2 (tidak ada di sheet lama, ditaruh paling belakang) ---
  out['Sumber Data'] = 'SimTKA-v2';
  out['Semua Soal Terjawab?'] = r.lengkap === true ? 'Ya'
    : r.lengkap === false ? 'TIDAK (soal belum semua terjawab)' : DASH;
  out['Jumlah Soal Terjawab'] = r.jumlah_terjawab ?? DASH;
  out['Sumber Skor'] = r.sumber === 'manual_panitia' ? 'Dihitung ulang (paksa panitia)' : 'Otomatis';
  out['Ditandai Panitia'] = r.ditandai ? 'Ya' : 'Tidak';
  out['Mulai'] = waktu(r.mulai_at);
  out['Selesai'] = waktu(r.selesai_at);
  out['Username'] = nz(r.username);
  out['Sesi ID'] = nz(r.sesi_id);

  return out;
}

/** Urutan header final — dipakai sebagai urutan kolom di file Excel/CSV. */
export function headerRekapSheet() {
  const h = [
    'Timestamp', 'Nama', 'Sekolah', 'Kelas', 'NIS', 'Status', 'Catatan', 'Level IST',
    ...IST_KATEGORI,
    'Total Benar', 'Total Soal', 'Persentase (%)', 'Estimasi IQ', 'Klasifikasi',
    'Verbal (%)', 'Numerik (%)', 'Figural (%)', 'Memori (%)',
    'Kode RIASEC (3 Besar)', ...RIASEC_KEY.map(k => `${k} (%)`),
    'Gaya Belajar Dominan', 'Visual (%)', 'Auditori (%)', 'Kinestetik (%)',
    'Jumlah Pelanggaran', 'Detail Pelanggaran',
    'Bakat Dominan', 'Rekomendasi Mapel Pilihan',
    ...BAKAT_KOLOM.map(b => b.label),
    'Versi Bank Soal',
  ];
  return h.concat([
    'Sumber Data', 'Semua Soal Terjawab?', 'Jumlah Soal Terjawab', 'Sumber Skor',
    'Ditandai Panitia', 'Mulai', 'Selesai', 'Username', 'Sesi ID',
  ]);
}
