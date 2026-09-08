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
app/page.js                 -> landing (link ke /tes dan /admin)
app/tes/page.js             -> UI siswa: login, per-bagian, timer, anti-cheat, hasil
app/admin/page.js           -> panel panitia: live monitor + paksa selesaikan
app/globals.css             -> desain shared (dipakai app/tes & app/admin), gaya sama seperti SimTKA-v2
app/api/attempt/start/      -> mulai/resume sesi tes (login + cek sesi lama)
app/api/attempt/answer/     -> AUTOSAVE per jawaban (inti perbaikan dari sistem lama)
app/api/attempt/heartbeat/  -> update progres (utk Live Monitor)
app/api/attempt/finish/     -> hitung & simpan hasil (dipakai siswa & panitia)
app/api/admin/monitor/      -> data untuk panel /admin (gate: header x-panitia-pin)
lib/db.js                   -> koneksi Neon
lib/labels.js               -> label/deskripsi RIASEC, GAYA, BAKAT (dari index.html)
lib/scoring.js              -> port computeResults() — hitung IQ, RIASEC, gaya belajar, bakat
db/001_schema.sql           -> skema tabel (siswa, bank_soal, sesi_tes, jawaban, hasil, dst.)
db/002_bank_soal.sql        -> 446 soal hasil extract dari index.html
db/003_siswa_belum_selesai.sql -> 22 akun siswa yang datanya belum ada/tidak lengkap
scripts/migrate.js          -> jalankan semua db/*.sql berurutan
```

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
4. Deploy: `vercel --prod` (hubungkan env `DATABASE_URL` & `PANITIA_PIN` di
   dashboard Vercel), pola sama seperti `simtka-2026-new`.
