-- Migrasi 006: 640 akun siswa MAN 1 Bogor kelas X (16 kelas, X 1 s.d X 16)
-- Password sama untuk semua siswa (default dari panitia sekolah): Man1bgr#27
-- Sekolah: MAN 1 Bogor

insert into siswa (username, password, nama, kelas, sekolah)
values ('28178', '$2b$10$LCPVwicz17EqbTlVa8hRyuR0OANZUP9xBiL.hL0JAiYWBp1KOVTgK', 'ABHIARYA GALIH AZZAIDAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28179', '$2b$10$6aIleGE4xTnVueaHFdzEu.2oAd6IS39D.WS4GVj2uk9CigMKfqu4S', 'ABIGAIL SYAFIA GRACE CAMILLA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28180', '$2b$10$aefKD8HMutft5PaUpfv5teBnKW.Yo/pWXdGdxuaAGqXlRcYLHFHTW', 'AHMAD REZA ALFARIS', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28181', '$2b$10$YZUMgV4bDQAmWpomVZgpI.c8tD/W1KE4nIuV7MHqQMGPa7wiAyhHS', 'AIESYA FAKHIRA KHAIRIZA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28182', '$2b$10$qVTXZ2OeVhcIbvfRbzNDgujH2UdKcuJuFraJlJFSmqqDKfq7s5UoW', 'AL ZENNA GENDIS DESTRI WIJIANTORO', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28183', '$2b$10$EGGupZJ.FsddgT4iUzhKmO6BQYrbwFfzW6/yKzkfa05PAI6XFVWfm', 'ALQHI HARITS PRATAMA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28184', '$2b$10$bcM9sCNVMVop3.wN4V00IeG3mSNtsoPIfDhMrzieZQAHvp2SrHSce', 'ALZENA NUR HAFIZAH', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28185', '$2b$10$uGjpNBaF.EXocRltch/nCODSxfAZGQFH5Fm.28Y7rRacRHF5bghFC', 'ANNA AMALIAH HUSNAYAYIN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28186', '$2b$10$fE1DhjsuMDR8TXptmAJoBufHoH7YEBmlveeaYMCZI09x6.W83IfRu', 'AULIA NURY MAULIDYA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28187', '$2b$10$1BGjduVS4UC9k7bTq0NnCupTi33G7rYkVQ/JHUqXn8pqoannMHZhu', 'AZZURA AQILLA BALQIS', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28188', '$2b$10$IAKiPdYpewQUmsr8ZLVGO.DCxAni2CjXiIIe2AKXb7gVvPieR6k3G', 'BAQIR ULTIMA ALQAHTANI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28189', '$2b$10$3bvHmtW.Pb0fbq06cuSwFuDFIhhdx34l2qQ1.8sZh18SAzyIynuu6', 'DANYAHALIMA TUSSYA''DIAH', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28190', '$2b$10$4W1sajwNDRCPp2Js20EEheZRfJGv4IeSIWky5thhWPNDHCe/ZjO8e', 'DITTA RAMDHANTI MULYASAROH PUTU TSANIA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28191', '$2b$10$WM222fr2GqLLFkK0.T7CvOf1TocEL3ns42EHw/f8cgdHJfosS5C1W', 'EZA AJIZAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28192', '$2b$10$SbUee5x1Bwi11o504wNXuOqaLP5kJlccYWBk8XQjwUILH7xtioaG2', 'FELIZ FERRESIA PUTRI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28193', '$2b$10$E9B4DcqA/JHS4mvpN6XX1ejmh9K9b2hi3cKY0lyeychAJ05MauIpi', 'GALIH SETYA DARMA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28194', '$2b$10$aBLWQGOg6drzsh7RbCFKJeRbD1MvlYOLGY/0pDUB/ZvYEF1thjAeW', 'HAURA YASMIN ARDIAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28195', '$2b$10$5I/TjWt7aiYF9fLuVjav8uWGJBfgpbMK0JP9hmVN1M1fwNELIFsN2', 'IBNI SIDQI MUHADZDZIB', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28196', '$2b$10$rOg/yJqrHuwnlwI988clU.ez3crVSRMx1DXvu.9Pk3n9uA2zup80C', 'KANAYA SETIA BUDI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28197', '$2b$10$e6qvTG4NYLQK5jYAlnXiKusmngVtbwu/qNLPEXTxqWc//luKuk4dO', 'KEENANDRA RAIHAN ABISATYA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28198', '$2b$10$I87tljXqzk9GB25o9eAEXe6Ef3zdpmlmsr2XtNY9THjG2DpPqALx2', 'KIANA AZKA NUGRAHA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28199', '$2b$10$Tcb776TC3XIEq4rzaIG3x.Zuxy7zsC3H4Lq/j3yUUXwbfOLX6lvHe', 'MAYDHINA SYIFA HASANAH', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28200', '$2b$10$JEU/8v/ThvX5fSSgLxgu5uKqJwRS3vDtAyJYagayFMeRTXNDbZYSu', 'MUHAMAD ADE FADLAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28201', '$2b$10$LqcQH.tADcXErAFxTzLWXOtjHesmo.QRr6lubZ6Snkh7oER8.WENe', 'MUHAMMAD AL-AMIN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28202', '$2b$10$jBkMontRLBVjc/tB.aySaOVXgNpy.Tk.Q4n7PQF.TImKbyB50Zfva', 'MUHAMMAD EDU SATRIA AL HAFIDZ', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28203', '$2b$10$Nc8C9bndtKMygkNkQOrC.ukXHOebIKF72U6n1NqH2I2zkFJU/QVA.', 'MUHAMMAD HAFIZH ZAHRAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28204', '$2b$10$kcn3JmQRACNnVOn.g7pwz.IFMX1LpMD8ICz315dDllgR/BH0dg5Xi', 'MUHAMMAD RAZA GHAZAWAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28205', '$2b$10$mILZgIHnsLGCqpnlIv4M2.UsnlMiBHD53ewfBuJ03BKSxpbyN1.g6', 'NADEA ANAYAH NURMAHIRA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28206', '$2b$10$ncZkj2UHImj1W0h5N7TUkeGsGIoCSKDV8PFVt7rgOec4q0YWiV6zO', 'NAKHWAH NUR SHOFIYAH', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28207', '$2b$10$33O9McD/DZnYu75cznHQ7uIM9dvigIWChpAVx2o5vu8vx..WPJLaW', 'NANDA GHAFIRIN MAZAYA SUKMA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28208', '$2b$10$mrgzLNawpVZF6g6Rsnnw.eo0xANMH3IEVwpm9eW/9r45OARFt8f8C', 'NAZWA PUTRI RAMADHANI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28209', '$2b$10$ABxxiVwyBujoITPkBLEE3.H2/mP.pQFX6f6PmzKG25.oRKtCfbi7e', 'PRINSA TANTYA SHABIRA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28210', '$2b$10$33ZFRPBVoepV6eRe0SvXGeNGKB97CpTlBZ5D7QuVEq.ZCLTe4321W', 'QUEENAYA FAUZIYAH ZULQARNAEN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28211', '$2b$10$7I3cWoEsfMgZInhNsOoJJO2dFj9EmHVC6zoJJcCG.E.xeHJZmr9Me', 'RAIHAN ALFARIZZI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28212', '$2b$10$.LNCvul0vE7aNVc8IUop8uLJKoTaOhiYg0a60WV13P6ZlBXdHZXh6', 'RAYZKA ZAHRAINI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28213', '$2b$10$AGUk.ubGeVctjty1QjyBCu1249GNKlKbhv/WBHsEX999X/hb.2Da.', 'SARAH AIDA EILIYAH', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28214', '$2b$10$BzZsyiohqyMEEYU0AdGNb.sn3sp8s1TRNQyh9amrwdQPvGBfLHP6u', 'SATYA RAMADHAN NURCIPTA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28215', '$2b$10$xIKygKatzFYcndcORfXsLewo3OtxQXPPBpxDuN6XZB/gtuArl7N26', 'SISTI CAHYANI', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28216', '$2b$10$Hxtp8.w2JyvR31Xag.UVQO/inAR/9jlpYKu64hB0FmUC2Eji/KNU.', 'SYIFA GIFFARI MAULIDA PURNAMA', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28217', '$2b$10$lcYn1g0b1nHZZiPLXYwYWOHyjO54T447DpPpD4xLebD2Kv4vg3BYi', 'WILDAN YAZID SANTOSO', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28218', '$2b$10$AFh6O/OmX.55/UF6B1CG1.nlv2lzK4OWomHQa2OHwuXJOiDGGk3OG', 'YASEMIN YAMAN', 'X 1', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28219', '$2b$10$5/9OQV2Hb.W0Wger.FWnRuYX9Pkyj4eWhlmbsNujuD60advgtyFdK', 'ABIAN FATHIR BUDIARTO', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28220', '$2b$10$TdRRmhZhUGpvCiAZJTSC3.UqXqJb7mmjeN8s1HHqHEdaF8JN4q2UC', 'ADELLIA RAMADANI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28221', '$2b$10$fX.PEygFLy2t19xYV7ckP.2B1EUJwei1ZpxgAQoiDeK8FGLKQdzn2', 'AHMAD SIROJUL UMAM MUTAHIR', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28222', '$2b$10$EaBf/EkQjGA4C0MANHGHveTFmBSjrknddnyFNnjTuvWtT.tv02RX.', 'AIMA WIRDA USSAKINAH', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28223', '$2b$10$gMM5WojncLEgkJ/pxg3wueDGm6e4ZyZnuczt1lFPoSIU9XLpdBWVW', 'ALEESYA DANIA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28224', '$2b$10$xe49DHPno9A9FrvdeK1a8eJAYgx1ZxRdj2jLTKzipl/B5g/Op/s.q', 'ALVARO FAIZ ARHAB', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28225', '$2b$10$noEfAGFww5YhJOd8368E2eg8j4I5d2IPUQM5f6AAnmgpUg6tWlNYe', 'AMANDA RIZKA NURFITRIA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28226', '$2b$10$U4lNCm70tPoLiVh/fpUJKOxIXSUmjxQpw1m2DCUfkS7bLhL1dcwaa', 'ANNISA AZA MUZZAMMIL', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28227', '$2b$10$Nd1ICaXKQ/wokL6WfrzBfuIf8vgmdafNfo2H3BUHgcFKka6ufqkOW', 'AURA QUEENY FADIRA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28228', '$2b$10$nyxheCXu.fzLeAl/FY0cbeLEZMF5MoczEgLLcObjIRIfpBH47CjOy', 'BALQIS HAYFA SAKHI SOLEHUDIN', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28229', '$2b$10$dvqwgu8UpgS.mU9OBehEWORrwvFTUGXWrNX8k46KuLBVwu/YxCdzO', 'BINTANG NARARYA RAHAT', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28230', '$2b$10$WDsvuh52Ie6uh0.ECwMP3ucZv7UdVpxx6HcyZ/G2S22kEgVr73dAi', 'DELLA RIZKYA PUTRI ISKANDAR', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28231', '$2b$10$cwA9/GW/WZflZnFCK/TyJ.FLYFaPXP1FHiLVSL.A7o7TmJRGVL6im', 'DIVA NEGARA MAULIDINA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28232', '$2b$10$zai4tMhElrTn1k3pC3JPVeeSWcfmbWFmVxfQjp3ML26vZ0PJ1vsWW', 'EZRIA MAZDI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28233', '$2b$10$tQID2SpEDv30TMCfBg2vguzDf4qxTMhAQC.d9unUFPxGSFyqTApEy', 'FERLITA ALIFAH AR''BAH', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28234', '$2b$10$L5kEcLC9IgklxmZyDLrjs.FC7wZLzRG7pgfaeJXsE86HD0aZbvBh.', 'GHAISAN DHIYAURRAHMAN', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28235', '$2b$10$Nsq.c8gO1H/7pbUoRTHARu7ZHRpXSqSiThXOMiDQoGPOQSlwP1hDW', 'HAYA AFIFAH', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28236', '$2b$10$/l1wbXnGot0U839rufPxOegSkcsMqiLw44A80LI7XpVphxdC4A9v2', 'IKHSAN FATURROHMAN', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28237', '$2b$10$KVuG/OqOrdqMxKs68mesg.nI2kJ5iIMeR46bRe5ARBVBgLTrLA1Ka', 'KANZA KAMILLA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28238', '$2b$10$w1INGiuilrbITHQAeHpT7OiYp0V5AynevJhPV428bv0k2uQcMO42.', 'KHAIRUL ANAM', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28239', '$2b$10$qEND8FB4ysC6yKXacokluOkhlWSMDUiSHdUm56DDau6k/JLIeLhWO', 'KINAYA AQIILAH PUTRI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28240', '$2b$10$fBL3s/qwkRXxkQelf75oQOx0zXJybAX7WsGk5fuGR80/48Z75Hubm', 'MAZZULUNA RIZKA HAPSARI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28241', '$2b$10$cRIhFdfPoB8B7nf3/egPRuPbt1.MrH3JT20x/lQC06xC1JzASUVVW', 'MUHAMAD AZAM', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28242', '$2b$10$YHVMJazv42IV9u0PbAUmQ.I3qbdNuw6lxSw666vQURaK4YcI5HV92', 'MUHAMMAD AL-FATHIR RAMADHAN', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28243', '$2b$10$Un9ZIJv3fO8mUNJvV9JiCe26SMlv.eHBLkZH4NHvbcy2hxntbHXmW', 'MUHAMMAD FADEL', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28244', '$2b$10$K2G1o8O0pbR2qHLtNGFbfO6ha8AEuekEAfvy7U.7DSUOdsMNbo7dW', 'MUHAMMAD HAIDAR ALVARO', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28245', '$2b$10$2WTznJLPkGDziDP1t1Ibn.45ZYbnm4i0/Y8bI/diPCXMZeZudPTpu', 'MUHAMMAD RIDHO FATHURRAHMAN', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28246', '$2b$10$D2cudZRsetk6DhxhCkZideX155KsSVPKmYgoVqrcJD45KlSwyxDKu', 'NADIA KIRANA ADIVIA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28247', '$2b$10$473.tSX1myms.9aP5Qk39ON9otejQ5bAMXLHt7QBHXpSzjEyIyw2i', 'NAMIRA AISYATU ZAHRA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28248', '$2b$10$cLHHcSqkO7w9SjGnAUSqWeIL2ANb4dLcnjYJhlKMZvZ5eWQ50Dhfq', 'NASRIL PUTRA SYAM', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28249', '$2b$10$nDFs7B0OMaSSLpKLUG84sOBisrlhkwmOwFFi//f.zr2tM78e3eFW6', 'NENSA PUTRIANA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28250', '$2b$10$4VFDEzmP6WQoZLQWf7BsYu1PnB2fS5sEjLlKv/8K5SFitt9bfuuGa', 'PUTRI ANISAH', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28251', '$2b$10$.jft9D9wFMhhgeUICHPty.C3Yv9lNCAgk.dSCkqaD6bQG2cgdAuhq', 'RAHMA AZZAHRA PUTRI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28252', '$2b$10$Uj2zJ2yz1N5CFkmc5bqel.kGgf8aiBE2dHj3UU0/xucjzVSo3DvS2', 'RAIHAN FATWA ROBBANI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28253', '$2b$10$MhTp1bz5gdPHyvI5ZiE7/.fA8mawbhx0xA44h5G23d0nE7w3WsDc2', 'REINISSA MARSYAFIANA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28254', '$2b$10$MrO1dQ9roRq7VPntD1LiouUlMWqqFhm0YCTU2/t1oYxNIs6zmh2Ma', 'SARAH NURAINI', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28255', '$2b$10$KjxzRjCHmy.oWUCTYZ2wS.5z0xRPBIxFSaLYpCqlgW3TH8FuIZh/6', 'SHAWN THORIQ IBRAHIM', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28256', '$2b$10$xEsICRC5E7Qk6EfsRq2YhOtyMovXMkrU9NitBMDwLaLW/uQAfkQH2', 'SITI LAILATUL MUBAROKAH', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28257', '$2b$10$pH93mKYi8LGiNo1wxR72M.NETITNWM6vAbiYue2W52Du1Wszh3hDu', 'SYIFA KHAIRUNNISA AZKA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28258', '$2b$10$2UTwEObcLuOOmx0paLHiruUx/9kcynipB6IJzlQqyU4cWFMF4hMZO', 'YAFI MAULANA IBRAHIM', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28259', '$2b$10$S4nFG1YaWQWCJ8psw7EI7Oh3muGbWf1juKYYC7ChquVLLsL9H8c7a', 'YOLANDA MAHARDHIKA', 'X 2', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28260', '$2b$10$7SLzhoBf02R6WV4zlcFsd.wlFEpfcgAR4MrOkKEYjdXTYWzt1WFLO', 'ACHMAD RIZKY', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28261', '$2b$10$UiFIcu9Fcqt46ds5Ukqg3O449d9BUDwghfYdP4aAbNkZFMZo88Po6', 'ADILA ZAHIA RIZWAN', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28262', '$2b$10$dWsngPazvihr2OzCKejFzeNyyYblMABJMJBl2aG51uTM0kMrL8Ezy', 'AHMADUL ABRAL MAULANA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28263', '$2b$10$7u.1zq14lxH2IeDczNK6MO0XTOVG/K5eUP5KQ0HuqnYe1RWBzWMi6', 'AINUN NURJAYANTI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28264', '$2b$10$5QLfIbfBUnTrOVW5nYzOC.qbxgbMF/8IscX9XO07J9ETvgEXULPi.', 'ALISHA RAHMA SARI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28265', '$2b$10$Eov1lis3WUORT6RPBKvgdee6v4Yrudf0SSfhg1yTJFgj6d6PdA.uW', 'ALZOPY OCTHAVIO RHEVALDHO', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28266', '$2b$10$vwdmckKh2T2BK6PAPDFqGO/hnxW.TEyP8qwpElDUn3uhxty7Plz2.', 'AMARA KHAERUNNISA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28267', '$2b$10$uhp2y3PGKCVgpyBZtpvBMuprjcHGHso4VI4su1YFJlfl9E5BbJC/G', 'ANNISA SINBI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28268', '$2b$10$Mjq4mp7.wqkUVH9EwHXOFuY.ucA88RLKPt.E4ek9vGN0/DnbwA.4C', 'AURA RIZKY MAULANI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28269', '$2b$10$gPXMAdq52UH1BwkjibkjluizR4SXO1wQMG7XMedCsRqcYnkiIe3l2', 'BILQIS NUR RAFIFAH', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28270', '$2b$10$O/A/t11hUiuHIQq59WUAEOTougkTY9o7wG1cBjLSghmm4Y/aAgOSe', 'DAANISH MAULANA FAIZAN DALIL', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28271', '$2b$10$TnSz0ANnjn7g8nZEF4iSp.Lv1WfpgKqT36u9TqlwoKyP.TNdxp8Cu', 'DESTY OKTAVIAH', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28272', '$2b$10$K.hS5ugSuzZ6X7aoKedwuO5Sl103Fn9p2YhTOzqTakSmCLj9LfPzW', 'DWI MELATI PUTRI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28273', '$2b$10$mDHEAAQov3DCFQHU1QxGWeRXsMyVOCcchmnK6nU70INcEc8e27SS2', 'FAEYZA RIZKI ALCEO', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28274', '$2b$10$wjc4MSFTkVPfb9.vvkboRuHvggww2/bfjMpe3Z6QXfGxhqvrhxFnC', 'FEYLQULAYBAH SAMEYRA LUTHYA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28275', '$2b$10$sNn9HGYzyiSW9BiHeQse1.tjd5aU2efoaKLhvbPupGHz4zl/MZLN6', 'GHASSAAN AR RASYID', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28276', '$2b$10$LL6tVGtcbgQaxaNkbI3GHuhgruSTa20ow9qtp9g84yjqeRAP6HQzK', 'HELLDA OKTAVI PARAHITA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28277', '$2b$10$5OHupcCbF7f6s8Jk1aefleZ18cvQVSHkUAlR/81Q2Ac4aep6AJJti', 'IKSAN UMAR HERNANDA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28278', '$2b$10$2e6SSXOyDUgv9LwjooX3j.ptBY.eet6OQbcgkFPBbuJUuedTKMgCu', 'KANZA KHAIRUNNISA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28279', '$2b$10$FlDqCwW9h3lZiDsT25t3E.KRnL38cDb7Aaaj2y0SXbG7AD7DDD8.K', 'KHALIZA PUTRI PRAMESWARI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28280', '$2b$10$1NBTFWGTieoNo1J5MQbgQewgNoB9eN.4Z1jnXrc7FADkPCfcozotC', 'KINNARA SAFA RAINA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28281', '$2b$10$uJIRZTMno5IVE5cvmEjfquEfzYTGwrYdRo.cyhpy2KraP8y3OyvvG', 'MERLINA ASIFA NINDYASARI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28282', '$2b$10$ZeOafHPIFyEA1VKk5Dur2e/nTKqPKHmJZth11Z.GjmXpW4kevXseO', 'MUHAMAD AZKA ALGIFARI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28283', '$2b$10$wktjd3tQcEnrgbWbCawpL.zgpgT6Hm/UHZUo.Zj88KGdnQeLv7bOO', 'MUHAMMAD ALIF YUSUF', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28284', '$2b$10$0lLTKngFaPl7wMyBiIDTauus0jeTMGGIg49ZUT4Uu0iXgWKRw.Lte', 'MUHAMMAD FADLAN ALHAFIDZ', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28285', '$2b$10$NV9onjhlovu7Bq.4WV4WoeupbsxSYcW4DqrNqydxaVzF1assOrrF.', 'MUHAMMAD KHADAFI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28286', '$2b$10$4.VReL5VZ/7Qk4WMyrFIT..VWUOif3JBiqSR2tcgAkAK5qT6Ffa.u', 'MUHAMMAD ROFI'' FAWAID', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28287', '$2b$10$jOpNU7oG9BrgcFX3KTUepuLymvmNGwyvoUqFxQkgXVq7o3qSEhFVK', 'NADIRA PUTRI SALSABILA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28288', '$2b$10$fSGrqNX2XfjWg5Qqa7rUuO46y986lNQ4g6MBC3xwD9JZWIe4xsXae', 'NAOMI BINTANG PRAMIDITA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28289', '$2b$10$weNeiEfHUElzVg08aaJdBelN7S8Oixxt7CDCOc/XmJiuf5efbvouW', 'NAUFAL KURNIAWAN WICAKSONO', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28290', '$2b$10$1amfX0LJKctFR5wBF2jaDuQQjRlcThoxGQvXlBPbiSH7IbbrASRou', 'NESHA INDAH AZ ZAHRA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28291', '$2b$10$XW5weGSaD/TlJTGrmN7DJuoZ7nuoe9OYEUvw.mpvIEDUs2O/fcPhG', 'PUTRI AULYA NURROHMAH', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28292', '$2b$10$hV7LwVpbn8m0YDUgqZgIRerrYvsvynGtcgolK9TbNjdG9S5SuDpXS', 'RAISA BIRRA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28293', '$2b$10$BOL7/3nAk1mvb9/o5Jdnv.dZI6UeYYnMNSSGM.8z8N.P6eUIz5uLO', 'RAKA SATRIA ARFAZKA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28294', '$2b$10$DTtRPh.4ct70HR1PyGv5AeFVDoOAK6uLODSoLZ/05bAsBVEZnin9C', 'REVA IZZATIE KAUTSAR', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28295', '$2b$10$FUhWWIC4TkgsFjBdJOrzeu.AI2lwLBgZhIxgp7nA5I2af.djpxECG', 'SARAH ZAKKIYAH YUSUF', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28296', '$2b$10$1Otxzhymcz2YtG5n70ibHOLFGDaoTkjjeo76b1358g8YHxGOdzD/W', 'SULAIMAN RANGGA RIZQI RAMADHAN SUMINDA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28297', '$2b$10$YFcCFvXxplHatzzFB/OJvuflmS2/0SWb1uM3FxUPg5VN6neU4bKQS', 'SYAFIRA VERODITA CAMAILA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28298', '$2b$10$O59CfJv5ujHYB41ocwn9Je6aT0of5qt5AK6W9xJpf7yWtHiQyGtXa', 'TALITHA AZKA SURYANA', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28299', '$2b$10$r6lKLc2SlwcAxPB58YUVZ.AQEabWQy3Zn8oHotQRgpDll6ribjvNq', 'YAZID MIRZA UQAIL', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28300', '$2b$10$tLv/vLNJZRCaxEtzfbrYqeDv1oSK3sIUrdE4WyWlYePiqZg1vO3hy', 'ZAHEEN PARSA FAHRUROZI', 'X 3', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28301', '$2b$10$.HxyiqY2uAJi3oPeiZR6LOVnZI1N4O.qCV41OgzWHyYqgSWwP543W', 'ADAM FARIS ALMALIKI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28302', '$2b$10$hNKrIZTHLaGbwScZlywROemUokDlv2qK8AmHXuFQUwYviQG7W58.W', 'ADINDA CAHYA KIRANA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28303', '$2b$10$bwZwbZ1BBe7FyxE4idg.pO9PtlOUXmYFJSqnP3ltPdno1QRBpQ.vG', 'AIDUL FIKRI SUANDI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28304', '$2b$10$P7QAOXSsP6cxI/qwL4g6Te0t6cAvGKYhDE99TreWcHZFKD.Hi14Pe', 'AIRA DZAKIYYAH HANNAH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28305', '$2b$10$YNIe1rsD1VUNsjaEPo8y2.NrToYQQs924mK.UKoE5uzM0NV.UD2Ti', 'ALISYA ZAYKA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28306', '$2b$10$g3hjlFA0bvoRLI0AFK1vGOBzy4NfNw5CeUre5ofgdE7EFutKRt8NK', 'AMIRA ADZKIYA AZHARI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28307', '$2b$10$CksCU2O189wgyS3sA0PoLu6bQ0eRqIOZGLQdyX95g0YbCs0BTcvzi', 'ANDRIANO ICHADTUL RAHMAN', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28308', '$2b$10$Ae6gnujrg1DM.ykiW/5DqejOCBX7xHBKD9AApEdOjrmdzikxTlz7i', 'ANNISAA NUR ROHMAH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28309', '$2b$10$tZmoWRtBcmHuqF0GeZPYJu8YCx0048J/D8eq47dvxM8EIsPAZEyoK', 'AURELIA ZAHRATUSYITA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28310', '$2b$10$lK6jde.wydnXnotIth75S.RTc7J1mDDbP6NvQhiSfd5gF3v6RrrDG', 'CAHYA RIANATUL ZAHRA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28311', '$2b$10$.xgR4f2mXZ6INLnUJRyO.OXvifbwDRs6WlKiBFTjNOh95R7TVFrSi', 'DAFFA AZKA AL GHIFARI WIENDRA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28312', '$2b$10$c12HaY8ZpeLROHDvQ6CTgujTC3j2C3E2rcsNvEpvuaBey4a37gewW', 'DEVIKA AQILA JAHRA NUGROHO', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28313', '$2b$10$U9z4XOoddRCFRb8gkgTnGOa8eusYej/5/gOtW7oNO9X368cKWCqme', 'DWI MINA ANJANI HASIBUAN', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28314', '$2b$10$0LTAFQRDzfv0YNRBVNJgyOcLr.aHrj6EAP8t408gHkwRa0Y80Mv6m', 'FAIRUS FAKHRI IZZATI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28315', '$2b$10$QsQ.CcdBOTjkbUE7yaejje2nXoZ1WtpdBfqg6XQhejPdoHR6xazUO', 'GHAZIYAH JAUZA BILQIS', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28316', '$2b$10$n3OkUyABuY6sY0xWxj8zwuKgJL18l0KD/4RzP9CBvbaPBmHNdcjjK', 'GUINANDRA ARIO ABISATYO', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28317', '$2b$10$WKpy5lK9ui608NXgOC3muO76yL9XzIM8a0XIbxvQ2PziEpvLxGwiu', 'HENI NURAINI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28318', '$2b$10$HQ0eHmxhGn/2Ajsjj0l4Au018bqMMJ0.cOOROWaeUxwx/2EYImRTa', 'INAS LUTHFIE HARTAYU PUTRA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28319', '$2b$10$2Gt8auzMuWcp.jOFTvhgpeZZKWoJkZiQAvdEEr64KH90iXrRj4jCW', 'KAYLA LAHYANI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28320', '$2b$10$dn89sdRAB1qetQh0mcgoPOcinC9VYspSlNzFHp6OLSPjoJ6BhpLsa', 'KHOLA''IFAL FAEYZA LATHIF', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28321', '$2b$10$durF/EqhR/QUbdt3CadfCeppspChV3rpP33pZVyodhwRSQO0olFgm', 'KIRANA RATU INDIRA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28322', '$2b$10$mFxc9DUaCd8eZw7OCAm8JO4SDftHbXVmnBHZkMTF2uO0VRvSsHSQ.', 'MESSI ALFIA AUREOLIA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28323', '$2b$10$xRSA1gu68nxr24bikA0Xe.hspm2xYwVUA25MpXyrTGKUry6Wr9AJi', 'MUHAMAD AZRIL FADILLAH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28324', '$2b$10$IBG0baIN0lSCUN4ocEj..ex5kn/57qaCXgxAiTd6dZ47KYj9Yxwta', 'MUHAMMAD ALTAF KHALISH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28325', '$2b$10$1K14PH7JsnBnkeFdcq7ulOYGoZ5gDce1e7ABEtwMKMeh6yzjW.OMy', 'MUHAMMAD FARAJ BENZEMA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28326', '$2b$10$FwwuVARFcwqLptQf7QU6XevkpA1QEsOZvKOGyDm0PQ148KW9isU.y', 'MUHAMMAD LUTHFI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28327', '$2b$10$SNKttBa3kQG/lj1dyCKui.3DyLQHrYFingsi4ry5qcERyFiFjeVxq', 'MUHAMMAD YAHYA AYYASH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28328', '$2b$10$rrBun2JFJP49j5hoUhJkzOkPhAdxdB9dMx5sSteYU1CLbFCIzr2WK', 'NADIVA APRILIA SURYANA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28329', '$2b$10$8vEeqUSLrMDUW3OOupDVP./.6jTAKxRbvs5m/NnQa23JUMWWPE6zO', 'NATASYA SABRINA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28330', '$2b$10$8mg67pua52G5KjDyLCJyj.sWvPvDPGH2nmhOqb4xFLl9SQqMQX6xq', 'NEFAL SYAKUR ZAIDI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28331', '$2b$10$P54AGYq/36tOFb0OATlD5uRpICyNC.VSgnc.4b2q9WOhR/DQUEvWy', 'NEYSA GHANIA ARKANA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28332', '$2b$10$jk53aIVRUDdDpssYfWVYjul.3E7wpPxBWQacwoqxFcKdzGQt4tPtq', 'PUTRI AYU LESTARI', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28333', '$2b$10$rLkZOkVXaVLHzEqvS5gKYua08DaBSTzmjlLbTMDhGK6w5LjR0Ppdy', 'RAISHA ANAYA RACHMAN', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28334', '$2b$10$ej5.DWyvLOmFFNUuwV3qn.6LqStPHUmPZWKvA/FGBdoMbUlUPHmMy', 'RAMA HUSNI FAUZAN', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28335', '$2b$10$YlCsAmrlEuJjzXVd7BDVJuAEObylgqAWHQqF.fxyZCO/q3l3kWyNq', 'RISDA HIDAYAH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28336', '$2b$10$CiAob5V13c8mrs8StW8tdefC.FJ1E.MnvEt/wQlkpaVYsjHralQTW', 'SASIH AMANDA SYIFA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28337', '$2b$10$CL2d9ANH1klQhpzUWKN3/eLmt.FDXdBgVG4Qj6BAmxaPHETb62wY.', 'SITI SALWA SALSABILAH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28338', '$2b$10$K3xFbIp92drfO5HWdKYHAOXeLrcgu3d6I29Lw1pwsaBtc4gNdZdR2', 'SULTAN PASHA AL AZKA', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28339', '$2b$10$idM/cusV/svGjV.0BC6t7.iM3lYA1lOYSlT56PQWmH5Yd5LAjGvXW', 'TANTRI ANINDYA FATURAHMAN', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28340', '$2b$10$1ldX5KPCUJYl0WM3jtRsAeQ7h3wE66ksBPPxVaRvk5YeMBR51DMx2', 'ZAHRA AISHA RAHIMAH', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28341', '$2b$10$mXfYPOKkjP.u3zJn9MH5juonIFBKFJQErWV4ZeTIwQt3l94f5A6im', 'ZAHRAN ABI THALIB', 'X 4', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28342', '$2b$10$6NtyWJguU9vghLmIBJNGl.aXnzaS8PxigwO4M9P4P4tBVInrP/02C', 'ADE REINATHA NUGRAHA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28343', '$2b$10$B3O5gPrALl3Di42dMNnnkO0wp/obJm8aJrSJ2pti.RZV0jl7osMTy', 'ADINDA DIRRA RAMADANI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28344', '$2b$10$D0N63.aOMnAb.J2IppXtpO6K98WCAYbjXSgv5mvz1VqpHL/3U.BV2', 'AIRA NAFISHA ALMAHYRA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28345', '$2b$10$Tw1Zohk3LuiamBN3QgTfN.Ks0rQE7IFDr0tdApWfml9vnlrMWsnEC', 'AKHTAR FATURRAHMAN SUBANA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28346', '$2b$10$AHkts8NhetYCBgVDnXuTDubK/X.t9mPlzhBM4a13TQ.vhatovZGee', 'ALIYAH ZAHRA NOERTIKA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28347', '$2b$10$2T53SrsiZhOO9BYTM/MEVu2bHKljBMrY5h0A7Vs00DxoGmRYbKzsu', 'AMIRA AULIA RAHMA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28348', '$2b$10$uVQK0S4TKKVrk2kK049WqOyXFDjdZkPrGN/KOkHOZuqbBUzO.vS8S', 'ANGGARISTYA JAISY HUSNA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28349', '$2b$10$IU5CoNseDFpaenZExtPNVeT.odJ.tfWg1Jx8kBxT9RYJ69E7siOgi', 'ARDINI BHANUWATI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28350', '$2b$10$To5/uV3Gs.PpctEjmFuN.uGR032oIP50NJZN.fJ8KqYfH0OirOjT6', 'AVRIL RAMADHANI CHAERUL', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28351', '$2b$10$RaIpW7plIQqoDF63wGEdGu5vOD7wsv/b/IprrZKhlhP6ePqK8kmbO', 'CALLISTA RAMADHONA ARGNA SHAFINA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28352', '$2b$10$ASG5msG.3WyW2UHq3DVD5OFTX7QI5kIjf5ZAmV7crLdCA6MuvREwu', 'DAFFA NAUFAL MARTANTO', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28353', '$2b$10$649SiQ/.d0Raly9dEa0eb.tni5Q7EC5psDFtSCKSGkJaU/5XLWGkG', 'DEVILABEL FELI ANASTYA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28354', '$2b$10$/ek8EPR3h/HRTJKeb5k5bOfPL6NEgvxuaDQ2suKiYlDQMpY4YQK/C', 'ELENA PUTRI IRAWAN', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28355', '$2b$10$NgsB5JyWVBZmVDlUe0fkgOfRe3PPNu3.V2sZW5EDYr4URt749zdZu', 'FAIZAN RAZA ARYAN', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28356', '$2b$10$PxRUY5bX2nJylM5qB5CE4.hN78xmKkZMWIoN7mFAH0/TSt8zK3/z2', 'GHINA SHOPIA RAMADHANI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28357', '$2b$10$YySzDnfTBwc2Up5jJQPbTOzUWTp0af6s2Ed16LcmBxPl3JuIsVCza', 'HABBLY KURNIA MUSLIH', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28358', '$2b$10$YIJk6Tx317xELUM58lqoiOq6f2VIVVWyENiYZ3XmWnhF6Gm/2c6Sq', 'HULWATUNNISAA''', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28359', '$2b$10$x2GaBsU9/9bvByQck6iqbOn96Z5f5llrDtUce6k.dWKL3zU2cZ56K', 'IRFAN NURSAID', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28360', '$2b$10$Y/Jpo3J3aeJjqUv37wJ.cOUr41h2GuoKUbYVW.HuSL8kcRBxoqbVq', 'KEISYA AZZAHRA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28361', '$2b$10$.l.AInoGhiICbgyQ7zb7KejMCjvRlFjWFbyK3fvkO5v1gqYXKoYHK', 'KHOLIL', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28362', '$2b$10$yHwXI0rKav8JGsBEfIfrauezgQeE3Yl7/l3AFhTIz2SELwMEcuT.G', 'KOYKO BINTANG SUWANDI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28363', '$2b$10$0vFxM.HmygDxuny2l5AdUes2SrK1XIV19NwqwYMim32Kt1xg8FDv2', 'MUFIDATUL AULIYA RAMADHANI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28364', '$2b$10$ckgMHD.BHsAM7ZCocl4SXeKm7em8jW1Bix.Qtz6Z6QdD8CBHmOw3W', 'MUHAMAD FAIQ AKBAR', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28365', '$2b$10$hqgP7OvYbe9AuRiarF9z7.1zLlWjIdRwYx4bod3o5QkjpyonoT8FC', 'MUHAMMAD ARYGYANTO ANWAR', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28366', '$2b$10$didDHEsq9lo6H6yxbpOQeOfoJ3pmgSCXTXLL1..boagisNduSTYnK', 'MUHAMMAD FATHAN AL GHIFARI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28367', '$2b$10$U7vjcJ9gQFVRYf2ONbjzvetv8EP6S8G6rSEemgz.nqR8tUxquRHq.', 'MUHAMMAD LUTHFI SAKHI ZAIDAN', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28368', '$2b$10$Ex6ElFSxvCes3MfKPCn1hOqjqPaFKxWWvLOBggNnaN6FdXzluFwji', 'MUHAMMAD YASHA RADHITYA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28369', '$2b$10$nBmRRzjF9BVsqd/2XisM/.e1r3vNVUmjZwsjuUnq.xTREhnaoWpdW', 'NADYA ATSILAH AMANY', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28370', '$2b$10$cjP.kwCSlFxm1cPIc/T9lOiZD9e5JHxZl5ro.7PW32rW6tX2z8akG', 'NAURAH BATRISYA ALWANI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28371', '$2b$10$qUmZWUi85M82/z0fQsFbkueFeRrwyxXcC/mT2zlCxQwMF.zRSd9KG', 'NIZAM ALTHAAF MUKHLIS', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28372', '$2b$10$IJbWKJVAyqzGipvTK1uPmuRfMz/FJhc2C9y1DMkepRkb8lIIgoi56', 'NUR HABIBAH', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28373', '$2b$10$g..qo4sRPe2ZDLzrtnJJMuU3uck3tzJcYwIFk7Ifzuahqg5N6P6Gi', 'PUTRI IKRIMATUS SHOFIA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28374', '$2b$10$WXjubmkGuR7uTFesf6bkEuipB/dkLdjtS.8uNcIuRhsdddehanAni', 'RAISSA ZIA NOVLYANI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28375', '$2b$10$HJ0wLfpI/h9ahOoomv7xfOGsk129TGhGK4s1flI2pG1sv8qNRordW', 'RAMADHANA DHIYAULHAQ AL-HUFADH', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28376', '$2b$10$cCgNYrQnEpvMYx21ZB/67O0eUs45lcDmYtsTKyBT48eIizrhRbLyu', 'RIVIONA INTAN NABILA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28377', '$2b$10$RBdJfbu4S/1jbtu/Cq1Npu.YeoxVuygXgRHbLB9KqcmQXI9/Jp6fK', 'SASQIA AULIA RAHMADANI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28378', '$2b$10$K/oTnJMaC3SyDpv14Iu11uQ4XdkTYsFe.3oh9bhPesV8ScnzX.F7a', 'SUCI ANDINI KHOIRUNNISA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28379', '$2b$10$r1ZsP6XanIsjISJUznmNBOnH7Hva7.xzRiIllb6n9PfbRh0Lc.t7a', 'SULTHAN FACHRY ADISUDJATMA', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28380', '$2b$10$v7wyeUdw33ICKx3SrNhsZ.fo6WHbsz1wfPFV7LNU0haeVf1aci8ey', 'TIARA PEBRIYANTI', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28381', '$2b$10$P3KDrIWkBQkXUkptrPDlOONBP3sCdd1HEc872pY3MDE8x9yx/xj1.', 'ZAHRA SALSABILA RAMADHAN', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28382', '$2b$10$B1Vz5o7OlRipH3GoMYEfPejiAE8HKFuJc74BIcuqU2.HrgR7eTL9S', 'ZAKI HAMZAH', 'X 5', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28383', '$2b$10$u.hFRFFcQg2FKR7EcQ.OQuyC.AZ6xooHVfDqeFqB0QKhuFlrvpZua', 'ADISA FITRIA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28384', '$2b$10$4f9dBpyH0FnLIdmrcHniweJ8OhmF1QE7q4gBH88ck1IXBzYzgqcVK', 'ADNAND YOGA RIZKI', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28385', '$2b$10$HquPoNJTmJc.9lUjMD4HSeuUBzlfbHEzM32YjYu261/iAYxzQ0CXO', 'AISYAH HANIN KHAIRIAH', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28386', '$2b$10$.vSBnikZeCaWo0WxVz5TEuyBgNKuV8cGvc/.1z1Qw7jzVHCzjDLJq', 'AKRAM ALFARIZI', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28387', '$2b$10$DEGafIpmTr7CBxSo4NHLNOzcElylU8b.ocwEGwccbMs7q.yepq.1a', 'ALMEERA SHAFA ATHAYA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28388', '$2b$10$WWD6Ssy9uZLPWdFmJNfUxOLJB0K2WRoVmMJGm6o10FIzyAmp3GeXK', 'AN NAILA ISNAINI NUR FADILLAH', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28389', '$2b$10$WMjAcsnLd7qbukrZzhT2cOaiUfV2xgWSVKaKeVrjS.3bWpsvBBlwS', 'ARBY DZAKI RAMADHAN', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28390', '$2b$10$t8t6ATYHUIAKMw9asBjG4.L/RQ20bd1mDviOe.3.z4ZGbg9NkXNlq', 'ARINI DINA KAMILIA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28391', '$2b$10$BKNcQKkCzc3OGkMGdOQT4OuFleF0oenAKiNJxP8UaeafoCZIzMPIW', 'AYATUL HUSNA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28392', '$2b$10$Cj7YgxG3NWjy6f7odfk1CuXKKM3v1c5HV6iHCer.U6ir0b4OkYSeC', 'CANAYA SABILLA PUTRI', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28393', '$2b$10$4P5lisF1czKq8S2bAWVGsedLT9hpdVMUBSv5x7HjsQ9yWDgZbkg3e', 'DAVA SATYA PRATAMA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28394', '$2b$10$WH156iJb4ruandBrsppiQ.wTahE12yqIq8b6VRwMYbBz.c8t/fmWq', 'DEWI MAHARANI', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28395', '$2b$10$zs5y9AyHKbTdr4UJNOC22uTeM/VONVPQhwtkyxtTuQyz6cSHXY3gK', 'ELFRIDA AZALIA HASNA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28396', '$2b$10$uT/Dl0q9AVyZbOyirJmSOeU/coJw8GHEESK90kHvrxuWZM29bgb8S', 'FAJAR SYA''BAN PUTRA BAYANGKARA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28397', '$2b$10$z/TwRUYWmKWWXPs.3zE7yeyHuPlRud8tXIv.eJaVjIDOSINNtrpmS', 'GIFTA ADYA PARAMITHA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28398', '$2b$10$La6TcBdV6fim68CqQW5QCe2sCwRbL8bnLDyjWR7Q6GB7M8o26aHE2', 'HABIBIE ASSHIDIQIE FAISYA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28399', '$2b$10$v2khe7MUE7m6c/SuJEz6Q.pXBBHSmCsePec4ClkQzxuSIPdWT11Wu', 'HUWAIDA SALMA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28400', '$2b$10$9QpzFHjVLIhmhVhjd./1seQU16ryiAF5jYGldXKxN3ayiZnwOAY9y', 'JANUAR ARYA TAMA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28401', '$2b$10$9yEHijpVDg4ikS5D6OLkcun6ro/ytG1LaV1xfNhsx4DH93PoHCIEG', 'KEISYA MAR''ATUSHALIHA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28402', '$2b$10$UcCVDKzvTqXbWkORJxYkvu.8iojQnlgHJ/iQKI5YQmL6dsJyNWWG2', 'LINTANG CAHYANINGTYAS', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28403', '$2b$10$OXNc4LvgN1OMoRn8Op1Gf.LvMGRb24GNQvrmq/yW9gH6nX6sUJx06', 'LUQMANULHAKIM', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28404', '$2b$10$/JMqw3fxWLLi5sMQn6cPQe9C9c5p0b3Ac163G6ke61PU/MDBRC34q', 'MUHAMAD FATHAN MUBINA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28405', '$2b$10$S2Uef3VcndrdDQ/mAr8M6.gT/2VFhKf3iprcZWtFOAkTdNduvNRL2', 'MUHAMAD FATIH ATHAYA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28406', '$2b$10$HltUDMl1hqs.5MADmpijTew82qy1t0PkEwNJ9UmTRZosjFJ0iZiWG', 'MUHAMMAD AWALUDIN ROMDONI SANGARA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28407', '$2b$10$f8ygeJ1oZkHmY1Bym2M.oOjqI52FaMpD4Dt.srbvpOPnGjExhghLi', 'MUHAMMAD FATHAN AS SIDQI', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28408', '$2b$10$WlRlyAwA/B3QQjQeMHKHme9KDesYM.ete5cG38bnFd41L7uNy8w7G', 'MUHAMMAD NANDANG ILHAM RAMADAN', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28409', '$2b$10$4DMsKeTghKjfORg4F4O92eRm1kv5i.dhFVDxjBX8fi47o3HnebwDG', 'MUHAMMAD YUSUF HABIBIE', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28410', '$2b$10$okqy6WGkEYFvGh7HYsdHIu7n2h6nguVhzAlIOHCNbJ7WaD4.NXmWu', 'NADYA NAFISA SAHLAN', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28411', '$2b$10$tfB4mXMOm.toSurnnmpc7.JxjYcmOAYLgkzCG1kweDUU37hjQ97Ze', 'NAURAH SYAAKIR DALIMUNTHE', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28412', '$2b$10$6ZGjPVVtkS7NL1/INUjqPe0gH9B/DXtHcd96TtX2dE74Fsed6oxje', 'NOVRIAN ATILA HAFIZ', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28413', '$2b$10$JX4ecrDBkXa8OxINNc2r8uR7i5O8v99N/YD9cEUExN5WTGu8LZiou', 'NUR HAYYU RANJANI PUTRI M', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28414', '$2b$10$stNnWRrmzvsATF4vln3sM./IEjsl9jojfUtCqnHzMtkAdOnb3EKra', 'PUTRI INAYAH', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28415', '$2b$10$Pyl64nVTVp4qyiq3zP8/uuGhtdSFyNMkp6mOABWt4K/B3BKw2clMK', 'RAISYA SAKIRA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28416', '$2b$10$6jYgQ1jC9/ivwuPdqDfo1uI89X8CaXC2XNQeubvtYh5jyfcOHsaou', 'RAMAZEIN FAJRI NARENDRA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28417', '$2b$10$6AiP1BLNIfHWJoDtfnBY3ugtxsqb.oaNjuUnW/XILaKfOIaJZauL.', 'RIZKA AULIA FEBRIANTI', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28418', '$2b$10$gl9nuKpTbCqxIaHNvC4ibeLbEKM8xd7Qh7i0kaDdGGTwa99pN6jc.', 'SEKAR KIRANA VIDYA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28419', '$2b$10$aQgCk30NK/nt3ElFWe0UK./4011.M3DZr2ewJRzrjnRvOukTru0EW', 'SURYO HADI TRYANTO', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28420', '$2b$10$oJwEpSyiMGeNrd4EyeAm2eVAWowklOip7nlNbldQDSgzUo6ylGpC6', 'SYAFINA NUR FADILAH', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28421', '$2b$10$dOGtsNVcVX8UkzBAhN.I3urGFv/lQREG70juoF64a19zfstmaPXwi', 'TRENGGINAS KAMILA MULYA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28422', '$2b$10$tV6fI9qrlFecCcRootrd9OmutE8oZEEe8KkZUgsNHPTeonNJZZZSS', 'ZAHRATUSYIFA', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28423', '$2b$10$DQK.CGvkIoiBeZbnzm8ok.ULcv.OevUVg2CAKfkcAoSkHtvg8XtnO', 'ZARDAN NUFAIL LABIB', 'X 6', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28424', '$2b$10$WHKufrxCgIIWr5VRo3bqvO0.g0eEX0TFrzVkR0yXlRP7TT3qZ5ALi', 'ADORA ANINDITA RAHMAH', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28425', '$2b$10$BS79SzVIXEXfqViVXlZ2mueTkarqeCPjWEnr0n77QNi4DSSPcNGU6', 'AFIF WAHID AULAD', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28426', '$2b$10$gUB8DaOlHwYLVp8zMdpsWOWeHoflAdjvL5HvYPm.bSv6lr.H4bL1.', 'AISYAH KAMILA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28427', '$2b$10$MP1C3zWnqTlrVNlEW2H82ObkhLZnq/drARezUAXIcgShjbHTxVwSK', 'AL HAQQI KHAYZAN', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28428', '$2b$10$L3.Isb7jYRgd4snbLlssUuvYh0nkRmt7e7H0CcerUpMiGIUVM26X6', 'ALMIRA JASMINE KHAIRUNNISA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28429', '$2b$10$kKorf5SeoC90putKkOQi8.3bKcx3TOFxBvTBh6ntUJuoY.o8MID62', 'ANABELA ALYA PRIYANTO', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28430', '$2b$10$Y3wLkALMIJkYrZb8XA/Yw.psZ.C6cnQV2sLQqXstSw2DpC./g3DnO', 'ARISKA SRI AGUSTINE', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28431', '$2b$10$mMboe91S.cH50lGk94y5UOYuuumVANJ/G6QcTMUJtPIf53jTaRTFq', 'ARKA RIKO PRATAMA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28432', '$2b$10$fwUz0OpGdQpRcKWYBt0Am.6Y9gixEW1ZCJQGxrG7WGzg2vgAzrksa', 'AZILLA AZ ZAHRAH', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28433', '$2b$10$s7O/I0/JJQNql5oN4akfhuqTheoezm/0rXNa0SIPLOB4o6x7mpzW2', 'CANTIKA KARISMA DEWI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28434', '$2b$10$gusrplzzipDeZ4lj/PsVneWjTdBd7fH9kBsDOFjsVH6LcHwVLw0lS', 'DHIA KARUNIA ZICHA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28435', '$2b$10$0M/92SKTU/3gTJnG9gYlaOknilaIP/LRuQ2uAAuiZBwR9iKnfHTO.', 'DIDAR FAQIH ALFARIZI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28436', '$2b$10$jhneIudXxlHJ1kaP0wgdWO7kG1XXC/5aj/Ojl1ujWw.9.zi3LQZnG', 'ERLIN NADIA CAHYANI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28437', '$2b$10$PnFdAooqf.6FU..aPh0WU.LgV6ZMKI6.8tO5uCSVmlpWI/8S0E9hW', 'FARZIN HILMI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28438', '$2b$10$qYhhGkpgMgy80ogWO9h67eqKHOJFuXG1Sn0MiS305tfq71Xoz1olG', 'GINA ARDILA PUTRI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28439', '$2b$10$DSSoi5sE2NVlj6DqcwxyaexhcsKnm1gpGDnVL/bfvSkcM0Dw7tmdO', 'HAFIDZ GHALIFYANDA NURYADI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28440', '$2b$10$xiVXuAe37jjNqZy6mWwWze6RLyaRXTGr0FnGFtGgghA/OqBFVQyvi', 'IZZATUNISA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28441', '$2b$10$KsuHptpbxKOkqBa.f28SIOoiZYA0n65NUX4jUNYiUuIr1hwZ/jB6.', 'JAWAD AWHADI ASLAM', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28442', '$2b$10$E1oqrDMVvNNEl/jL0oGpIu1cYHkgm9xAFixxsUJC6Q50VucmgT23O', 'KEYSA ADZRA OHORELLA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28443', '$2b$10$mGsxP4wPlBN6Cgo4f0NCi.FShIfJnFG0dpaDYHB2r9apnTN4k5Hk6', 'LUBNA VANIA RAMADHANI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28444', '$2b$10$S4NSJTBSmF.zoL9gG4GWQ.je7.P0RzZEAFMiN9AdGiXnBQ0rJZVEq', 'LUTFI NABIL SIRAJ UBAID', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28445', '$2b$10$x.6EQvvkWCeS1Q03Elk24O3H1MiWETrp0XNuPq7AuEsNTnLg7EQuC', 'MUHAMAD IHSAN', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28446', '$2b$10$IkffZWkkwWtXreLfRt7AIOMLPjGNLVikurQo8b676xNvRceuPrVY6', 'MUHAMMAD AZAM IBRAHIM', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28447', '$2b$10$wFOkndePXSjqiZOvRfXiHeHlSTKBWAhmr.jCTIFk7OY0OstVyLVHS', 'MUHAMMAD FATHON MUBAROK', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28448', '$2b$10$IbbqkJZbLCCGKybwPUlGCu3dnWqtmteGavaqa580nrF/ptms2jhDC', 'MUHAMMAD IBNU AL KHAWARIZMI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28449', '$2b$10$YcIJpCA/pDQYbnpTTt/s5OyAOEZxG5D0sPGvRY4rZUX9DSidyIBRS', 'MUHAMMAD NAUFAL PUTRA PRATAMA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28450', '$2b$10$M56II5AfU5lpBo3s.msbnOgq/d50DjZz1N5k0Xg/hdtUZ9r8MSpcO', 'MUHAMMAD YUSUF SETIYADI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28451', '$2b$10$qgrct0JThLWmBtLJGoi8FuqWgRXVbxgA.ATtV2pKNDa7V2zRDqUTu', 'NAFIISCA SEKAR ANGGRAENI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28452', '$2b$10$FhwAkYPOh8SyOMlhqFkGfeequv287fnWy1vB.2Gqhs1o.ml9Sn3H6', 'NAYLA AISHA RABBANI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28453', '$2b$10$XwOIxePDOPHVxgf1NHVuUecoQU5uqXgp3d0ZvVDX0DVk7yxtYha46', 'NUR NISA ALIN', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28454', '$2b$10$G2JZ1dUsRGQ9U3bdPhwq2e2SvkCG/gK6fdVhhp.MUnE5eDoeDvfZW', 'PUTRA PRATAMA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28455', '$2b$10$1tMGxH1AKXsDW1b5kPr.3.21Z/BoCHCNTLdiWBTUlY02hyBIJsWky', 'PUTRI MELATI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28456', '$2b$10$vsYI/t/pa3IztB07o8Ed2OJ5FsLGyD6EXN/TcJIW70o2dhpE8ixm6', 'RAISYA SHOFITA JASMINE', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28457', '$2b$10$t2rXNItU/5NeVjU2HbLom.u3uAajzO7WTmLqv7X.dbTWXf0WPZFMW', 'RAYS FITRA STYAWAN', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28458', '$2b$10$AcCNQzkgt1ohQ79SWuSKCus3AtgXk/0VFe8cZv4gxlYCgfIMdR2GC', 'SAFA SALSABILLA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28459', '$2b$10$MQjlV4qnfuJ.6bPsFQoFk.1FL3QwpWZmGvAMtFsbtz6RdYgQfl65K', 'SENJA MIA MALIKAL QILA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28460', '$2b$10$b00CgHYU4A5D0.4HW62JvuUdDd7r6EzJQ7ozKIab.YYk66lWxtHUO', 'SYAFIRA PUTRI AULIA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28461', '$2b$10$2W2Puj264WY7TSFKkfL7.OGcuQAs2FRtiEd6BqgRfy/HlvOi1iSXa', 'TERRANO RAMADHAN DV LOLO', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28462', '$2b$10$1SUqqh/ATmv5J5bYRRH4LeIoVGzXVbGAQE/Vlner2KTydxcm23yam', 'VANIA AULIA SAHLA RAHARDIAN', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28463', '$2b$10$mD5IotnX5OFNY3v8VfO87ucuG6vTD7WL/18bdefzFCkrj/WL/0G4S', 'ZAHWA SALSABILA', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28464', '$2b$10$8FGDMkg.b5asnIZhAWf9m.jioE5RxHO7MU7hm804o2epKCkoWoA/G', 'ZHOLATAN ANGGARA WARDHANI', 'X 7', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28465', '$2b$10$zbDgtQsJ1Jbb1RX0VNYFluYkvIwvst4bdnzkuBiygvSZTO1EEcitO', 'ADRIANA RISKA MUSTIKA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28466', '$2b$10$rtCTWHDfIWHf/23pogBCCOlE5r1kfaG.0wk55PRjo0HqmCWEHDG4u', 'AFKAAR FAUZI HANAFI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28467', '$2b$10$/IdG95/QmpEg/iomlDLmyu95BX6SuOS2UhOPT5h/hLSHGWDtn/Dr6', 'AISYAH LU''LUU NAIWA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28468', '$2b$10$J6.msXh0b2TR5amt1OvXW.hgHmqjV1H4D/93/9AkniaUhBr1hvFtS', 'AL IKHRAM RASYA EFFENDI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28469', '$2b$10$1NRyyuplfLDOD76orOLMNO4iqEdF/.a.M54l8AzTo5..vtjGN5gLW', 'ALMIRA KHAIRUNNISA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28470', '$2b$10$sdBUqSZoQFWsBT.sSDf1UeX9um8qUw.3wksOj.kYlprVe7QWW73UK', 'ANDINI CAHYA PURMAWIDYA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28471', '$2b$10$sGaqRP0.bNohi6U8ov9ei.Iof4aC1E.bHn0N73UzKN.j.zJ5.ijm2', 'ARKAN ATAYA ZULKARNAEN', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28472', '$2b$10$1.lSVY/ayWxQrEXH46Ltj.H5RxAVw.x7gJwp4fZy5vI84YQ8a7/Pu', 'ASTARIANI PAMBAYUN JAGADHITA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28473', '$2b$10$lOECDEDYV4cKC1fwK/bdO.IIBY/j4isT8DgXrSqN0khATWRx6vhpm', 'AZIZAH MUMTAZAH ZEIN', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28474', '$2b$10$l2ZfHtaynf6GO.aXLZAkSuz9rvzQp.JH.Q6/.1vvEQiiCRDaMlRSW', 'CHAIRUNNISA SALBIAH', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28475', '$2b$10$nTpKNiV0/1SwX.xKrzMCoen.crS5xSOnM3A4n.NEQ25JEK1ZYMXdm', 'DIAJENG VIDYA KHAIRUNISA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28476', '$2b$10$M8Pwm1RW9iY68zzTwXjxTOMaTiZ05tnHNYbQxhAWQHMtvDMX1zHd.', 'DIERO SHAKIY ABBASY SIREGAR', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28477', '$2b$10$zXAqV63H.YDM9Pd/BcJ.UOtmS1dg/kA5edJ6b3qRuQLynWoJqqjda', 'FADILAH ALDINA RAMADHANI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28478', '$2b$10$MNH6yVQuP4SEVsU2S9.Kz.n9RkxIXXw6NGdS71utPnM23hwP3Vuvu', 'FATIH AHMAD SYAMS', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28479', '$2b$10$nO2GUseJ6sWIYn5FwS2wl.XazRp4QwKKD4uF.qK88sYWHxi/E9ktS', 'HADZA ANA YUNIA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28480', '$2b$10$1vS1XKyyq/LStnCbnWA1f.uvuAELeJqlH4DE0aPpUIGpx.O0wG.Su', 'HANAN SHIDQI MUZHAFIF', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28481', '$2b$10$dg9MRb60rIfhe2IguoVSq.FlogQjVUD.pYr1zA2zyCgAluFlFT2WK', 'JASMINE ADLINA MUZAKKI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28482', '$2b$10$0Ec..b2QnOh0kdcmGiqlAOzAOzpcoqSdXqu5rBD7XWLW2WFSFsUhC', 'JHOYSIE JULIYANSYAH', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28483', '$2b$10$44hFTAna9CurCj.wic.ExezVfrgpUwjXYN0obz0udSM015nt55Mwy', 'KHAIRIN RAISA ZAHRA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28484', '$2b$10$36qrt.isEHldPtEwOL5aMOBmuZXIQHFV7knwkOQk4JyDbywVbNfL2', 'LUTFIAH TALITA ZAHRA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28485', '$2b$10$heR5HzPluukWqMGCBwzN6ep5U0s/mt.aYNXO7NIF88or4siRHFiY2', 'M FACHRI IRSADUL IBAD', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28486', '$2b$10$eYCxovdKp/DFmnSE6t.70eFCkU8oo7SOr1X6Fp7WVEi.qVpOYLNNK', 'MUHAMAD IRSYAD ABDUL FAIZ ASYAWALI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28487', '$2b$10$zznXHp431uMR2xE7ojvEe.yAaaDMb7HQWYxMNA4xadzo/xm5ESYAi', 'MUHAMMAD AZZAM', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28488', '$2b$10$b4.Qn9htoYB2XSfJ/TUz5.VfM7Pc79DKW.zsiF5QS4yI9wWDdT.a.', 'MUHAMMAD FIKRI ABDILLAH', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28489', '$2b$10$0sXJXR64C5YjgWfxfD4zJOviQVf2.HH/9DTW4W/tKlKKKOggqW9p6', 'MUHAMMAD NAUFAL RIZKI HIDAYAT', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28490', '$2b$10$/FARp7QqYhifnWfVfOWadeyAdIYF/v9VmRB2adWPmxaGdgKa/V1Y6', 'MUHAMMAD ZACKY ZIDANE ALFARO', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28491', '$2b$10$fLg3wtusR3TQWhQqWYawqucqgGtCssBT1iSbVHJMVkVk0GghjUEAe', 'MYIESHA KAMILA PUTRI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28492', '$2b$10$ckgdeXNCe0o/1suNoO5PMeaAXyienqRmejAlLWNF/L4IYNFCw2umu', 'NAILA SYARIFATUN NAIM', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28493', '$2b$10$o7rxtIomH7UbjH6nKqVzWOQxUTAdUeGhRN1T9LIeUFdUmpGQTLfMy', 'NAYLA AURELLIA RAHMA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28494', '$2b$10$3aYCF3FfHqCvkntLx9CPVu.pHp394uBbWWsgSlUMWMQhS7cNKlRiu', 'NURI MUDIA QOLBUHA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28495', '$2b$10$SWmwqfrWU/Rv9NXGcUdixOrx0TQEsowckw5GyoHDTtMR4xAFE0n6.', 'PUTRIA KINANTI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28496', '$2b$10$bTWQJxGwrWa7SVnf3fAyXeQvSBpmRTTfQC.ee1BFvkZwiECGL.OSq', 'RADITYA NUR PRATAMA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28497', '$2b$10$B.JVRgIvZ1UTWiMFUJ.Q9O9pT8OI8jIwJVzr32FaAufMNjEMjxzGm', 'RANITA FAZILAH', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28498', '$2b$10$dwum2Nj3SABpMS5Ul4eJze6.8zzU1FJdeXNR6B5VXwe1K8eDVksU2', 'RENDY EVAN PUTRA PRAWIRA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28499', '$2b$10$S/TjVoxZpOKvlYJjH/TtheifK9gCXd4MV.oAJnLiLrobcg80j6xP.', 'SAIRA KASIH', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28500', '$2b$10$mLdUyLoR7RMEvocvT71AruTbIGtDg.O4aDhLlxJlLFKFA98iZvdoy', 'SHAFIRA NURANDINI FAISAL', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28501', '$2b$10$tReOSr8kEoeR2PGJxSBEwOUzhLAyBeXTfAccMH.1CXpHCUO1WFtLK', 'SITI RABIYATUL ALAWIYAH', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28502', '$2b$10$oWto.sWC1uoTqAeVlgYNrOonUwx7wemDfpMPu9f5IDESUQHJHG3zS', 'TOTTY SOHIB ASHARY', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28503', '$2b$10$9JWEQlO81xnw6lBG8Ou82ebYXzpG87pHg.Oqqp7tAPeTDQ6MtkktO', 'VERLITA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28504', '$2b$10$iYhwf/2TZxI0qiCmO6wMVOGjMhMTN2ZPQ9bYfFBFitL//QRNmNLPO', 'ZAKIYAH RAMADHANI', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28505', '$2b$10$.TKVuSnKuRC32r519swDK.d9O8LMDXNafIcNx97nt.wEtLa6C8BPi', 'ZIVA PUSPITA AULIA', 'X 8', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28506', '$2b$10$y20PF/BjtOur8OvMVVGauuItDbKetCl5Gng1ncxCtetPJ4mJagT4y', 'AFIFA NADA FAIZA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28507', '$2b$10$vT9LEbTUsl.CMoVMob5v.uJ55jz6Q41r9jTlCxKoPdxtvn95WxJZS', 'AHMAD ADDAEROBY', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28508', '$2b$10$rvbp719npbrksL7koJ.Bvu2vpymicioJJ4kUEu3zsWXTA3DpqYeU6', 'AISYAH NURRUL JANNAH', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28509', '$2b$10$Uqg6hqme3cDcxLPbvY16ieF3jU.u1KV4Fg7N1LZ0sZfyOhuRM0l.C', 'ALAMAR NATHAN ANDHANY', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28510', '$2b$10$gZoLvbYF21Uqjzctvi7gY.dsjZbnoBd4nZX0gDiQfdNREk/hTkKfC', 'ALVINA AZKA PUTRI', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28511', '$2b$10$maZDGkGziAgHJhhlaP/De.9nJU8f/KYHJEqT1PqiYStjNuOzSY.TK', 'ANGGREK ALHUMAIRA AGUNG', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28512', '$2b$10$dWi7M7xhoriNYwbxGLNxkeLxCjP/vI5IJzZsOw0ktmOva82M2mK3a', 'ARTETA KAISAR RAHMAN', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28513', '$2b$10$cBfccaqCXaYTDBc9vhGuWODaZlPti/MCDVAXbib0LbrJmf6uuDQcq', 'ASYIFA AISYAH NURDADI', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28514', '$2b$10$y3POwrj8988OUPWN39ghluwIao1kFS5BHZtZQIC1MHiskPHfjGu7C', 'AZKIA KHANZA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28515', '$2b$10$eavsJ8yxZ8fmIjISJ.HtSOi8FKredV7ZzRk4ZXQrF.eCLSo9Oo2ZO', 'CHALISA ISHAENY PUTRI', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28516', '$2b$10$x8NM0cYomgxDBZs0WU6W3OgA/o9hfu/QHzxAnK57Yi7erOeql8B6m', 'DIAN ERINA MARGO UTOMO', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28517', '$2b$10$qphAAUK2mRTDBoWfD0hPMOTJ2AwnqflFXNXcKLxfUle0wGWxmcEiS', 'DIKA PRATAMA PUTRA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28518', '$2b$10$7juRfXzgCB6qVP9wP.0OeOYsOt/h6HR58Ghyq6dbkuFjXgG43A/9q', 'FAIRUZ EL NAFISA YUSUF', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28519', '$2b$10$zIAzZ./k32XdByR0pgFQEOXVsLYhqrbw/9QcouTXe/ek1noO6LbRy', 'FAWAZ YASSA HIMAWAN', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28520', '$2b$10$LXtl5jsz13KpIOHdm4bK3Oo77Kl9pltxGZtYn/0CvXG4f4Fr4.LoC', 'HAIFA NAZLA SANTOSA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28521', '$2b$10$kzcdyJaI8uTiRFgyGDO7yelZc17YPCrX1R/yB5triw5adnzvNIKMO', 'HANIF MAULANA IBRAHIM', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28522', '$2b$10$6BBixHiZbZAM0ifZ1lqnOe.zVXrwnNpHWvS6aA9zi6iE7Q5Pc/KM2', 'JASMINE HANIFAH INDRIAWAN', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28523', '$2b$10$rxH.AUEPFqJ1joMs9S3wd.1etiTino/92I6H32Yy2edymy3Cr.MP6', 'JUADISYA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28524', '$2b$10$Jb49tjF.ECihC1fTd50bNOcAoa6sfeUD2AysqVjNGjmzi9PtkUQOe', 'KHALISA HUMAIRA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28525', '$2b$10$q/kW3tewcb04jToLnR8Yz.qt334.k9Ed.SGcBI4NpM8ixqBf/Xn7e', 'MAHIJA ARYASTYA WIKRAMA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28526', '$2b$10$LAAJIK2wJmLOX/BhJCd0ougi77zIfO7uOhUXH07CL7lH8FNhOW99K', 'MAQUEENA RISTY AQEELA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28527', '$2b$10$O5vG/fvQH0XHGG0Wa.t0e.0RRnATnBuXVxmiF8kL.8wJjyWXq41M6', 'MUHAMAD RUHAN TEGAR', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28528', '$2b$10$zqyI34o8XdT5MZnRSs.BSO5y9qM0PAGgQRzp2QsyUIEtOHjVAnqnm', 'MUHAMMAD AZZAM ALFARIZKI', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28529', '$2b$10$9bsOD5oLt0FHzx8OXV0kh.robDsh6dIYlKcNu06iSj.i6//LGv9Pq', 'MUHAMMAD FIKRI HAIKAL', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28530', '$2b$10$yfkHJi4AJwJuy8aKbbdfFOiMS2DBuxSKzvOea3ZuAP6q1IVoviSFa', 'MUHAMMAD RAFA  AKHTAR ALMUWAFFAQ', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28531', '$2b$10$GJ9e50Em2Y/ce3pzD82aC.x44JIcykcpPfWDWViEsFffkPQj1.0HW', 'MUHAMMAD ZHAFARI SYA''BAN', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28532', '$2b$10$BHNak5bJhnGChRCk7QHzO.0ZAaqjid50rssGox8cogPiyq3rQ7qxC', 'NABILA ADISTYA AFIFAH', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28533', '$2b$10$jz0jhoLuIULo8pWuYc3E4O6/RRzYtFeXQoMOl7nAz.lVqETxa03ti', 'NAILA TSABITHA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28534', '$2b$10$tUBQN7ZOCMzzTpMJ/5cjTOGZUOgpitJTkYvSo/viJZ7OPn9a.qX56', 'NAYLA MAULIDI ANDYA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28535', '$2b$10$ZWjK088jV0Iw47YU2AVGLupE89kpKeablfqpDI0KqKHqypFJCLXsy', 'NURLAILA KHOIRUNNISA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28536', '$2b$10$dtgHDtXuH63hynLMuMbLyuwJH7FpInL5h0hdOCppVj.WKiI2AFAfe', 'QEA NAZLA KHALISAH', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28537', '$2b$10$Nls3gK.jOlEtMqN4wjg/TOU0rSj8gaJ7ky56hkNsfGYAVpxUIemFS', 'RAFI ARYASATYA MUSYAFFA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28538', '$2b$10$cDXw.rLqsQiRTHiaD44hM.WlRbh1i7kPf6Ik1V/.kxfi7ejtnso7S', 'RATU ADZANIA BINADIBU', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28539', '$2b$10$rZRBvsLFnmJaUmF.iEpuVuSyVBtqNfhOhQXa9kP4G8z1UaP7Fa4.e', 'RIESKY SALMAN FIRDAUSY', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28540', '$2b$10$1nndyXH7TTu4gA82G3cD1OjrU560oslIjnsX0ZVRdkmENJVLf6Poy', 'SALISA NURIL GHINA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28541', '$2b$10$S5xbFNO8Jh9hnwIikVLCXe5A4Xg41ebP65ChMPyrHwUocGjj0JgHm', 'SHAFWAH ALENA WIWAHA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28542', '$2b$10$6etx6x0utgheLE8ZaWI8tOsLlDXUpAaVnnPJBWiAr5OHVaLR4SRIG', 'SYAHIRA ELIZA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28543', '$2b$10$Rve6IVXvnFv.RADpgGW4Zu4gffB78MD3rEWKaOLLvUtOyAROCVKnW', 'TSAQIIF NAIZAR ROSYID', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28544', '$2b$10$7lO1oyxnNPLJZR0y2H/XcOZf9m0k5xptoVYfpfUpoAeoCi0nbDHii', 'VIRGIA ALTHA FUNNISA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28545', '$2b$10$ZaFxIdZEdA6dQqmPQDe6Ve0jEbN10GgaUj/.XzvsXDzwW86rwaxgq', 'ZALFA PUTRI WILDANIA', 'X 9', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28546', '$2b$10$MJmtJA0EAOjcVxDDrclaDOBUiSDrbH7trxdg9JR/CT6ogCY2eN.ky', 'AFIFAH FITRI SHAZIA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28547', '$2b$10$wiKs9AYuBV3835Mx3hjJpueO1AzShkfh5JbRju/6TWMKdZT5jUSpG', 'AHMAD ADI NUGROHO', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28548', '$2b$10$Z3hofUxdyRke0Lvk1GIhEusWwMTeJxmtJb9ZGxIHXTrJlKg2oEKDy', 'AISYAH TULIFA QIRO', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28549', '$2b$10$e..cwiHtCIjplnHzu738cORxfSMuj.bm.PbslrxrNMMU4P3J6AouS', 'ALEXANDER ZULKARNAIN SETIAWAN', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28550', '$2b$10$bCyKFM4ieczz6u0ct7YUMOpVXeeBrodBi0aYP4OPLM0voyHmhNr5S', 'ALYA NURAZIZA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28551', '$2b$10$oqLnijOhpgaSlqvCu7EA6unyh6m4kWEM52xxfUXKIhnB8lrnzkQba', 'ANINDYA QOTRUNNADA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28552', '$2b$10$1M82w8JzpLLnVT9qqjihGeIS30QmSXtwNDkNiVfoRUgyza3kt1D7G', 'ATAYA DESFAIHA KAMESWARI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28553', '$2b$10$W8A8aOXsNHVtutjn4emiquUE2XUrdNDs5iD8pOGnwy821PZNJLNu.', 'ATHAYA ZIAN ARSYIL', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28554', '$2b$10$.lahCikBIV0V7Q7HuHac1.X5BcLEbfmPCM52fXRwJM.eLCH2hDz8e', 'AZKIA ZAHEEN SENNA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28555', '$2b$10$ra3tzpZMKNY1LZYQ8EB2aeuxTyxNK.od9i9tqEddvVGeeWHSPr35.', 'CHARISSA DITA RAMADANI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28556', '$2b$10$JYXq2XeLR8Qpj0a75U9TBefPYmJ/CX.BN6ob8KvP/ISOeHHgPZdiS', 'DIAN KHAIRANI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28557', '$2b$10$xMHGPx8928kni.wq4Z6sg.eInQJmDGt4xaNaVojp4qgQvOOqwcbD.', 'DYLAN AZKA SYABIL YANUAR', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28558', '$2b$10$H6goMK2sVima23BAwX22kOWl8NTWFE/H8X88rbcJty5hZy03GYsFW', 'FARRAS HUMAIRAH', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28559', '$2b$10$/cQHMOoAX3EX2aN4wWvUwOURzaXQRsGsnca/ueQbrdWViWvfJI23C', 'FERDY ILHAMSYAH', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28560', '$2b$10$0jz7/12d/3N2OZpF7CK1Le0Vf/uARcw/ZMgZAm9N0XYCqsjzI6QEC', 'HANIAH DZAHABIYAH TAUFIQ', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28561', '$2b$10$fhHMPU0j2Zk8wxzJ3hZJne0Cdju8hElXxj7vHIpQpfV6snSndWW9u', 'HASYIM ASARI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28562', '$2b$10$9aL0HVUXgowJhgpfTQEoLO.zpLueT5kZZk1PbpDQPrcV59mmm6eSq', 'JIHAN KAYYISAH NURLETTE', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28563', '$2b$10$OOd9E.epZlie/B2AIDejuOjMaJa0wm1mDnD57ZbV9tBCFt41G0Xa2', 'KAFFA AHMAD MUFFAZAL', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28564', '$2b$10$pFsdMoOwX8bdkVfHzx5DTu2L7EPoXWOBmMdYGW3oR0YPlaY6diW6m', 'KHANSA AZZAHRA CHANIAGO', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28565', '$2b$10$Jox.5LrYczRVQDiBK3j/xuwOOfDQACETqFTjbFmebnxl3Sh0YndQe', 'MARSA HANIFA ZHAFIRA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28566', '$2b$10$Uc0LMI52bhL0Kn83Iruzf.du5Agl67ZagVeHXkAMpdXnQ0l1VoRKm', 'MUHAMAD ZIYAD AL KASTAMI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28567', '$2b$10$JSo1pw3wr6cmDN0iL4/INOkT8TC5jZ3Pov40frHxcuqs9RY34fEoi', 'MUHAMMAD BARA SAPTA NUGRAHA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28568', '$2b$10$wAdWVEv8/de3gq.oIuWhK.Iy7n5H7jxn1FUsgUFp3bcuxBkJnmx9W', 'MUHAMMAD GERALDINE ALHAFIDZI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28569', '$2b$10$ItHylAW7xLN37C.Cwd9W2O5q5i0GTLZwP3.KjoOC8hGbNQVqJqb/W', 'MUHAMMAD RASHA SAFDAR PUDEN', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28570', '$2b$10$tLqvlSk7CWZL5kMXHsEL1.6oayWNcYvwZFA7s4D/JyZ9094/9a8Ly', 'MUHAMMAD ZULFIKAR BADDAWI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28571', '$2b$10$bBgR9hJ8e5r..aShLFRnCetGmkXozdVMsMyPM4LsFixmPmrTQqfPu', 'NABILLA NURHABIBAH', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28572', '$2b$10$b7O2phtioXUohQWy1hC6H.bAw9GeAxBMZl9uVsbLV9qT8./AsSp8i', 'NAILAH FARAH AZZAHRA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28573', '$2b$10$5mPNGd3U.pUkkM3V/j4v2uhTK8qFeVcGKXF/zrvQVJN5RmouRDbKC', 'NAYLA QURRATU AINURAHMAN', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28574', '$2b$10$VThGwVhFbDad7GPsTTP1fuHNDF8H75KISX2pCYC8AJGP.2EtKguz2', 'NURUL AINI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28575', '$2b$10$ros/ZF1yhb7I.2Dn/Xo.LOVf68kLWowELu60p6lPqAlTbAwbHYHMu', 'QIBTI SALMAHUSNA SYAHIDA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28576', '$2b$10$ZBVtmVxmnK3SBNy08Rx/L.r5ZC1XbFSVT0jUqqGlk0DVENB9qiWHi', 'RAHMAN AL ANSHORI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28577', '$2b$10$xHOBKFAeeh1L4O84IPmU4.6zraWZzeur.53f6nd8UdXc8CJaeu8WW', 'RATU AZIZAH NUR ANNISA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28578', '$2b$10$7BNkrmduQJhKdct2xoUXJejvJeQAIVZGGfJRrbcCeSYPVHc1lsEnG', 'RIFQI AULA DWIPUTRA KURNIAWAN', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28579', '$2b$10$/2SufZz9ttiz3ZPFWrHE..OgxDiOJFuJZjvaIH.JXnBUDNW9QfV4m', 'SALSABILA SYAKIRAH QURRATU''AIN', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28580', '$2b$10$g9kPntcnCtxyQzSdco7m0OoAU.axC4SVYL.6Sq0ZkrsmWH0lryU/6', 'SHALSABILA NAURAH SUPRIATNA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28581', '$2b$10$cewZ8ePOM6qjikAwiog6MeylVocFnZnWM0aYFij.ikzO0/1cwn0oG', 'SYAKILA AUFA MUROBBIYA', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28582', '$2b$10$uOxytfcAn5RXfJ5u5DSH5uVmce7whVaFd4qiEqaOlf9XNRgo9MYoy', 'VERLYNZHA AL ZIBRAYN', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28583', '$2b$10$soyJ7aLqArF1.F03BGo.6uRYZl4AGlhieyQqKxbFUd1TKtq9k69nG', 'VIVIYAN RAFIFA ARTANTI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28584', '$2b$10$u5IiIrXq/qXNWazJQWlDC.vmr2L1Qg79.nT/V63k83H1G0dD6JUTe', 'ZARINA SALSABILLA LISTUHAYU PRAMESWARI', 'X 10', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28585', '$2b$10$5ELxPNrW6q9sHceFLQAUPOGuYs0JCagsdb4ArzNqmhurySrQ025Km', 'AFIFAH NUR KAMILA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28586', '$2b$10$gyNRB/gByx.F4vp6c346X.oijk7Mn9pYAlsnyGlF7cDVaGM/SjlXW', 'AHMAD ALIF FAKHRI ATHAILLAH', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28587', '$2b$10$d5M/wHwez9zamNS3TuMvHudQEyNhxTSiBxUqAXRKlxOU68L3QXeci', 'AISYAH ULTRI RAMADHANI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28588', '$2b$10$I9ngz4ExbHMKno.7cEubwuDiv98rX8cV01AAS.Ww4/mwgfMFU0LrK', 'ALFASLA ORY RONALDO', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28589', '$2b$10$HkHzFRggByV/KMB.hxm1y.twOz/Ht0FY59jJ2PtCUDbLV2fKqQPda', 'ALYSA NAILAL HUSNA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28590', '$2b$10$ysmlbeo2rhcT2yTPHKE1v.fWt0Z.Z6Y3T1Lhosn/xi5EIr2zQImim', 'ANISA PUTRI SYAHREZA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28591', '$2b$10$vxRxLsNuxJVo4tYMmnHF..8bS9r1pfbBr9df.zJ1CicOMLkHDEA9u', 'ATHAYA CHALISA PUTRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28592', '$2b$10$Kn/662vBs6p1ceK4prispuzjzXurKK0pg11O1vwmgS3ls6HQw4Qii', 'AZKA RAYENDRA PASHA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28593', '$2b$10$U6eR9Q.KafrYm6852kt1sey51.G2FJBJKzj.FyX98jdUspW.7bXoa', 'AZMA IZZATU MAR''AH', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28594', '$2b$10$09MUf5A6Tx.xTQeO0pAR2eIN2QzVelPVQkDk1T0SgMxbT/vFqUos2', 'CHARLENDHITA PUTRI MAHARANI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28595', '$2b$10$8iY1TT7aUA8k/NRpwA6DsO8HGG5/s4AAes6eaYb.do3VcGQCw0vT.', 'DINANTI FADHILAZIHNI IZZATUN LUBNA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28596', '$2b$10$mxymLsep7tP6j8yIR7q/..mvl6.thZvqSsbhyq4iSGYHTKn2zVe1W', 'DZAKWAN EVANO BISRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28597', '$2b$10$XB1SQRJTeJm/nd/eDWISxeviz2fk98BPFGiOkB5VqQ5mNx.PNyVLq', 'FATIMAH AZALEA DIFA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28598', '$2b$10$g4pSiFf9tIH4QBd3MfLC/eo0PyeN2UEqpR8VTBSZVNU95mwWJNjou', 'FRIENDLY ASRI AGUNG PUTRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28599', '$2b$10$exkGR/qrGTTWJZ1SEIl00u6lhxOCPx0V3YJSWqDAwcEXxpqWrtX2a', 'HANIFAH DINNY ALIYAH', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28600', '$2b$10$PeSnz/jMQSuuGfY5ukcgsu/7k7fMLL/dmTAMj7fPZgI7/qCJjF5wS', 'HIRO KHALILURRAHMAN ACHMAD', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28601', '$2b$10$KoAfvQpOnGh6fO9jDeLvSOeduTjkqrUUUykH/zv6WcipA8BmnDiZq', 'KALHENA PUTRI ERNAS', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28602', '$2b$10$9kCCUzZuesE4Oyehq6hJhOndZDgnQJ0z/Fv4SAT/.je.rQkorlufK', 'KAYSAN NAWFAL ALI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28603', '$2b$10$HE.GvTWy2VBb4/YmJ9Raa.60fQHJBV/cviWPCQKD85TgW8DUpz.TG', 'KHANSA NADIFA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28604', '$2b$10$hNLinuJuuphtSeubmI85t.PsreF.W48/zmY8fIPQF5zplkgbPdJJ2', 'MARVADHA KORIMAEHEZA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28605', '$2b$10$Y2r8C9lLF0lXRymUF7KVqeM3fsnhXmrNSi8S.PkcykjoVXEgOtvcW', 'MOHAMAD RIZKY ATALLAH MAULIDAN', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28606', '$2b$10$yo6OxmWN7I/1P7RN1t8pVuPTCxI.2Vy/GcopSJnH5MWLapkgk2xQS', 'MUHAMMAD AGIL RAMADHAN', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28607', '$2b$10$HRw56HXOzDCPNeMaBuDqFeR.zQB2HuS.62kzVmUbI2kOCEbYMqyii', 'MUHAMMAD DEWA ASTRAJINGGA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28608', '$2b$10$H4iguL7QyjzwJJNFdqKdrup0rC5bsy0uxA41luGk1dBxJL6K60M5.', 'MUHAMMAD HAFIDZ DWI PUTRA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28609', '$2b$10$w2ZaFK50YJR3dYoICZU15u3U/dSw948pZMifiBtb2/VtiQc2LF552', 'MUHAMMAD RASYA UTIARAHMAN', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28610', '$2b$10$tFwQ2ZOPfP8dXUoqnWXZM.mZnkXlbKcjDArv95vIy0LnuQ8pHW.ei', 'NADA ANGELINA PUTRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28611', '$2b$10$2FL1EM9z7kAe.rCJQlTcouQwGS41kL8KqKTDrWx0CM7zXiJEEUOpS', 'NAFIS ABQARY RIADI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28612', '$2b$10$tTUgf3khBuqG/rkOh0vXHuIfzJJwmbQvVA4OOsIRFf3zyTMru1q7a', 'NAIRA AULIA RAHMA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28613', '$2b$10$ugqMaXUwGi9qsvIoichRRuidbDgmbke8cMkxZyk.y852u83dTf/um', 'NAYYA SYAKILA PUTRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28614', '$2b$10$.r3UO6NrXxhA171D9CyFseZcSCJYSPUdTkGBKgdpdI6j.JvARCMTC', 'OKTA KHAERUNNISA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28615', '$2b$10$gOEvYJoI.9n2dbXQxjjtpukqX5m4r2pifp06UGG5lcH5siu7/TzrK', 'QORI AQILA PUTRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28616', '$2b$10$dsCVgxPJ6Cm8J7ntrAiPHu8ZEQRezPj8Ov3G16v7fNk5rdxKibcs6', 'RAIHAN ADRIANSYAH', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28617', '$2b$10$UhzZnDUEf7nb.QIvjCpm7ewWvZZAIoJ2mB2cESnOkTNsziyReIbqa', 'RATU KHAIRA HANATAFQA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28618', '$2b$10$zIzgk.mj8GTX/it9v7Y8Ee4kbCUmjZi2sLhQHXtWDIDGqojis5F.m', 'SABIAN ABIMANYU', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28619', '$2b$10$MnJEKpssAfFC0FC4DSNvnuR8BNkI0KuIR9iesUzm.bTUK30Od0Cou', 'SALSABILA UMAYMAH KHOFIFAH', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28620', '$2b$10$IKgckhd7oHoCvzpGoIxAXOiCic1WHw6cCcVr4TPg.vXCGZ7XTe/xG', 'SHOFIA RAMADHANI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28621', '$2b$10$CxJ7Wel96asCNoUxDopD1u4V2Fl5uhi1TEr8B/upB3s0p0OWOv0ia', 'SYAKIRA SALWA TUZZAHRA', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28622', '$2b$10$ktnfaN8B3O/ZzVczM/pyS.BfjnHIFgdG8B0A1CQ0AhHUoh0/qJoVm', 'WA ODE ANNISA FITRI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28623', '$2b$10$jar7RmCUdVBm4Q0WgNWNVuT59YtwGuXx7A/cwVp6XjzjWhiJsDbyq', 'WAHYU AKBAR RASYID', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28624', '$2b$10$YK1z.q33FFyzCZ1EiD6r1e25Ykf3ik8HaYZrIBTC6SAMogRsvBK4O', 'ZENITA NURHAFIDZAH ASMIDI', 'X 11', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28625', '$2b$10$XMuA7O7G9XjT3dfDTSxM.uT58Bo7NdgN5gdpa4un.hDsF5M6ClanO', 'AHMAD AUFA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28626', '$2b$10$N4fofhj7Ic0DZYdJtL3AHeyL6IkBxsi9ej7AFh6KlO.9Iu1p3hieG', 'AIDA SARIFAH AZZAHRA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28627', '$2b$10$pH6Pktd1Fy9MLTNkDu1Xzu4rSTIJ01W/Me0lp/4Bo5y0sQBm0PeR2', 'AJDA RUMMAN AZIZAH', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28628', '$2b$10$V7kNElt/4RPKbKYO8htCYO1S9BEAWuOBlzZV9ZmO80992QINxYI0O', 'ALIEF ARDIANSYAH PUTRA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28629', '$2b$10$HqvBC2KjkOj0QDPdAiC0kOoU5yEP3kgaeqXctdYlFuDlLxdxWEicK', 'ALYSSA RAMADHANI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28630', '$2b$10$TNMdAdVbQUsYTjnIWoxbwuoLgRi5Q/tK0mgng3puH8/jD2DtmzR1O', 'ANJANI FATHIANA YUSUF', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28631', '$2b$10$pYdYOvZi9ZZ46kCxyVJWLe6BI/o5DPiGMaN7jlFRAPMoS6WyHwcRe', 'AULIA CANTIKA EVANDI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28632', '$2b$10$ZLGRLA.QHjGC2LXUEDTq0O2TsEtNnq/MuHmqARVwrCzq412B1kCYC', 'AZKA WAFI AZIZI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28633', '$2b$10$z.V8eMcfYSxGM6GQj0qbNe342u/mQMxsQtYwz3Cxbu3AJpP/h20LC', 'AZRINA NUR SHAFIRA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28634', '$2b$10$62nPDuzaQyi5ttDKEkdbfugW7Lp8HJltOVnl6R/aIfqV8SFowZGP6', 'CIRA SAFA KINANTI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28635', '$2b$10$MhqqY9ufRr.0kLyiyI7W4.73aU9TKq3JJOmGMJJTj/E/49xqgujiq', 'DISA AZZAHRO', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28636', '$2b$10$PwplKuRMtSJMoZcxS3EW5OpkfMxIUtY1Is6YWGbCi2qgi1LlocAOu', 'EVANDER ZIKRI AZZAM', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28637', '$2b$10$dLR9POGAoJckaAlD4q9zzuBD8PUaTg5EvvMri4LOanAUB7K.KHLm.', 'FAUZIAH ALIMNI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28638', '$2b$10$S9BbwzRyQ1dTWTJzgZcxIub/F1/fEiS6RIv2BJHvC9ODLtyLLGUyy', 'GADI SULTHANAH PUTRA AFANI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28639', '$2b$10$khG3KbKoN0GYKKDQCQY0o.AQF.0hAyqI7ZRIA2EON9cMBBbtq.dna', 'HAURA WAFA SAYYIDA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28640', '$2b$10$uV5vWhgoKcApSFdPXcNuc.eZ8HH2MHvL6bVFsg9jTrUknXDhfG/V6', 'HLAU ANADOYA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28641', '$2b$10$hZRsoZ7oJF/NV8LMTlueT./maZFWPh751nUwRJLkS3yNkOh5Ymjt2', 'KANAYA HABIBATUL ZAHRA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28642', '$2b$10$NNNTNfpbDdToLTa2PfSqC.6fmkiuPs1czEC47xKmxrCDhI9kom4pW', 'KEANU ELANG AL BAHRY', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28643', '$2b$10$gCW7PDut29cFdmtO2CXdcOj4NeCz3uL5QFW40jFhBHNvH1Z77cqR.', 'KIANA ARDELIA BELLA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28644', '$2b$10$mxxq8FwZ2o3L6YJ1OUM5A.Ha4iyLJutPg.oF16NJszNF6uyr4z63a', 'MARWA SHERBINI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28645', '$2b$10$2ie7hTNV79IilWXURhhHC.xQzd.aRmJSZLgpyx73f2zZccANIq302', 'MORENO ARIYA KUSUMA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28646', '$2b$10$O6m8Cc8d4Ljm7ofqzkD8eOhpdlx1vdfFcnw0IuK4wDqQlw.kfkNIC', 'MUHAMMAD AL FATIH', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28647', '$2b$10$JqdJlBU87WBzJieIB/b9iuXzTSHeCEgYKSxHEkMc9V58awV4hRub.', 'MUHAMMAD DZAKWAN ARKAAN DIWIANTO', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28648', '$2b$10$wxnTUTBvd/iVcWU3iLrS5.am7tgsUL65p5UMpyeWUdfhH4Vgdyy4q', 'MUHAMMAD HAFIDZ KHAIRY', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28649', '$2b$10$2QFAzPbueU512LrmIAqoo.BDFgob3eNoAAqetRZRE5iy0mJQnB1S6', 'MUHAMMAD RASYAD DIMAS PRATAMA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28650', '$2b$10$ee5n49FxEkAQQ7IDwS6IPOm7rhzyYhZr9gulfpdtJ7Qw0OUa.7oNq', 'NADA SHAFA AZZAHRA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28651', '$2b$10$P0FvxrUexa2I5g16wR1G/.R572vqkdMfYU5EWRjgy4.0uPY4GvATq', 'NAJLA HUSNIYA RAFIFAH', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28652', '$2b$10$AZ2A4Mi5HPmK/YaBBdAbw.VIhwClh2pAGMIigB.A79NkA4sPj63mi', 'NAKENO WARABRATA JAYA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28653', '$2b$10$19iYjnU4dfHblfzIgUG5w.fSEDn8K1l6MBSl8VZ.IuqWH6pHeVZZK', 'NAZMI VYANA PUTRI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28654', '$2b$10$zOVqBq.gdf2flhONLwmYLOk8yBoZ/CULU4q2.WjU7X9JFJkAIlGc.', 'ORYZA SATIVA INDRAWAN', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28655', '$2b$10$/fTbORpOLXNbykaIgpP4CuJ90vtiUUuT0rh3I3HSp6fYNjh.FyalG', 'QORRY SEKAR KEDATON', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28656', '$2b$10$18CazNjGeTp4nNmVa7ZKJuXC5lPvPqthpTj171lEyCwZk2pyoy4Tm', 'RAIHAN AKMAL MAULANA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28657', '$2b$10$LuHg4kJQyMPROk.9rwCawukVWPkZ9AaLu0hPi0eT/7950CBiocZJa', 'RAYHANA ZAHRA ISKANDAR', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28658', '$2b$10$J98IFzk5ppHiD3M5LSDtP.ZFGC8M.iPDKLZlra63Qb/eE6qs03Hh6', 'SAHYA ADIYATMA KUSUMAWARDANA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28659', '$2b$10$Eq6PLQmtwx2Z20DzTDrlEeHsO2wHdbnIQE5I4wJ5ebRvGMmGUt.au', 'SALWA AFIFA ROSADY', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28660', '$2b$10$CoHCK1vzwOEk0LBMX/qpRuHM4KZjMA//rAP6X1OUTW8Lt8O.w1AuG', 'SINAR MATAHARI RUHIYAT', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28661', '$2b$10$bdUdq8hW9b70z/yGdpLECekP7jDGTo6kDOJOlv6qhxrXHXBx3aKAS', 'SYIFA ALMIRA NUR SHADRINA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28662', '$2b$10$qzz5gz8zSfQNbVFyGM.YQ.1awCSsybEp3XSVO1gNGV1pQGoRtrS9e', 'WASHIFA ALMAHYA HUWAIDA', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28663', '$2b$10$Y2l5cSL3MVu08gpDNjw.R.5IvIsGGCNOsTTaV/5i8Hzt.xjge5kxi', 'WILDAN AL KHULQI', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28664', '$2b$10$qbqhaJELmESmyOJBrnm3CuHjd.kabL1Jn9FRI3xaDo4jrAqlBM9qi', 'ZIHAN AMEERA SULAIMAN', 'X 12', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28665', '$2b$10$SDPWoooHiJU9QhK9O7gi0eUOknj7PKbniHh.sAtxf1CJYvvdSPJOq', 'ABDUL ALZAM FAYI RABBANI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28666', '$2b$10$vryzQ.SGzk8WVLk1WJuEI.P9AFNLJRfdM1wVCCWHHmRvoTgwtf4Bm', 'AFIATUL MUKARROMAH', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28667', '$2b$10$XZcL8Te5768CMAf3u3TKBO7IQkoBJUNW4jIIkWbpBj1embMT6uE26', 'AJENG DWI PRANA KHALISAH', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28668', '$2b$10$f9Jgsr7MxnZwlGDoduHFyu7AU2PlVVDIePKGlqeFlL4RZs1F.3D7.', 'ALSAVANA RIZKYAN MAHARANI PUTRI SANWANI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28669', '$2b$10$iUOvLK644fTOdg8FFcD.GOnAuIjxkxJvWf3lbVvtVh1l0WTPT62C.', 'ANANDA ALVINO PRATAMA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28670', '$2b$10$QRyzysaa/Kkau7m46kJ0puJUuIXtNIPk7ILKDFiqn2c0qajyDGkcW', 'ASYIFA QONITA RAMADHANTY', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28671', '$2b$10$ckzU7lNGckiA8.hsKC7XC.VwO7zeI920ciPHzrG1GB.UUCb6nAQVK', 'AUFANIDA JAUZA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28672', '$2b$10$9rHmpEpBQrwAvKaPQAxRNOme8e1.VE0aVbjJVx48a0jItHO6WH0W6', 'AZKALEO ALIF', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28673', '$2b$10$JwWXTHPrvljRrpLWeORBj.uqWJ8u6b1vnQWjN7yFwG8EJBpKGYKaa', 'DAMIA ELOK MANIKA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28674', '$2b$10$y.s.l1R4ZtXaHnsQ5k3lGOjrrDqEeRSTANp1uuG.K2VE9gAtn2BQC', 'DANAR MAULANA RIZIQ', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28675', '$2b$10$XTnyJmFrhp7BNeqYZEa9W.BW.YpmtsL9JQhZ3NyY4Mcg.a.14ltC6', 'FADLI RAHMAT', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28676', '$2b$10$RA0N0fH0OWUFLfJnLuYwvOg9lfEd8RFGyDtDB7v6Nencbiedm4gK6', 'FADYA KANZANI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28677', '$2b$10$gDGzW1qnkI2gK8S26eSUOuZnYMY3iLnqhNrDwT6u4WckXbxnzKqYC', 'FITHRIANI SILVI KHIRANY', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28678', '$2b$10$H5NOl3gReIGngXSkdml8I.mchVY29aoOgGlN6RUykeC6yByiTqXMy', 'HAIKAL JANNUR RAHMATTAN', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28679', '$2b$10$N6/kpXVOwzAO5EAYhgE.MupsJfc2TlOqFvkwSsPovb0qXlALpGNw2', 'HASNA AZIZAH PUTRI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28680', '$2b$10$bsrQ1YsjbJG9ZBXeumPp2OQWO/63EtzMDXL/JFJu7p.ZuBTzjgH8K', 'KARTIKA RINJANI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28681', '$2b$10$LiWNWqkDPPyTpDWLw0VxUehU4YYX.r1bhWgI.NY/HtAQtihlpCuQa', 'KHALIFATUL AZZAM NOVRI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28682', '$2b$10$VF0PrqWUkyORGGiO8w.JseDOKj8YTcTzX1JGGFD6G/cANkHvdhr7K', 'KHAYRA SHABIRA RAMADHINA PUTRI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28683', '$2b$10$uOnBzYs1OWIfonPuRbVuSOW9pU8etPS0D0JCrd3kBxzLKTmoNaBR2', 'MAULIDA FAYZAH DHIAURROHMAN', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28684', '$2b$10$yus.YZan2E.HvD2/9k.mn.Sdh4BbaNwNApjVxj4HmxdJG6OwIsxLO', 'MUHAMAD FABIAN AL KAISH', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28685', '$2b$10$XLdkmNyohAYAulBPnWwcRu.DWyFmCl5Z8OaejJoS/OTfzwxtV098u', 'MUHAMMAD DHAVIN FACHRIZAN', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28686', '$2b$10$kwbm2H4sFxkGF3kw.BsW0O033X.uDvXxI/2m3Bt1lkjNhfHXFJeYi', 'MUHAMMAD HAFIZ NURFADILLAH', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28687', '$2b$10$ZPg.oNywHu4USIhasVMx0.AMpZQhFyGl5dXUKw7dU6FXwjX7WqUf2', 'MUHAMMAD RIFQI ARIFANDI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28688', '$2b$10$N7GJP4qsTrTXxQdusyLrb.mTySFx.VUZGG4PDk6OV3OqZpSfg6RfG', 'MUHAMMAD SYAFIQ ROBIANTORO', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28689', '$2b$10$CiWNemyYpOrHhfuBrB12jev3Dz4YeBYfXtsqZ4nIUInJ/QFvWcoPu', 'MYIESHA FAUZIYAH PUTRI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28690', '$2b$10$9L8bYUPytJyCtyt/q49BweDhJl7mhwlXTkq0dhFs8Wn5qWH7wLGa2', 'NAYLA ILMI HIDAYATI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28691', '$2b$10$4Bzdvmq5uzjJiOX.wrISrOszqP3UJHd1Vy7Vud6aQ6LwD2ckzqIaK', 'PINKAN EL MARYAM', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28692', '$2b$10$XGkdocX/CzIsHoX.LKIvQ.W8aR4Thk24J2GSCptTp5N.4WRy34TPO', 'PUTRA RADITYA ALFAHREZI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28693', '$2b$10$m7J48T8jbyU5dAEHYoImYu7ACWEDO.Bj0Seaa8rE.K7rb3EMrdVwG', 'RAEESA RIZKI LATIFAH', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28694', '$2b$10$pubd8FGjbqBejJFkTGxQs.dnAs/yTEilue8KWuM1KqR7G/xcR7Uhq', 'RAFID IBNU MAULANA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28695', '$2b$10$V34EN2NVd1QnH4YlUGHxAORTKFGgjmB4LeWPuQwbKx01W5riBZkBa', 'RAJWA JINAN LUBIS', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28696', '$2b$10$lpw3Xy1Zv4vioGK0MyGS.O9AtgzU/euxexhRWqq4m7I.zjnbQEu.K', 'RAYA MUHAMMAD IKHLAS', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28697', '$2b$10$Upge0BMGN7eCv2wulRP6YemwzJZlfuOItTZetjQCcMy9QxEodIT5O', 'RIZKYA RAMADHANI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28698', '$2b$10$t8PXpurBbYs0Do0RWZLGNeHFEcs4Ty2h43ckEZ18QT4pmazvNtRMO', 'SITI FATIMAH AMALIA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28699', '$2b$10$z8oe46A88T.u8Y6zY2Snbu2GQSyJ4YP9FH84BWjd0Z6co1AoiMQO6', 'SPARTAN ARDIANA LUTFI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28700', '$2b$10$8EZbb2Qcr43EsJvEc0fdw.Y2SoAYpXhdk2n.4ZUzIRKHdptWQrLrO', 'SYAHIRA RIFDAH RAMADHANI', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28701', '$2b$10$UgVhCQErMss3ZMLCeOqOQOxyW5QCtxTkwl6DyiDJq47HPSjaUprSe', 'SYIFA PUTRI SYAHBANA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28702', '$2b$10$O2ldU4CQDdriv/QVg8BSvuJ/5klpWwx8628UNDFY9d/I7h3blIpeC', 'TIARA NAJMA KAMILA', 'X 13', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28703', '$2b$10$k0iIzkxpQYQAj8x8RD5CWe.4EgXPM7BHwPipPwlVKFQ1nwa4qGOAW', 'ACHMAD ZAMZAMI GUMAY', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28704', '$2b$10$CzbWnn5pxxxCYlf/P48VnOMsPHA5OIKIRFo3yeH3jzGaBh65sTOTm', 'AGHNIYA HUMAIRA MU''MINATUNNISA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28705', '$2b$10$xTmLTh1hb66qUg7zRDEi8Ok/SgmnnnxFS6lwKWd9fe9iBBjt/KLFe', 'ALISHA NUR AZMI ADHIBOWO', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28706', '$2b$10$nqQkIuvN1IS0zWIjqUs1oewJqtytxk.L40/uT0bYHvF4RUKMbbyJq', 'ALVINA PUTRI SALSABILA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28707', '$2b$10$Ix8m.wSJ4zFQ/XLSyhKoDutvG258LCIYGyyvHzAxEYOD/dHtpegHy', 'ANANDA SUPRI SUBARKAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28708', '$2b$10$mzXjnIlqtlOzJflOh60yQe6BmllKVk0f8QDLfaHcRy.GDP8kTgyvi', 'ATHAYA SALSABILA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28709', '$2b$10$NLOVrPT.KnYS6i.xb1b/EOh/A1VWC1cXEKbodJcgSJ4yGFXZEiISq', 'AULIA HASNA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28710', '$2b$10$hz.6v9W4agpZnccLwTWul.i053SxDXt6gFgiHJThEv3MqnfNrSmcK', 'AZZAM ZAHIRULHAQ', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28711', '$2b$10$Pt7UrSkkqyD2TLNCvE6djeM6cBRr9SXWTHMmCxCSXDRBIqnoierHa', 'DESKA ARDIAN', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28712', '$2b$10$Y.E/WSqy0DjNIRgEo7N.d.ktWp.wAEjpGDuSKywO26O7ruvOMYV8a', 'DESTIANI AZZAHRA HUSAIN', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28713', '$2b$10$lgpMLTByhv1R0RkgdrWMNe2OaLf6fbJgj.hgJxpCUtHpqb2104QCC', 'FAJRUL AZZAM HIDAYATULLAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28714', '$2b$10$88hvkv38Uj3ayJKfwXfqGepmNMm8QjYr8EtRKFMjUam0anDGJRO6a', 'FARAH AMALINA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28715', '$2b$10$uUUZk/KOsZlhlIVAnSFK5epSdJDQ3xtE4xa/bqmwDJWHOGqvSlUJq', 'FRISYA PUTRI ANDREANI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28716', '$2b$10$W8KOjaI3mREK60/x1OhsNeRrkQ9aDZiHBpMsDoOQ6bJ1yKEmR8mrm', 'HANIF NAZMI BAHRUDIN', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28717', '$2b$10$YV8ekW0sKUwj4wrUTaKiT.sVYtycC99ToyD3qheC1mCJjU2hieMHO', 'HASNA NA''IMAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28718', '$2b$10$skjDUjsNHEGD0gvg5zD2RuRqhtYtwHMyAla6faygOeXGUbFHXuyzW', 'KAYYASAH FAKHRIAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28719', '$2b$10$epXN7/SDsUCAkjRsOvAiNOX2hh0Pa4On6w9.qFAJk/sN2ilE7yFUG', 'KHOERUN NISA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28720', '$2b$10$.ueT3JzWowj.pYQNSeSHXOH2rYZny1XD67p1qdD1A8eFATenZA2Ui', 'MAULIDA SUKMA HAQIQI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28721', '$2b$10$p1.1Ek4gfj3Ma1K7woUpReggXK4VJIyUMO7csPFMyabr656wp6TCO', 'MIFTAH ZAFAR ARYASATYA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28722', '$2b$10$jWcyTiaptiJ79BIL7p/5n.Xz0VdxDEGElWiiwYCvIUnSt23Dzm0sG', 'MUHAMMAD ABDULLAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28723', '$2b$10$VVsdH0TariPfk82F/fl45OQn6sdBrYUvFIiljMNxa/zz7d/0gqz..', 'MUHAMMAD DZIKRI AMMARULLAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28724', '$2b$10$PM3PiF.fu8N4wbFRGJyH1OM.9b/CkzXz/qyRk5ANXaOZycGbj8S/S', 'MUHAMMAD HANIF PUTRA SAWA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28725', '$2b$10$EJjWOxf1Ae6GJ/VLrUn1IuMLgtInZlePS8byUu46reO/xPFL5opoi', 'MUHAMMAD SALMAN HAZIM', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28726', '$2b$10$9B.Xl08INwcECLfhQv/JE.T8AKCZm6t8zDaDkt.6CRMRlTdtS14ne', 'MUHAMMAD ZHAFIF KHAIRULLAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28727', '$2b$10$gePwXJOjRA9LnQfqJzamdO/F5Nb1PECRsjUbpnmA.Z7LgKP9Zgu4S', 'NADIRA AZZAHRA PUTRI ARIFIN', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28728', '$2b$10$S8XsCVpN68olht4GlxF6VeCWVOzfd5GCLMxerPyAVb.l72g20oq2a', 'NAYRA HUSNA AVRIANDINI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28729', '$2b$10$TJ/tpyl53FGUTBsBZx3SNusFmZDOLfkQ7apbuxANO9ow9LOgDyCj2', 'QONITA ASHABIRAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28730', '$2b$10$7KI2kC1vjqOBTqJujOAd.eWNzhCDMnwslppDecC6QPbQDQ10kFJcC', 'RADITHYA GUSTI RANGGI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28731', '$2b$10$F3.PFbZ1kgSXf9MpS7sMZuhn8YREdfCm319.qsdrcF6Br5otBy0Vq', 'RAFIDAN RAENDRA WANURI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28732', '$2b$10$e7VdfqpUiw.ClH3IupUF3u5tGK2fjQ3li7uUp3RDDvh0B3b2jjUOO', 'RAFILA KARAMINA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28733', '$2b$10$dFUdGVoZVronaiJJqXjNa.g0M4vkSbsDQrveHTiuAT8KseblG77KS', 'RASYIFA RIENDRA WANURI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28734', '$2b$10$D3b8yul45XxvMDxytPjAq.IhlPtXVkOh1TuX1su41/kgPof1.DPTu', 'REIKI GALAN PRATAMA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28735', '$2b$10$cWXZfSUPA07uHT3BzhizMOO9zVvdCMBxMXmbKstD4ZI8ECHQ6YODm', 'RIZLA LINTANG ATRISA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28736', '$2b$10$lUS7lDbEbbJ1a8Uxg40DDOoMyDbbLjIV.iCuoY.oik/uIB3nQy1W6', 'SITI ROHAYA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28737', '$2b$10$oc3EB6DkerZnIkBW/ZDM2uE1kkMkmu5aCBN8690uBFBJ6wak54Tte', 'SULTAN AL BHANI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28738', '$2b$10$unyfml3UEPnNhoBXaRORluRYAzNvRbj7jOBkDf1RkbR/uXqLXLM32', 'SYAHLA ZHAFIRAH', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28739', '$2b$10$OlV/n9/kruCZ1xjhK5GdqOU84EKir07xkC4tchYMlsYAg2C6XeBmW', 'TABITHA CHYLA DANINDYA', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28740', '$2b$10$NgM/t4bo2yEDl3I/v.HsWu9yKVd7NxJt7h6QBBsJnhn3PMC5WUsz2', 'VINNI ADIFA TRISTI', 'X 14', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28741', '$2b$10$RiRBSaTxFzj0INoSY30kfOmyZdgoUtX.gsXCKYl9AkZdCOwDBUcEK', 'AIRA NADA HISANAH', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28742', '$2b$10$WD6I3neBMXpHlAM3DaW9n.Dei6HoLzTKvOlQLA3Wk/xwEk.83k7VG', 'ALIF TAUFANI', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28743', '$2b$10$iFLsFAPqawU4tFwAiUeMEuTlbVX5/IvJ0ojh8qGHGwEXwFntOcx9e', 'ALMAIRA ARKANURIA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28744', '$2b$10$9zFIQpjxxKyZ0pLplmgO9uCbPk0qaZa7XEGGY4FdslIkGoU7bathm', 'AMANDA KIRANIA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28745', '$2b$10$93LfCjMDibgvOjn3yTaK0eBs7uz9QMa9fRCMJV2GiJwwSSW4xfohC', 'ANDIKA DWI PUTRA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28746', '$2b$10$fGykAOkIopVlsBjXGJnEw.5Qp3cuiZJK1lKcFUrmJagph.KIpg6l6', 'ATHIFA AZMI ALAMSYAH', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28747', '$2b$10$w4U84sa2ysZR3kvmwUZXXu5x3Uciwfzkwxzuikdm7aULj1nq0.ffK', 'CALLYSTA NURIA TRIMOYO', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28748', '$2b$10$B0yfcdHeC/jIbRR.TcXVgOM7lnWtOqUTgxnwR0e/5L0sp0/BHeuZa', 'CHAIRUL ASHAR IDRUS', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28749', '$2b$10$ubYv9zya9O.OqWZhvoPBCe7YCUd/cMqj.LD0.Nr.Law3MF5YHG.ne', 'DESYA NATASYA NURROHIM', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28750', '$2b$10$nhwOEtGE9YEom.pobaNQtuCL/cq5NK0k6D1LLPtGcCab6ERIkD5Ny', 'DIWA HARMAINI QURBI', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28751', '$2b$10$AUyXaV8KqwQrdGQQxL/bl.caGynuXihTlkitWXQL.15TMfsUwfZua', 'FARHAN ATAHYA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28752', '$2b$10$sAXl8AQO.qwwsnXDETZZnOZXyWLhVwxCynmYscvGNAlcjf6ocec1C', 'FAYZA FEIYAZ FIRMANSYAH', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28753', '$2b$10$REIBjLyACKz54wSjMKlIsOxSAc7hFUr2h/cFAKpcRblPv4PNjjrmm', 'HAFIFAH NUR AISYAH', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28754', '$2b$10$GCAu0Zzk6IZV1jtlRCmKTec8GRT6QJZenJZ76tfDX.hJF6hVKfhqi', 'HARLI RUSTIKA ATMAJA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28755', '$2b$10$VN6.URp04ZLikr22dwQ9aOb2Bu7EuGJipEqntvF.i8qpCJH3uAsO6', 'IBNATY RANIA MUYASSARAH SALAM', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28756', '$2b$10$00SLTI62PvUqeSJWRh1snu5IlXpxr646L14XLJt/uoQj0vY3hp0HC', 'KEYSHA BATRISYIA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28757', '$2b$10$dUALLGUSxdoi4lh.U7ZzROElOJNawHdszmYazNXCRdMg54p9PQoc2', 'LOUISA MARWAH KHAIRIN', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28758', '$2b$10$MAdRN9hO9l8dvquN14bAk.9KIpvsO09LWf7t0bKtXF9faIj9dzVR.', 'MOCHAMMAD ALGHIZANI ANWAR GHIBRAN', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28759', '$2b$10$ObpnXXTUFJErWqg7j9n/0ugb0F2XahrTdSmkQgdYKxryycDOGUZGS', 'MOURA VICARDI MONARY', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28760', '$2b$10$IdjqlHeF1Tv5P0o5rihVtOJOD8mgD/TBVInmLjroK1.yTJ1ctcHB2', 'MUHAMMAD ATHAA ASSYAKIR', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28761', '$2b$10$6WRb8bpiyRgH0.zHciWeS.bCFXueTqdD.zaQHcxkG.eUDFOF894B.', 'MUHAMMAD FADLAN ALFARIZI', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28762', '$2b$10$.xiN1mUn0eFneqU9H2bPme5XQOY4g8W1Ccrb3sFP9d17r0plIESby', 'MUHAMMAD HAUZAN IRHAB PUTRA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28763', '$2b$10$7P0nT/PC2Yk9ItgGpAing.ejhwFGN/PPYw8sD74FdgGVa8ZkEzXpe', 'MUHAMMAD SIDQI HERMAWAN', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28764', '$2b$10$rASJ7hPEzvb5oUqGS/Fyw.IOXXJFb3/MwlqGl26HPBm79X4buyHqa', 'NADYA FARHANA SANI', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28765', '$2b$10$7IEFpwCTs0WgKWqzl1UUouZLB3lgrmVUq2WtwQLwokpzZ9RaoNN/6', 'NAFI MALIKUL NUGRAHA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28766', '$2b$10$EfCsErLW0nlaqz.VNdGPFeYIlGnUQ2qdUGzN/33rcWz0G0sokVsZ2', 'NUR ATHIQOH MAULIDIYA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28767', '$2b$10$bIwggqvW2Gz/55ulHJxkwOEzqLDJpFnotPNcTqLLk2f1Tckx6Af3y', 'QUINSHA HARUMI DYNASTIA ARIUS', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28768', '$2b$10$Be6BThjiLNOELAAsitQY1O0YMjjucFXvPKNpvQDGYk.GiPxXV0kqy', 'RAFA ARDIAN PANJI', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28769', '$2b$10$GGFCitzAmikvyJPVXkCs8OMREPUfIeyWHRU6a0BnZjV8kdOv6mjCu', 'RAIHAN HUSAINI ABDILLAH', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28770', '$2b$10$ZVgZgVyhDo7ZAnkDGR9zReClgXnGeiS88S6hl5rg134RWpmr5KMtG', 'RAISYA AULIA KHANZA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28771', '$2b$10$glAfBCIeQpwNFajCr6NQUO6.eqwd67oNl6QzlMU6ukUrPQtb1Wi.6', 'RAYANA PUTRI HADIYANTO', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28772', '$2b$10$jsJKSEoEfsHnkgKBdeLLM.Cx5nYPpMcGmGr.qs5m1MWrMFcre1o4S', 'RHADIETYA ACHMAD ELPANTRIS', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28773', '$2b$10$JtHGJLsFN6ASNKjGd2RLtO0N.i7oOrhpV/dn5Kfm0x8cfQe2HvSki', 'SABRINA AINUNNISA ISNANTA SALEH', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28774', '$2b$10$IIWbEUNb/6Kwn9JCC8zuz.NX0JEKdhF2P7e9Vn/ldEjktbEMu9v32', 'SORAYA AZZAHRA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28775', '$2b$10$7Ocy6Ac/64NRewSgxUO7y./2QCrVXYZ.QjsNhgVWIgToLX5W0.eai', 'SYAIDINA KEZIA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28776', '$2b$10$QrHrsJHUZdWKXeXnZJCl8.5y4bkU1kSHFqxJVHOTO42RsIqdR1yJ2', 'TAZKIRA ROHADATUL A''ISY', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28777', '$2b$10$O49ghQyr93U58BofYPzPj.1t2fr.be/KlyFutj1HfAG2i76YgHLW.', 'WIDYANA  NUR''AINI', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28778', '$2b$10$IqXIaVmK2NY3ugUNzCEwneK0mt0BurjrrSd.5WXLlsPRSqyYNolOe', 'ZAHRA KHOERUNISA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28779', '$2b$10$ZWQ9jc.pvfYeG2K7tWfKkuQAEXF55Jb3eJNfM.XErm6r7rHTCzQBi', 'MOCHAMMAD RAFFI SYAHREZA', 'X 15', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28780', '$2b$10$UZdb4fw3eFrmrInAMJG/H.ti4nDN3W9N0o4bj5gU.V1gsJ1JpkDTm', 'AISYI KHALIFATU NIHA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28781', '$2b$10$Y6wRNyLMbdcfA3Aubo902e0p0NRNVHA9sGur/q.ISP4oU4kgUeBNO', 'ALMIRA SOPHIA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28782', '$2b$10$V2xdF/FWriL6d7HPQIcHIO8vPAc/fOQ9XxbI/fXBTY0YnPGhu3.eW', 'AMMAR DANISH', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28783', '$2b$10$pJXJtuzTD0558pKRhnXO6uprhVKbIhXwEzaRPJAQeHBAH.lP/3TNa', 'ARDELL RAISSA MUZAKI', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28784', '$2b$10$.sn0gZ25//TR0vfNR62giubxIGaXSJMrYScx/r.OSM6VCpGXcVkD6', 'ASYIFA AMALIA PUTRI', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28785', '$2b$10$GJNR6p9xi7LTmhw.X5AgjOi3ABFoxurloYtYNTpJabzAgx.P1zU4W', 'ATHIRAH FITRIANINA AMALINA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28786', '$2b$10$3RIoFsW2knXiFiJpzAGOsulEEsEC5zIoIsLWWEeWhQ4dMQBmNZ08S', 'CUT SAARAH QATRUNNADA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28787', '$2b$10$waxGEUEJ9oogP6f9LMGQ0Od6e5tVOhuPD2m8.yMyuw2aHCZKJHAQG', 'DAFFA ZAHRAN', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28788', '$2b$10$ToQhjaW/SMLgCBAGjw8u8u9sLsq0a9KjYZtkneQi261WGfl5C.sKS', 'DIANI RAHAYU', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28789', '$2b$10$XZRtGxwRQL5vgOhCmZK7ZeQF6xpj.ZJUUWQTmTmmv1hgINylNpXca', 'EIYN ISMAIL PRIANSEN', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28790', '$2b$10$HbcTKEf91VS1Mio.EZVjGudTqCriMZnzdFIwsLViLuxC2D28dYFhS', 'FATHAN NABIHAN RAUF', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28791', '$2b$10$e4Alh0PrX/NHwSaqqnCb9.Iqd76lcojRWgzSEC7c5z2SzrmWjbEBC', 'FITHRIANA SILVA ASHFAHANY', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28792', '$2b$10$ZUMegLQBgUPLqHBR0FnKhubXpKH9iDP72MbOyZRxPkaMPl4lB/U92', 'HANA MALIKA TSURAYYA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28793', '$2b$10$XYc/lryzoWZW6.ff6HJR1u9BcSENULe4zpkB7db.LDp1ka.D4jh0y', 'INAYATUSSA''ADAH', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28794', '$2b$10$AuFdf.FrHQ0V7C7CeahpvubYPUJcaX1yVLqCQh6JjWsvCBFLiZqUe', 'KALEO AZKA PUTRARIAN', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28795', '$2b$10$/2jZXXNvGOFYN/0yvTzy3OTUABr/CDmxbZ0bnmVYTJh9l0scRRQ5a', 'KHANSAA KHUMAIRAH', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28796', '$2b$10$e2a2RPhqS1v4wZ3NsLb1VuzD6GY2LiL.SDnxy2pJgQaB041E6nEb6', 'MAESAN SALSABILA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28797', '$2b$10$sbnUXmG4Y56v2Q.zMmj8quxhAKHxQfjIVeCxheTZkKXZtZGzTncZq', 'MU''AWIYAH', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28798', '$2b$10$0B6uz4N4bXnF//QKG.7KEuM3iwnkaWNINIwp.UyJjTlwaE0lA.Azi', 'MUHAMMAD DAFFA HAIDAR', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28799', '$2b$10$3CYhevObeBVtVONIW.dz7.d7FYnnNR4gPligeY7Q0/DXVgmm.IMT6', 'MUHAMMAD FAHMI SHIDDIQ', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28800', '$2b$10$gyfx5beoOtoAyNfGRaP3h.7U1bhcHJG5KXuwieJqoPfeiKCx/Rt4C', 'MUHAMMAD RIDHO YUSUF', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28801', '$2b$10$A8mR0j/xFuzXzhjkTCnnV.Q6vL1agXB4Z6apbFVZhDjZQJ.vvkgy2', 'MUHAMMAD SULTAN ASHAR', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28802', '$2b$10$t1ZGcq9QiORdFAF8iTpc8O3ZVI34hiRAiRBox1a/qmGvkaJ38WIz.', 'MUTHI''AH NUR HASNA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28803', '$2b$10$fTH0ykAdgZ8nhKPxW.gq1eRwE727VZeRr1lNzpgW25j.x1i.TpTDe', 'NAILA ZIA RISDIYAN', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28804', '$2b$10$akQxOdlqpLq/5sOoo6utbuDy6JDnyEI8fYGoZ3078IXPeV6k3L0zO', 'NURIDA FITRIYANI', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28805', '$2b$10$wXVS.G7fR3JiSG16jEd57uwqSqpzbS1K/NA1qYgiVSsoJgmQQ1mSi', 'PRADITYA ALIFFADHILAH ABADI', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28806', '$2b$10$cR0/FVN.oS5o8GfpYUDFPOrXFFiy8uRWLAo3HNKRYsuDMQKuuamMK', 'RACHEL KIRANA PUTRI KOSIM', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28807', '$2b$10$GqmhYr5qj0YUjzp4k7hSnOPEMIOSJNUF1lHYuN5suR047MECYd59q', 'RAFAN ARDHA ISLAHULHAQ', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28808', '$2b$10$tyn.58nqTueITiHE7Hgw..oLWJMEzKPBbTnvcp5hh87oVMbWfjuTC', 'RAISYA NADIA KHAIRUNNISA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28809', '$2b$10$4AmzkHuaF8Q6epMvkUi8j.8X9ShvIH7hm4LRzkFCYVSQjC3m0tLJG', 'RASYA ANDIKA TRI ANUGRAH', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28810', '$2b$10$xkqRU8zBHID6BvXezPMQ.uVDEE5o7BbT9GjuuMaIbsYUFDKPs/uGK', 'RIZKA ANGGELIA SUSANTI', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28811', '$2b$10$fUEIBFQFRXhEhyy3O03/4uhEakP.AXs33YZuNhRzIEdX1JX6wegaC', 'SAFIRA FARRAS MAHYA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28812', '$2b$10$vpTA/uteJQOINfaa9H0VwugLbFGe5NSjxhZJcsEfjhA1QkxZ2tBHC', 'SAKHY ALDINO FATHINURRAHMAN', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28813', '$2b$10$r.4Z6bteAf2/TJl4glWP8ub8Ho.Tzf3247/lRimNT7blR2Wnv1.BW', 'SORAYA FITRIADI', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28814', '$2b$10$yvbsq0xplgyYmix3PBBkaOJ3o8aQJLT02xQFHiqRa/i1iR7ByJ9wC', 'SYAUQI BINTAN MUSLIHAH', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28815', '$2b$10$qtTrBiCPz39Yq61OlB7VXuLEcyI2S4fwjeVo2CtZIFpXrBoV60NKq', 'TENGKU UFAIRA NADHIFA SYAMILLA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28816', '$2b$10$82Q4khcG8fiTALFN3Z9bOeaTirSSF0YSPxGIJ7QHzD4lCVn8I3vQW', 'ZAHIYAH NUR SAJIDA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
insert into siswa (username, password, nama, kelas, sekolah)
values ('28817', '$2b$10$JyhLj1KzRsI51ancEGMVDe7Vm6Uo/jox/vda02bk.G/qmNEI/juve', 'ZALFA ALTHAFUNNISA', 'X 16', 'MAN 1 Bogor')
on conflict (username) do nothing;
