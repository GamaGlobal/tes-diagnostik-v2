-- Migrasi 22 siswa yang datanya BELUM ADA/TIDAK LENGKAP di sistem lama
-- (9 skor hilang + 5 berhenti di tengah jalan + 8 belum mengerjakan sama sekali).
-- Password hash bcrypt dari password default akun lama, siswa TETAP login pakai
-- password yang sama seperti biasa -- tidak perlu reset/kasih tahu ulang.
-- Siswa yang datanya SUDAH valid di sistem lama (179 siswa) dimigrasikan lewat
-- jalur terpisah (impor data historis), tidak lewat file ini.
insert into siswa (username, password, nama, kelas, sekolah)
values ('27706', '$2b$10$gFNH879hiU5Q/o0L2SnVjOxBBrHujULwxviXO2taqnNhppLtBCG5q', 'ALIIFAH ZAKIRA RAMADHANI', '7A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27709', '$2b$10$14kmOd7IlJA5SssK5J5hL.h9qbUKttaSyUXhCnOi/tzPP/0Djih2C', 'AQILA ZAHRA', '7A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27714', '$2b$10$fgn/Hnhw/qDZgM/xcid0reLjBXoMhp1s3qDsd6ImhWqsNbStaFQDC', 'FAHMI RAJENDRA FAWAZ', '7A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27722', '$2b$10$U4IACsQw.Hms9zyMlI6F5uBnHpClL7Fn0vT4OumnSHU2qSOhGdUei', 'MIFTAHUL JANNAH', '7A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27726', '$2b$10$kieMVk7CZ03pSSzRqIgTgeBR1/DKXfdgQvk5EPuB71ryMNEESH84i', 'NATASYA AWWALIYA RAHMA', '7A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27732', '$2b$10$Db5CSgTMnhKajNRXL7bEd.U2twVylO44IfVcuIEjaRSe.GKakgCwa', 'SINDI IRHAMNI', '7A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27748', '$2b$10$JLSdgx29vhOabXR4uCpyg.QFTuzsJuFlhMfZW27/5Hkq.IUVvyTpq', 'HABIBBAH CHORINNA ULFAH', '7B', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27760', '$2b$10$HO44CLQoNT4ajKf6Li5UlOVX8LWG6.gASbCMqgHoY4si73gY8HStC', 'SAHRIL ABDUL HAPIZ', '7B', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27762', '$2b$10$BrA0jSSdCZmtQyIt0BFGs.QjrPyM7lZig9Lh5g1GT9wowZ.IMi3/u', 'SITI SHAFA ROHANI', '7B', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27779', '$2b$10$ZCVmdmghNJ3zBTXGt3zs3.WZSqwXhp2oxljp5lP3V/VHqtOGdYZVq', 'MEISYA THERENATERA', '7C', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27798', '$2b$10$iIZrvXUpq5x/xKr7qYEeruKJgSMuh5jbTkJ2n5WwdY3yCt5puhRBO', 'YUMNA FARIHA', '7C', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27815', '$2b$10$S0ClONAxAT3c8y1UZmYNTubZsUlHssYO/hQCRd2OwuNCNmnCWcjRy', 'HUSNA AULIA PUTRI', '7D', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27817', '$2b$10$bAN8jQ/wOGOvUEaZI/8Bc.xZ6cZL8/9K2BuoUJD/mADb3r8k0ggzS', 'MUHAMAD ALFIZ CASILAS', '7D', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27845', '$2b$10$ewG1kD1JvpfDZAAtXQjjq.NVhNk0Kbc1Y6g9Y8IfjPYDGn4r0pNeG', 'GAVRIEL ABYAN HAMDANI', '7E', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27847', '$2b$10$gjGwxfd.B/ncA5tPAfJRtuSjutw6XFqBdOUfcBvKGSfRG7oyAS4gG', 'IBRAHIM HAIKAL ALBAIHAQI', '7E', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27861', '$2b$10$28aZwnN.PB3OUK5nkAZa4efYWHkqAEup51NItFnvW1oD5hPb/5l2C', 'SITI MARIA ULFA', '7E', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27865', '$2b$10$5U6ZF128d2kHh7VbcCGwIex6lp9C55TQWWMSJ5s6uFYPcRscsuV5C', 'ARSYIELALTUL FATIMAH', '7F', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27868', '$2b$10$pFV0u77/M9Z25saweY8GZ.SyzNcIrek7ditHtO1kHDqhM9euzXinK', 'AURAH AWANGSIH', '7F', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27879', '$2b$10$mpezqSr6lPsBHEYtrWBsVuXI88gVSBPEmsk06SfHr8pqe88nSk2eu', 'MUHAMAD ALFARIZI', '7F', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27881', '$2b$10$yVRoPU9N0CO8c.xyNCZ0feW6CfcbtK.m.YdfdXgE9cL36nYK4kcwy', 'MUHAMAD SAID ABDURAHMAN', '7F', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27887', '$2b$10$NTIG1ZZuQgI7kvBBoyPIguLN625ImvEIzmSeUCAP48F6dKGjn1ayC', 'RAISA RAQILA NAJWA', '7F', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('27898', '$2b$10$mt8umb/GsXNVjEtkpA8Wieu0gwVU5Jo.3jsA3z/ofEBL4l/9b6PMa', 'MUTIA SAFIRA RAHMA', '8A', 'MTsN 3 Bekasi')
on conflict (username) do nothing;
