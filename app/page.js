export default function Home() {
  return (
    <main style={{ fontFamily: 'sans-serif', padding: 40 }}>
      <h1>Simulasi Tes IST — Backend Neon</h1>
      <p>
        Ini backend API (attempt/start, attempt/answer, attempt/heartbeat,
        attempt/finish). Halaman tes untuk siswa (index.html), dashboard
        panitia, dan live monitor masih perlu dipindahkan/disambungkan ke
        endpoint-endpoint ini — lihat <code>client-patch/PATCH-index-html.md</code>
        di paket migrasi.
      </p>
    </main>
  );
}
