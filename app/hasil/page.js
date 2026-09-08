export const metadata = { title: 'Hasil Tes Diagnostik' };

// Portal hasil (login sekolah + cek hasil peserta + rekap admin) dibangun sebagai
// dokumen HTML mandiri di public/hasil-diagnostik.html — fonts, chart (SVG/CSS
// murni, tanpa Chart.js), dan library Excel (SheetJS) semuanya sudah di-inline di
// file itu supaya tidak bergantung koneksi ke CDN eksternal (lihat catatan di
// README bagian "Hasil Tes Diagnostik (/hasil)"). Di-iframe di sini apa adanya
// supaya CSS/JS-nya tidak bentrok dengan globals.css & halaman lain di app ini.
export default function HasilPage() {
  return (
    <iframe
      src="/hasil-diagnostik.html"
      title="Portal Hasil Tes Diagnostik"
      style={{
        width: '100%',
        height: '100dvh',
        border: 'none',
        display: 'block',
      }}
    />
  );
}
