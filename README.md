# Simulasi Tes IST — Backend Neon + Next.js

## Setup lokal

```bash
npm install
cp .env.example .env
# isi DATABASE_URL dari dashboard Neon (bikin project baru dulu di neon.tech,
# pilih region Singapore biar latensi ke Indonesia rendah)

npm run db:migrate
# menjalankan db/001_schema.sql -> db/002_bank_soal.sql (446 soal) ->
# db/003_siswa_belum_selesai.sql (22 akun siswa yang perlu tes ulang)

npm run dev
# buka http://localhost:3000
```

## Struktur

```
app/page.js                 -> landing (link ke /tes, /admin, /hasil)
app/tes/page.js             -> UI siswa: login, per-bagian, timer, anti-cheat, hasil
app/admin/page.js           -> panel panitia: live monitor + paksa selesaikan
app/hasil/page.js           -> iframe ke public/hasil-diagnostik.html (lihat bagian
                                "Hasil Tes Diagnostik" di bawah — masih data statis)
app/globals.css             -> desain shared (dipakai app/tes & app/admin), gaya sama seperti SimTKA-v2
app/api/attempt/start/       -> login (password) + resume sesi lama milik akun itu
app/api/attempt/resume/      -> resume TANPA password saat /tes di-refresh (pakai sesiId
                                 dari sessionStorage) -- progres & sisa waktu selalu
                                 diambil ulang dari sini, tidak dipercaya dari sessionStorage
app/api/attempt/mulai-bagian/-> catat kapan sebuah fase berwaktu (menghafal/mengerjakan)
                                 dimulai & DEADLINE-nya di server (anti-curang: refresh
                                 tidak bisa dipakai untuk reset waktu, lihat bagian
                                 "Timer & Anti-Curang" di bawah)
app/api/attempt/answer/      -> AUTOSAVE per jawaban (inti perbaikan dari sistem lama)
app/api/attempt/heartbeat/   -> update progres + resync sisa waktu + deteksi sesi ganda
app/api/attempt/pelanggaran/ -> catat SATU kejadian pelanggaran (pindah tab, copy,
                                 paste, klik kanan, dst) begitu terjadi
app/api/attempt/finish/      -> hitung & simpan hasil (dipakai siswa & panitia)
app/api/admin/monitor/       -> data untuk panel /admin (gate: header x-panitia-pin)
lib/db.js                   -> koneksi Neon
lib/labels.js               -> label/deskripsi RIASEC, GAYA, BAKAT (dari index.html)
lib/scoring.js              -> port computeResults() — hitung IQ, RIASEC, gaya belajar, bakat
db/001_schema.sql           -> skema tabel (siswa, bank_soal, sesi_tes, jawaban, hasil, dst.)
db/002_bank_soal.sql        -> 446 soal hasil extract dari index.html
db/003_siswa_belum_selesai.sql -> 22 akun siswa yang datanya belum ada/tidak lengkap
db/004_tahap_waktu_anti_curang.sql -> kolom timer server-side (tahap_fase, tahap_deadline_at)
                                      + tab_token untuk deteksi sesi ganda
scripts/migrate.js          -> jalankan semua db/*.sql berurutan
```

## Timer & Anti-Curang

**Masalah di versi sebelumnya:** sisa waktu tiap bagian cuma state React di
klien. Refresh di tengah mengerjakan -> balik ke layar "Mulai Bagian" -> klik
lagi -> dapat waktu PENUH baru untuk soal yang sama. Itu jadi celah curang,
bukan proteksi.

**Sekarang, timer otoritatif di server:**
- Begitu siswa klik "Mulai Bagian" / "Sudah Hafal, Mulai Soal", klien memanggil
  `POST /api/attempt/mulai-bagian` — server menghitung `tahap_deadline_at`
  (sekarang + durasi bagian **dari `lib/sections.js`, bukan dari body
  request**) dan menyimpannya di `sesi_tes`.
- Refresh halaman -> `GET /api/attempt/resume?sesiId=...` mengambil ulang
  `tahap_fase` & sisa waktu (`tahap_deadline_at - now()`) dari server, lalu
  siswa diarahkan LANGSUNG ke layar yang sama (bukan mundur ke welcome/intro)
  dengan sisa waktu yang benar. sessionStorage cuma menyimpan `sesiId` sebagai
  penunjuk, bukan progres/jawaban/waktu — supaya tidak bisa diubah manual
  lewat DevTools untuk curang.
- Kalau tes sudah selesai, refresh langsung menampilkan hasil lagi (bukan
  balik ke form login), juga lewat endpoint yang sama.
- Heartbeat tiap 20 detik juga mengoreksi ulang sisa waktu di klien kalau
  meleset, dan mendeteksi kalau sesi yang sama ternyata sedang aktif di
  tab/perangkat lain (`tab_token`) — kalau iya, muncul peringatan lunak,
  tidak mengunci layar (supaya koneksi yang putus-nyambung tidak sampai
  mengunci siswa dari tes-nya sendiri).

