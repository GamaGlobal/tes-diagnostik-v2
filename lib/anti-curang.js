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
