export default function Home() {
  return (
    <main className="page-wrap">
      <div className="shell" style={{ maxWidth: 560 }}>
        <div className="card" style={{ textAlign: 'center', paddingTop: 40, paddingBottom: 40 }}>
          <div
            style={{
              width: 64, height: 64, borderRadius: 18, background: 'var(--navy)',
              display: 'flex', alignItems: 'center', justifyContent: 'center',
              fontSize: 30, margin: '0 auto 16px',
            }}
          >
            🧠
          </div>
          <h1 style={{ fontFamily: 'var(--ff-h)', fontSize: 24, marginBottom: 6 }}>
            Simulasi Tes IST
          </h1>
          <p style={{ color: 'var(--t2)', fontSize: 14, lineHeight: 1.6, maxWidth: 380, margin: '0 auto' }}>
            Tes diagnostik kemampuan (IST), minat (RIASEC), gaya belajar, dan bakat diferensial.
            Jawaban tersimpan otomatis per soal — progres tidak akan hilang meski koneksi terputus.
          </p>

          <div style={{ display: 'flex', gap: 10, marginTop: 26, flexWrap: 'wrap', justifyContent: 'center' }}>
            <a href="/tes" style={{ textDecoration: 'none', flex: '1 1 200px' }}>
              <button className="btn btn-primary">🚀 Mulai Tes</button>
            </a>
            <a href="/admin" style={{ textDecoration: 'none', flex: '1 1 200px' }}>
              <button className="btn btn-outline">📊 Panel Panitia</button>
            </a>
          </div>
        </div>

        <p className="hint" style={{ marginTop: 18 }}>
          Halaman lama masih tersedia di <strong>/legacy</strong> bila dibutuhkan.
        </p>
      </div>
    </main>
  );
}
