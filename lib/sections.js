// Porting metadata section dari buildSections()/DURATIONS di index.html.
// Konten soalnya sendiri datang dari database (bank_soal) lewat
// /api/attempt/soal — file ini cuma "bungkusnya" (judul, instruksi, contoh, durasi).

export const DURATIONS = {
  smp: { SE:360, WA:360, AN:420, GE:480, RA:600, ZR:600, FA:420, WU:540, MEMORIZE:180, ME:360 },
  sma: { SE:360, WA:360, AN:420, GE:480, RA:720, ZR:660, FA:360, WU:480, MEMORIZE:150, ME:330 },
};

export function getSectionMeta(jenjang) {
  const D = DURATIONS[jenjang] || DURATIONS.smp;
  return [
    { id:'SE', title:'Melengkapi Kalimat', tipe:'pilihan_tunggal',
      instruksi:'Pilih satu kata/frasa yang paling tepat untuk melengkapi setiap kalimat.',
      contoh:{ q:'Contoh: Matahari terbit di sebelah ....', pilihan:['Utara','Timur','Selatan','Barat'], jawaban:1 },
      durasi:D.SE },
    { id:'WA', title:'Pemilihan Kata', tipe:'pilihan_tunggal',
      instruksi:'Pilih satu kata yang paling berbeda / tidak sekelompok dengan yang lain.',
      contoh:{ q:'Contoh:', pilihan:['Kucing','Anjing','Kursi','Ayam'], jawaban:2 },
      durasi:D.WA },
    { id:'AN', title:'Analogi Verbal', tipe:'pilihan_tunggal',
      instruksi:'Lengkapi hubungan kata: A : B = C : ?',
      contoh:{ q:'Contoh: Api : Panas = Es : ?', pilihan:['Keras','Dingin','Cair','Berat'], jawaban:1 },
      durasi:D.AN },
    { id:'GE', title:'Persamaan Kata', tipe:'pilihan_tunggal',
      instruksi:'Pilih jawaban yang paling tepat menjelaskan persamaan dua kata berikut.',
      contoh:{ q:'Contoh: Apa persamaan "Kereta api" dan "Pesawat"?', pilihan:['Buah','Alat transportasi','Hewan','Pakaian'], jawaban:1 },
      durasi:D.GE },
    { id:'RA', title:'Soal Hitungan', tipe:'pilihan_tunggal',
      instruksi:'Selesaikan setiap soal cerita berikut, lalu pilih jawaban yang benar.',
      contoh:{ q:'Contoh: Jika 2 kg gula harganya Rp30.000, berapa harga 5 kg?', pilihan:['Rp60.000','Rp70.000','Rp75.000','Rp80.000'], jawaban:2 },
      durasi:D.RA },
    { id:'ZR', title:'Deret Angka', tipe:'seri_angka',
      instruksi:'Temukan pola pada deret angka, lalu pilih angka selanjutnya.',
      contoh:{ q:'Contoh: 2, 4, 8, 16, 32, ?', pilihan:['48','64','56','60'], jawaban:1 },
      durasi:D.ZR },
    { id:'FA', title:'Pemilihan Gambar', tipe:'figural',
      instruksi: jenjang==='sma'
        ? 'Perhatikan pola perubahan bentuk pada 3 gambar pertama (jumlah sisi & rotasi), lalu pilih gambar keempat yang melanjutkan pola tersebut.'
        : 'Perhatikan pola perubahan bentuk pada 3 gambar pertama, lalu pilih gambar keempat yang melanjutkan pola tersebut (jumlah sisi & warna).',
      contoh:null, durasi:D.FA },
    { id:'WU', title:'Tugas Kubus (Jaring-Jaring)', tipe:'kubus',
      instruksi:'Sebuah jaring-jaring kubus ditampilkan. Bila dilipat menjadi kubus, tentukan simbol yang berada pada sisi yang berhadapan (berlawanan) dengan sisi yang ditandai kotak biru.',
      contoh:null, durasi:D.WU },
    { id:'ME', title:'Tugas Ingatan', tipe:'memori',
      instruksi:'Hafalkan pasangan kelompok–item berikut selama waktu yang diberikan. Setelah waktu habis, Anda akan diuji tanpa melihat daftar lagi.',
      contoh:null, memorizeDurasi:D.MEMORIZE, durasi:D.ME },
    { id:'RIASEC', title:'Tes Minat (RIASEC)', tipe:'likert',
      instruksi:'Nyatakan seberapa suka Anda pada tiap aktivitas berikut.',
      contoh:null, durasi:600 },
    { id:'GAYA', title:'Tes Gaya Belajar', tipe:'likert',
      instruksi:'Nyatakan seberapa sesuai tiap pernyataan berikut dengan diri Anda.',
      contoh:null, durasi:420 },
    { id:'BAKAT', title:'Tes Bakat Diferensial', tipe:'pilihan_tunggal',
      instruksi:'Pilih jawaban yang paling tepat untuk tiap soal berikut.',
      contoh:null, durasi:900 },
  ];
}
