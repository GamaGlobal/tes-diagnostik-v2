-- ============================================================
-- Timer per-bagian sekarang OTORITATIF DI SERVER, bukan cuma state React di
-- klien. Sebelumnya: refresh di tengah bagian -> balik ke layar "Mulai
-- Bagian" -> klik lagi -> dapat waktu PENUH baru, padahal soalnya sama persis
-- (celah curang, bukan anti-curang). Sekarang: begitu bagian dimulai, server
-- mencatat kapan batas waktunya berakhir (tahap_deadline_at), dan sisa waktu
-- pada resume/refresh/login-ulang SELALU dihitung ulang dari situ:
--   sisaDetik = tahap_deadline_at - now()
-- Durasinya sendiri diambil server dari lib/sections.js (bukan dari body
-- request), jadi klien tidak bisa minta durasi/deadline sendiri.
-- ============================================================

alter table sesi_tes
  add column if not exists tahap_fase        text not null default 'welcome',
    -- 'welcome' | 'intro' | 'memorize' | 'mengerjakan' — fase yang sedang
    -- aktif untuk tahap_ke saat ini; dipakai supaya refresh langsung
    -- kembali ke LAYAR YANG SAMA, bukan mundur ke welcome/intro (yang kalau
    -- dipaksa mundur berarti buang-buang sisa waktu bagian secara tidak adil,
    -- karena deadline-nya sudah absolut di server)
  add column if not exists tahap_mulai_at    timestamptz,
  add column if not exists tahap_deadline_at timestamptz,
  add column if not exists tab_token         text;
    -- token acak per-tab aktif (dibuat klien, disimpan di sessionStorage
    -- supaya tetap sama saat di-refresh tapi beda kalau dibuka di tab/
    -- device lain) -> dipakai /api/attempt/heartbeat untuk mendeteksi &
    -- memberi peringatan "sesi ini juga aktif di tab/perangkat lain"

-- Anti-curang: pelanggaran sekarang dicatat SATU-PER-SATU dan LANGSUNG saat
-- kejadian (lewat /api/attempt/pelanggaran) ke tabel `pelanggaran` yang
-- sebenarnya sudah ada dari 001_schema.sql tapi belum pernah diisi —
-- sebelumnya cuma ada satu angka cheat_count yang di-overwrite oleh KLIEN
-- lewat heartbeat tiap 20 detik (gampang dipalsukan: klien tinggal selalu
-- kirim cheatCount:0). Sekarang cheat_count di sesi_tes HANYA pernah
-- ditambah oleh server sendiri di endpoint /api/attempt/pelanggaran.