**Deteksi pelanggaran** (`POST /api/attempt/pelanggaran`, dicatat langsung
saat kejadian ke tabel `pelanggaran`, bukan ditumpuk & gampang dipalsukan
lewat heartbeat seperti sebelumnya):
- pindah tab / minimize (`visibilitychange`)
- jendela kehilangan fokus (`blur`)
- copy / paste **diblokir** di layar soal, sekaligus tercatat
- klik kanan **diblokir**, sekaligus tercatat
- sesi yang sama terdeteksi aktif di tab/perangkat lain

Rincian jenis pelanggaran per siswa muncul saat hover badge "Pelanggaran" di
panel `/admin` (bukan cuma satu angka total seperti sebelumnya).

**Penguncian otomatis setelah 3 peringatan** (`lib/anti-curang.js`):
3 pelanggaran pertama cuma memunculkan peringatan ke siswa ("Peringatan 2
dari 3"), tes tetap bisa dilanjutkan. Begitu pelanggaran ke-4 terjadi, sesi
otomatis dikunci (`status = 'terkunci_pelanggaran'`) — layar soal langsung
diganti layar "Tes Dikunci Sistem", dan endpoint `answer`/`mulai-bagian`
menolak permintaan berikutnya (kode 423) sampai dibuka lagi. Penguncian ini
juga dicek ulang saat login (`/api/attempt/start`), jadi siswa tidak bisa
lolos dengan logout lalu login lagi.

Panitia membuka kunci lewat panel `/admin` (tombol **🔓 Buka Kunci** yang
muncul di baris "Sedang Mengerjakan" untuk sesi berstatus terkunci) —
menghapus statusnya kembali ke `mengerjakan` dan mereset hitungan
pelanggaran ke 0. Kalau panitia menilai sesi itu sebaiknya diakhiri saja,
tombol **Paksa Selesaikan** yang sudah ada tetap bisa dipakai untuk status
apa pun, termasuk yang terkunci. Ambang 3 peringatan bisa diubah di satu
tempat: `lib/anti-curang.js`.

## Panel Panitia (`/admin`)

Masuk pakai `PANITIA_PIN` (env var yang sama dipakai untuk tombol "Paksa
Selesaikan"). Menampilkan dua tab:
- **Sedang Mengerjakan** — nama, progres bagian, jumlah soal terjawab,
  pelanggaran (pindah tab), dan status Aktif/Idle/Kemungkinan ditinggal
  (dihitung dari `heartbeat_at`, auto-refresh tiap 15 detik).
- **Sudah Selesai** — rekap hasil (level IQ, skor IST, kode RIASEC, gaya
  belajar dominan, bakat terkuat).

Tombol **Paksa Selesaikan** memanggil `POST /api/attempt/finish` dengan
`{ sesiId, dipaksaOleh: PANITIA_PIN }` — endpoint yang sama dipakai siswa,
jadi hasil selalu dihitung ulang dari jawaban yang sudah tersimpan di DB.

## Hasil Tes Diagnostik (`/hasil`)

Portal untuk pihak sekolah (rekap angkatan per sekolah, tabel peserta,
ekspor Excel/PDF) dan untuk peserta didik (cek hasil individu pakai NIS —
profil IST, RIASEC, gaya belajar, bakat inferensial). File-nya ada di
`public/hasil-diagnostik.html` — satu dokumen HTML mandiri (fonts + SheetJS
di-inline, chart pakai SVG/CSS murni tanpa Chart.js) yang di-`<iframe>` apa
adanya lewat `app/hasil/page.js`, supaya CSS/JS-nya tidak bentrok dengan
`globals.css` & halaman Next.js lain.

**Penting — ini masih data statis, bukan query langsung ke tabel `hasil`
di Neon:** isinya adalah snapshot 180 peserta dari hasil tes diagnostik
batch lama (`HASIL_TES_DIAGNOSTIK_SINKRON.xlsx`, sistem sebelum migrasi
ke Next.js ini), *bukan* hasil yang otomatis update begitu ada siswa baru
selesai tes lewat `/tes`. Karena baru 22 dari 201 akun yang sudah
dimigrasikan ke sistem baru (lihat bagian "Siapa saja yang sudah
dimigrasikan" di bawah), menyambungkannya ke data live di tabel `hasil`
perlu langkah tambahan dulu:
1. Import histori 180 peserta itu ke tabel `hasil` (kalau belum ada
   kolom untuk skor IST/RIASEC/gaya-belajar/bakat-inferensial di skema
   sekarang, perlu migrasi skema dulu — cek `db/001_schema.sql`).
2. Ganti `public/hasil-diagnostik.html` dari data ter-embed jadi
   fetch ke endpoint baru, mis. `GET /api/hasil/sekolah` &
   `GET /api/hasil/siswa?nis=...` (pola sama seperti
   `app/api/admin/monitor/route.js`), supaya datanya selalu ikut
   pertambahan siswa yang baru selesai tes.
3. Password sekolah di file itu masih hardcoded (`ADMIN_PASSWORD =
   'diagnostik2026'`, cari `// TODO`) — sebaiknya dipindah ke gate
   `PANITIA_PIN`/env var yang sama seperti `/admin`, bukan password
   di client-side JS, begitu sudah terhubung ke data live.

Belum saya kerjakan otomatis di paket ini karena itu artinya ubah skema
DB produksi — lebih aman ditentukan & dijalankan sendiri dulu baru saya
bantu lanjutkan kalau sudah siap.

## Siapa saja yang sudah dimigrasikan ke tabel `siswa`

**Baru 22 dari 201 akun** — sengaja diprioritaskan yang datanya *belum ada*
di sistem lama, supaya mereka bisa langsung tes ulang lewat sistem baru yang
lebih aman:
- 9 siswa: "Selesai" di LiveMonitor lama tapi skor hilang
- 5 siswa: sempat mulai lalu berhenti di tengah jalan
- 8 siswa: belum mengerjakan sama sekali

179 siswa yang datanya **sudah valid** di sistem lama belum dimigrasikan
sebagai akun aktif di sini — kalau perlu login ke sistem baru juga, tinggal
jalankan migrasi akun penuh (bcrypt semua 201, seperti `003_siswa_belum_selesai.sql`
tapi untuk seluruh `AKUN_SISWA_MTSN_3_BEKASI.xlsx`), dan hasil historis mereka
bisa diimpor terpisah ke tabel `hasil` supaya riwayatnya tidak hilang.

## Deploy ke repo yang sudah ada (GamaGlobal/tes-diagnostik) — langsung ke `main`

```bash
git clone https://github.com/GamaGlobal/tes-diagnostik.git
cd tes-diagnostik

# salin semua isi paket ini (tes-ist-next/) ke dalam folder repo yang baru
# di-clone ini (timpa/gabung — 4 file html lama sudah disalin ke public/legacy/
# di paket ini juga, supaya tetap bisa diakses, mis.
# tes-diagnostik.vercel.app/legacy/index.html, bukannya hilang begitu saja)

git add -A
git commit -m "Migrasi backend ke Next.js + Neon (autosave per-jawaban, hasil selalu dihitung ulang dari DB)"
git push origin main
```

**Sebelum push**, isi dulu env var di dashboard Vercel project ini
(**Project Settings → Environment Variables**) — `DATABASE_URL` dari Neon
wajib ada duluan, supaya begitu ter-deploy API-nya langsung bisa jalan
(kalau kosong, halaman/endpoint akan error sampai env var-nya diisi):
- `DATABASE_URL` — isi sekarang
- `PANITIA_PIN` — bisa menyusul kapan saja, tidak menghalangi deploy

Setelah env var terisi dan sudah push:
1. Vercel biasanya otomatis mendeteksi `package.json` dan pindah dari preset
   "Other" (statis) ke **"Next.js"**. Kalau tidak otomatis, ubah manual di
   **Project Settings → General → Framework Preset**.
2. Jalankan migrasi database sekali dari lokal (`npm run db:migrate` dengan
   `DATABASE_URL` yang sama), karena `db:migrate` bukan bagian dari build Vercel.
3. Cek `tes-diagnostik.vercel.app` sudah jalan (halaman `/` dan endpoint API-nya).

Saya tidak punya akses langsung untuk push ke GitHub dari sini (tidak pegang
kredensial repo Anda) — jadi bagian `git clone/push` di atas perlu dijalankan
dari komputer Anda sendiri, tapi seluruh isi filenya sudah siap di paket ini,
tinggal salin-tempel.


Status: sudah selesai —
1. ✅ **Halaman tes untuk siswa** (`app/tes/page.js`) — desain disamakan dengan SimTKA-v2.
2. ✅ **Dashboard panitia & Live Monitor** (`app/admin/page.js` + `app/api/admin/monitor/`).
3. ✅ **Tombol "Paksa Selesaikan"** di Live Monitor — panggil
   `POST /api/attempt/finish` dengan `{ sesiId, dipaksaOleh: PANITIA_PIN }`.
4. ✅ **Portal hasil** (`app/hasil/page.js`) — masih data statis (snapshot 180
   peserta batch lama), belum tersambung ke tabel `hasil` yang live; lihat
   bagian "Hasil Tes Diagnostik" untuk langkah lanjutannya.
5. Deploy: `vercel --prod` (hubungkan env `DATABASE_URL` & `PANITIA_PIN` di
   dashboard Vercel), pola sama seperti `simtka-2026-new`.
