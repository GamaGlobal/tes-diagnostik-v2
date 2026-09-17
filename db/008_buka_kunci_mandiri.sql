-- ============================================================
-- 008: buka kunci mandiri oleh peserta (pakai kode, lihat
--      app/api/attempt/buka-kunci-sendiri/route.js)
-- ============================================================

alter table sesi_tes
  add column if not exists percobaan_kunci_gagal integer not null default 0;
