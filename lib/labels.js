// AUTO-EXTRACTED dari index.html (tes-diagnostik-main) — jangan diedit manual,
// edit sumbernya (index.html) lalu extract ulang kalau perlu revisi teks.

export const RIASEC_LABELS = {
  R: 'Realistic (Praktis/Teknik)', I: 'Investigative (Analitis/Riset)',
  A: 'Artistic (Kreatif/Seni)', S: 'Social (Sosial/Membantu)',
  E: 'Enterprising (Memimpin/Wirausaha)', C: 'Conventional (Terorganisir/Administratif)'
};
export const RIASEC_DESC = {
  R: 'Suka pekerjaan praktis, teknis, dan melibatkan alat/mesin/kerja fisik.',
  I: 'Suka menganalisis, meneliti, dan memecahkan masalah secara ilmiah.',
  A: 'Suka berekspresi lewat seni, ide orisinal, dan cara-cara kreatif.',
  S: 'Suka membantu, mengajar, dan berinteraksi dengan orang lain.',
  E: 'Suka memimpin, memengaruhi orang lain, dan mengambil risiko usaha.',
  C: 'Suka pekerjaan yang terstruktur, rapi, dan berbasis data/prosedur.'
};
export const GAYA_LABELS = { V: 'Visual', A: 'Auditori', K: 'Kinestetik' };
export const GAYA_DESC = {
  V: 'Belajar paling efektif lewat gambar, warna, diagram, dan materi tertulis/visual.',
  A: 'Belajar paling efektif lewat mendengarkan penjelasan, diskusi, dan suara.',
  K: 'Belajar paling efektif lewat praktik langsung, gerakan, dan pengalaman fisik.'
};
export const BAKAT_LABELS = {
  MIPA: 'Matematika & Sains (MIPA)', IPS: 'Ilmu Pengetahuan Sosial (IPS)',
  BHS: 'Bahasa & Sastra', INF: 'Informatika & Logika Komputasi', VOK: 'Vokasi & Keterampilan Teknis'
};
export const BAKAT_DESC_SMA = {
  MIPA: 'Kuat di penalaran matematis & sains. Mapel pilihan yang relevan: Matematika Tingkat Lanjut, Fisika, Kimia, Biologi.',
  IPS: 'Kuat di pemahaman fenomena sosial-ekonomi. Mapel pilihan yang relevan: Sosiologi, Ekonomi, Geografi, Antropologi.',
  BHS: 'Kuat di bahasa & sastra. Mapel pilihan yang relevan: Bahasa Inggris Tingkat Lanjut, Bahasa/Sastra Indonesia Tingkat Lanjut, Bahasa asing pilihan.',
  INF: 'Kuat di logika komputasional. Mapel pilihan yang relevan: Informatika.',
  VOK: 'Kuat di keterampilan teknis-praktis. Mapel pilihan yang relevan: mata pelajaran Vokasi/Prakarya sesuai bidang keahlian.'
};
export const BAKAT_DESC_SMP = {
  MIPA: 'Kuat di penalaran matematis & sains. Arahkan bakat ini lewat: klub sains/matematika, olimpiade MIPA, eksperimen sains, atau ekstrakurikuler robotik.',
  IPS: 'Kuat di pemahaman fenomena sosial-ekonomi. Arahkan bakat ini lewat: debat, jurnalistik sekolah/mading, OSIS/organisasi siswa, atau kegiatan sosial kemasyarakatan.',
  BHS: 'Kuat di bahasa & sastra. Arahkan bakat ini lewat: klub menulis, lomba pidato/debat bahasa, mading sekolah, atau kursus bahasa asing.',
  INF: 'Kuat di logika komputasional. Arahkan bakat ini lewat: klub coding/robotik, kompetisi informatika, atau belajar pemrograman dasar.',
  VOK: 'Kuat di keterampilan teknis-praktis. Arahkan bakat ini lewat: ekstrakurikuler keterampilan/prakarya, kursus keterampilan teknis, atau kegiatan vokasi tingkat dasar.'
};
export const DOMAIN_MAP = { SE:'Verbal', WA:'Verbal', AN:'Verbal', GE:'Verbal', RA:'Numerik', ZR:'Numerik', FA:'Figural', WU:'Figural', ME:'Memori' };

export function classify(iq) {
  if (iq >= 130) return 'Sangat Superior';
  if (iq >= 120) return 'Superior';
  if (iq >= 110) return 'Di Atas Rata-rata';
  if (iq >= 90) return 'Rata-rata';
  if (iq >= 80) return 'Di Bawah Rata-rata';
  if (iq >= 70) return 'Batas Lemah (Borderline)';
  return 'Perlu Asesmen Lanjutan';
}

// Skala likert RIASEC/GAYA — index di array = value-1 (Tidak Suka=1 ... Sangat Suka=4)
export const SKALA_RIASEC = ['Tidak Suka', 'Kurang Suka', 'Suka', 'Sangat Suka'];
export const SKALA_GAYA = ['Tidak Sesuai', 'Kurang Sesuai', 'Sesuai', 'Sangat Sesuai'];
