// Konstanta anti-curang yang dipakai BERSAMA oleh server (endpoint
// pelanggaran/answer/mulai-bagian/heartbeat/start) dan klien (app/tes/page.js)
// supaya jumlah peringatan & nama status selalu sinkron di satu tempat.
//
// Aturan: AMBANG_PELANGGARAN pelanggaran PERTAMA cuma PERINGATAN (siswa masih
// bisa lanjut mengerjakan). Begitu pelanggaran ke-(AMBANG_PELANGGARAN + 1)
// terjadi, sesi otomatis DIKUNCI (status -> STATUS_TERKUNCI) dan semua
// endpoint yang mengubah data tes (answer, mulai-bagian) menolak permintaan
// selanjutnya sampai panitia membuka kunci lewat panel /admin.
export const AMBANG_PELANGGARAN = 3;
export const STATUS_TERKUNCI = 'terkunci_pelanggaran';

// Batas percobaan salah untuk fitur "buka kunci mandiri" (peserta memasukkan
// sendiri kode dari panitia di layar terkunci, lihat
// app/api/attempt/buka-kunci-sendiri/route.js). Dibatasi supaya tidak bisa
// ditebak asal-asalan berkali-kali -- begitu limitnya habis, peserta HARUS
// minta panitia buka lewat panel /admin (tombol "Buka Kunci").
export const AMBANG_PERCOBAAN_KODE = 5;

// Jumlah varian pasangan kategori-item untuk tugas Ingatan (ME) — lihat
// db/010_versi_memori.sql. Tiap sesi BARU dapat satu varian ('v1'..'v4') yang
// ditentukan di app/api/attempt/start (rotasi berdasarkan urutan sesi yang
// sudah dibuat untuk jenjang yang sama), supaya siswa yang login/duduk
// berurutan/berdekatan besar kemungkinan dapat varian BERBEDA -- kalau salah
// satu menulis daftarnya, catatan itu tidak cocok untuk sesi tetangganya.
export const JUMLAH_VERSI_MEMORI = 4;
