-- ============================================================
-- 007: fitur tambahan panel /admin
--  1) Perbaikan bug skor "ngawur" saat "Paksa Selesaikan" (lihat
--     lib/scoring.js & app/api/attempt/finish/route.js) -- ditambahkan
--     kolom `lengkap` di tabel hasil supaya panel admin bisa menampilkan
--     dengan jelas kalau suatu hasil dihitung dari sesi yang BELUM
--     menjawab semua soal (bukan cuma mengandalkan skor rendah yang
--     mungkin tidak disadari panitia).
--  2) Tandai (flag) sesi tertentu untuk ditinjau ulang.
--  3) Hapus sesi/hasil salah-input langsung dari panel admin.
-- ============================================================

alter table hasil
  add column if not exists lengkap boolean;

alter table sesi_tes
  add column if not exists ditandai boolean not null default false,
  add column if not exists catatan_panitia text;

create index if not exists idx_sesi_ditandai on sesi_tes(ditandai) where ditandai;
