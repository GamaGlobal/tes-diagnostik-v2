'use client';
import { useState, useEffect, useRef, useCallback } from 'react';
import { RIASEC_LABELS, GAYA_LABELS, BAKAT_LABELS } from '../../lib/labels';
import { AMBANG_PELANGGARAN } from '../../lib/anti-curang';

const API = '/api/attempt';
// SESSION_KEY sekarang HANYA menyimpan "penunjuk" (sesiId, jenjang, tabToken)
// -- bukan progres (jawaban/bagian ke berapa/sisa waktu) seperti versi
// sebelumnya. Progres asli selalu diambil ulang dari server tiap refresh
// (lewat /api/attempt/resume) supaya tidak bisa diubah manual lewat DevTools
// -> Application -> Session Storage untuk curang (mis. loncat ke bagian
// terakhir, atau menambah sisa waktu).
const SESSION_KEY = 'tes_ist_session_v1';

function buatTabToken() {
  try { return crypto.randomUUID(); } catch { return `tab_${Date.now()}_${Math.random().toString(36).slice(2)}`; }
}

// ---------- Render soal figural (parse JSON string -> gambar SVG) ----------
function polygonPoints(sides, cx, cy, r, rotDeg) {
  const pts = [];
  const rot = (rotDeg || 0) * Math.PI / 180;
  for (let i = 0; i < sides; i++) {
    const a = rot + (i * 2 * Math.PI / sides) - Math.PI / 2;
    pts.push(`${cx + r * Math.cos(a)},${cy + r * Math.sin(a)}`);
  }
  return pts.join(' ');
}
function ShapeIcon({ raw, size = 72 }) {
  let shape;
  try { shape = JSON.parse(raw); } catch { return <div style={box(size)}>?</div>; }
  const { sides, color, rot } = shape;
  return (
    <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`}>
      <polygon points={polygonPoints(sides, size / 2, size / 2, size * 0.38, rot)} fill={color} />
    </svg>
  );
}
const box = (s) => ({
  width: s, height: s, display: 'flex', alignItems: 'center', justifyContent: 'center',
  border: '1.5px solid var(--bd)', borderRadius: 10,
});

// ---------- Render jaring-jaring kubus ----------
function CubeNet({ meta }) {
  const { net, target, layout } = meta;
  const cell = (pos) => (
    <div style={{ ...cellStyle, ...(pos === target ? { border: '2.5px solid var(--blue)', background: 'var(--sky)' } : {}) }}>
      {net[pos]}
    </div>
  );
  return (
    <div style={{ display: 'inline-block' }}>
      <div style={{ display: 'flex', justifyContent: 'center' }}>{cell(layout.top)}</div>
      <div style={{ display: 'flex' }}>
        {cell(layout.col1)}{cell(layout.col2)}{cell(layout.col3)}{cell(layout.col4)}
      </div>
      <div style={{ display: 'flex', justifyContent: 'center' }}>{cell(layout.bottom)}</div>
    </div>
  );
}
const cellStyle = {
  width: 52, height: 52, display: 'flex', alignItems: 'center', justifyContent: 'center',
  border: '1.5px solid var(--bd)', borderRadius: 8, fontSize: 20, margin: 2, background: '#fff',
};

function fmtWaktu(detik) {
  const m = Math.floor(detik / 60), s = detik % 60;
  return `${m}:${String(s).padStart(2, '0')}`;
}

const SECTION_ICON = {
  pilihan_tunggal: '📝', figural: '🔷', seri_angka: '🔢', kubus: '🎲',
  memori: '🧠', likert: '📋',
};

function PelanggaranBanner({ banner }) {
  if (!banner) return null;
  return (
    <div className={`alert ${banner.tone === 'warn' ? 'alert-error' : 'alert-info'}`} style={{ marginBottom: 14 }}>
      <span>{banner.text}</span>
    </div>
  );
}

function BarRow({ label, value, max = 100, suffix = '%' }) {
  const pct = Math.max(0, Math.min(100, max ? (value / max) * 100 : 0));
  return (
    <div className="bar-row">
      <div className="bar-label">{label}</div>
      <div className="bar-track"><div className="bar-fill" style={{ width: `${pct}%` }} /></div>
      <div className="bar-val">{value}{suffix}</div>
    </div>
  );
}

export default function TesPage() {
  const [tahap, setTahap] = useState('login'); // login | intro | mengerjakan | memorize | pindah | selesai
  const [form, setForm] = useState({ username: '', password: '', jenjang: 'smp' });
  const [loginError, setLoginError] = useState('');
  const [loginLoading, setLoginLoading] = useState(false);
  const [sesi, setSesi] = useState(null); // {sesiId, nama, kelas, sekolah}
  const [sections, setSections] = useState([]);
  const [sectionIdx, setSectionIdx] = useState(0);
  const [jawabanTerpilih, setJawabanTerpilih] = useState({}); // {kodeSoal: teks}
  const [sisaWaktu, setSisaWaktu] = useState(0);
  const [hasilAkhir, setHasilAkhir] = useState(null);
  const [showPw, setShowPw] = useState(false);
  const [checkingSession, setCheckingSession] = useState(true);
  const [banner, setBanner] = useState(null); // {tone:'warn'|'info', text} — notifikasi pelanggaran/sesi ganda
  const sesiIdRef = useRef(null);
  const tabTokenRef = useRef(null);

  const section = sections[sectionIdx];

  // ---------- terapkan hasil login/resume ke state layar ----------
  // Dipakai baik oleh login pakai password (handleLogin) MAUPUN pemulihan
  // sesi saat refresh (lihat useEffect di bawah), supaya keduanya konsisten:
  // kalau siswa sedang di TENGAH fase berwaktu (menghafal / mengerjakan),
  // langsung diarahkan ke LAYAR YANG SAMA dengan sisa waktu yang benar —
  // bukan mundur ke welcome/intro yang berarti buang-buang sisa waktu bagian
  // itu secara percuma (deadline-nya sudah absolut di server, jalan terus
  // walau siswa sedang di layar lain).
  const terapkanStatus = useCallback((jenjang, tahapKe, tahapFase, sisaDetik, jawabanTersimpan, sections) => {
    const jawabanAwal = {};
    (jawabanTersimpan || []).forEach(j => { jawabanAwal[j.kode_soal] = j.jawaban_teks; });
    setJawabanTerpilih(jawabanAwal);
    setForm(f => ({ ...f, jenjang }));

    const idxAman = Math.min(tahapKe || 0, sections.length - 1);
    setSectionIdx(idxAman);

    if ((tahapFase === 'mengerjakan' || tahapFase === 'memorize') && sisaDetik != null && sisaDetik > 0) {
      setSisaWaktu(sisaDetik);
      setTahap(tahapFase);
    } else if (tahapFase === 'mengerjakan' || tahapFase === 'memorize') {
      // waktu bagian ini sudah habis selagi siswa tidak ada (mis. baru buka
      // lagi browsernya 10 menit kemudian) -> jangan macet di 0 detik,
      // langsung lanjut seperti waktu habis normal
      setSisaWaktu(0);
      setTahap(tahapFase);
    } else {
      setTahap('welcome');
    }
  }, []);

  // ---------- pulihkan sesi dari server kalau halaman di-refresh ----------
  // sessionStorage cuma dipakai sebagai "penunjuk" (sesiId) supaya tidak
  // perlu login pakai password lagi -- progres yang SEBENARNYA (jawaban,
  // bagian ke berapa, sisa waktu) selalu diambil ULANG dari
  // /api/attempt/resume, bukan dipercaya dari sessionStorage itu sendiri
  // (yang bisa saja diubah manual lewat DevTools untuk curang).
  useEffect(() => {
    (async () => {
      try {
        const raw = sessionStorage.getItem(SESSION_KEY);
        const saved = raw ? JSON.parse(raw) : null;
        if (saved?.sesiId) {
          tabTokenRef.current = saved.tabToken || buatTabToken();
          const res = await fetch(`${API}/resume?sesiId=${saved.sesiId}`);
          const data = await res.json();
          if (data.found) {
            sesiIdRef.current = saved.sesiId;
            if (data.locked) {
              // sesi dikunci karena pelanggaran -> tetap di layar terkunci,
              // jangan buka soalnya lagi walau di-refresh berkali-kali
              setSesi({ nama: data.nama });
              setTahap('terkunci');
            } else if (data.selesai) {
              setSesi({ nama: data.nama });
              setHasilAkhir(data.hasil);
              setTahap('selesai');
            } else {
              setSesi({ nama: data.nama, kelas: data.kelas, sekolah: data.sekolah });
              const soalRes = await fetch(`${API}/soal?jenjang=${data.jenjang}`);
              const soalData = await soalRes.json();
              setSections(soalData.sections);
              terapkanStatus(data.jenjang, data.tahapKe, data.tahapFase, data.sisaDetik, data.jawabanTersimpan, soalData.sections);
            }
          } else {
            try { sessionStorage.removeItem(SESSION_KEY); } catch {}
          }
        }
      } catch {
        // sessionStorage tidak tersedia / gagal fetch -> abaikan, tetap di layar login
      }
      setCheckingSession(false);
    })();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ---------- simpan PENUNJUK sesi (bukan progresnya) ke sessionStorage ----------
  useEffect(() => {
    if (!sesiIdRef.current || checkingSession) return;
    try {
      sessionStorage.setItem(SESSION_KEY, JSON.stringify({
        sesiId: sesiIdRef.current, tabToken: tabTokenRef.current,
      }));
    } catch {
      // penuh / diblokir browser -> abaikan, autosave per-jawaban di server tetap jalan
    }
  }, [sesi, checkingSession]);

  function gantiAkun() {
    try { sessionStorage.removeItem(SESSION_KEY); } catch {}
    sesiIdRef.current = null;
    tabTokenRef.current = null;
    setSesi(null);
    setSections([]);
    setSectionIdx(0);
    setJawabanTerpilih({});
    setHasilAkhir(null);
    setBanner(null);
    setForm({ username: '', password: '', jenjang: 'smp' });
    setTahap('login');
  }

  // ---------- login ----------
  async function handleLogin(e) {
    e.preventDefault();
    setLoginError('');
    setLoginLoading(true);
    try {
      const res = await fetch(`${API}/start`, {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...form, totalTahap: 12 }),
      });
      const data = await res.json();
      if (!res.ok) { setLoginError(data.error || 'Gagal login'); return; }
      sesiIdRef.current = data.sesiId;
      tabTokenRef.current = buatTabToken();

      if (data.locked) {
        // sesi milik akun ini sudah dikunci karena pelanggaran berulang ->
        // langsung tampilkan layar terkunci, jangan buka soal sama sekali
        // (mencegah bypass kunci dengan logout lalu login lagi)
        setSesi({ nama: data.nama });
        setTahap('terkunci');
        return;
      }

      setSesi(data);
      const soalRes = await fetch(`${API}/soal?jenjang=${form.jenjang}`);
      const soalData = await soalRes.json();
      setSections(soalData.sections);

      terapkanStatus(form.jenjang, data.tahapKe, data.tahapFase, data.sisaDetik, data.jawabanTersimpan, soalData.sections);
    } catch {
      setLoginError('Gagal terhubung ke server. Coba lagi.');
    } finally {
      setLoginLoading(false);
    }
  }

  // ---------- heartbeat ----------
  // Selain jadi denyut "masih aktif" untuk Live Monitor, ini juga dipakai
  // untuk RESYNC sisa waktu ke server tiap 20 detik (jaga-jaga kalau timer
  // di klien ngaret / jam sistem device siswa diutak-atik) dan mendeteksi
  // apakah sesi yang sama sedang aktif di tab/perangkat lain.
  useEffect(() => {
    if (tahap === 'login' || tahap === 'selesai' || tahap === 'welcome') return;
    const iv = setInterval(async () => {
      try {
        const res = await fetch(`${API}/heartbeat`, {
          method: 'POST', headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ sesiId: sesiIdRef.current, tahapKe: sectionIdx, tabToken: tabTokenRef.current }),
        });
        const data = await res.json();
        if (data.locked) {
          // dikunci oleh TAB LAIN (mis. pelanggaran tercatat lewat tab lain
          // dari sesi yang sama) -> tab ini pun harus ikut berhenti seketika
          setTahap('terkunci');
          return;
        }
        if (data.status && data.status !== 'mengerjakan') {
          // sesi sudah diakhiri lewat jalur lain (mis. "Paksa Selesaikan" oleh
          // panitia) selagi tab ini masih terbuka -> tarik hasilnya sekalian
          try {
            const r = await fetch(`${API}/resume?sesiId=${sesiIdRef.current}`);
            const rd = await r.json();
            if (rd.selesai) { setHasilAkhir(rd.hasil); setTahap('selesai'); return; }
          } catch {}
        }
        if (data.activeElsewhere) {
          setBanner({ tone: 'warn', text: '⚠️ Sesi ini terdeteksi juga sedang aktif di tab/perangkat lain.' });
        }
        if ((tahap === 'mengerjakan' || tahap === 'memorize') && typeof data.sisaDetik === 'number') {
          // hanya koreksi kalau meleset cukup jauh (>2 detik), supaya
          // tampilan tidak "kedutan" karena selisih pembulatan biasa
          setSisaWaktu(s => Math.abs(s - data.sisaDetik) > 2 ? data.sisaDetik : s);
        }
      } catch {
        // gagal terkirim -> aman diabaikan, jawaban tetap tersimpan per-soal
        // dan sisa waktu tetap dihitung ulang dari server saat resume
      }
    }, 20000);
    return () => clearInterval(iv);
  }, [tahap, sectionIdx]);

  // ---------- anti-curang: catat kejadian LANGSUNG saat terjadi ----------
  // Tiap kejadian dikirim seketika ke /api/attempt/pelanggaran (bukan
  // ditumpuk dulu di klien) supaya tidak hilang kalau tabnya keburu ditutup,
  // dan supaya panitia bisa lihat waktu + jenis tiap kejadian, bukan cuma
  // satu angka total.
  //
  // AMBANG_PELANGGARAN (3) pelanggaran pertama = PERINGATAN saja, dengan
  // hitungan yang ditampilkan ke siswa ("Peringatan 2 dari 3"). Begitu server
  // bilang locked:true (pelanggaran ke-4), sesi langsung dikunci di layar ini
  // juga — tidak perlu menunggu heartbeat berikutnya.
  const laporPelanggaran = useCallback(async (jenis) => {
    if (!sesiIdRef.current) return;
    try {
      const res = await fetch(`${API}/pelanggaran`, {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sesiId: sesiIdRef.current, jenis }),
      });
      const data = await res.json();
      if (data.locked) {
        setTahap('terkunci');
        return;
      }
      const ambang = data.ambang ?? AMBANG_PELANGGARAN;
      if (typeof data.cheatCount === 'number') {
        setBanner({
          tone: 'warn',
          text: `⚠️ Peringatan ${data.cheatCount} dari ${ambang}: aktivitas tidak wajar terdeteksi & tercatat. Tes akan dikunci otomatis setelah ${ambang} peringatan.`,
        });
      }
    } catch {
      // gagal terkirim ke server -> tetap kasih tahu di layar supaya siswa
      // tidak mengulang tindakan yang sama karena mengira tidak terpantau
      setBanner({ tone: 'warn', text: '⚠️ Aktivitas tidak wajar terdeteksi (gagal lapor ke server, coba periksa koneksi).' });
    }
  }, []);

  useEffect(() => {
    const sedangTes = tahap === 'mengerjakan' || tahap === 'memorize';
    function onVis() { if (document.hidden && sedangTes) laporPelanggaran('tab_switch'); }
    function onBlur() { if (sedangTes) laporPelanggaran('blur_jendela'); }
    // copy/paste/klik-kanan langsung DIBLOK (bukan cuma dicatat) selama
    // mengerjakan/menghafal — mengurangi godaan menyalin soal atau menempel
    // jawaban dari sumber lain, sekaligus tetap tercatat sebagai pelanggaran
    function onCopy(e) { if (sedangTes) { e.preventDefault(); laporPelanggaran('copy'); } }
    function onPaste(e) { if (sedangTes) { e.preventDefault(); laporPelanggaran('paste'); } }
    function onContext(e) { if (sedangTes) { e.preventDefault(); laporPelanggaran('klik_kanan'); } }
    document.addEventListener('visibilitychange', onVis);
    window.addEventListener('blur', onBlur);
    document.addEventListener('copy', onCopy);
    document.addEventListener('paste', onPaste);
    document.addEventListener('contextmenu', onContext);
    return () => {
      document.removeEventListener('visibilitychange', onVis);
      window.removeEventListener('blur', onBlur);
      document.removeEventListener('copy', onCopy);
      document.removeEventListener('paste', onPaste);
      document.removeEventListener('contextmenu', onContext);
    };
  }, [tahap, laporPelanggaran]);

  // ---------- banner notifikasi otomatis hilang ----------
  useEffect(() => {
    if (!banner) return;
    const t = setTimeout(() => setBanner(null), 6000);
    return () => clearTimeout(t);
  }, [banner]);

  // ---------- timer per bagian ----------
  // sisaWaktu di sini cuma untuk TAMPILAN yang mulus tiap detik — sumber
  // kebenarannya tetap tahap_deadline_at di server (diminta ulang saat
  // resume, dan dikoreksi tiap heartbeat, lihat efek heartbeat di atas).
  useEffect(() => {
    if (tahap !== 'mengerjakan' && tahap !== 'memorize') return;
    if (sisaWaktu <= 0) {
      // Bug lama: waktu menghafal habis -> lanjutBagian() melompati fase
      // soal bagian ini sama sekali. Sekarang: waktu menghafal habis ->
      // lanjut ke fase MENGERJAKAN SOAL bagian yang sama (bukan loncat
      // bagian), sama seperti kalau siswa klik "Sudah Hafal" sendiri.
      if (tahap === 'memorize') mulaiFaseBerwaktu('mengerjakan'); else lanjutBagian();
      return;
    }
    const t = setTimeout(() => setSisaWaktu(s => s - 1), 1000);
    return () => clearTimeout(t);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sisaWaktu, tahap]);

  // ---------- mulai fase berwaktu (menghafal ATAU mengerjakan soal) ----------
  // Deadline-nya diminta & dicatat di SERVER (bukan cuma setSisaWaktu di
  // klien) supaya kalau nanti halaman ini di-refresh, sisa waktunya dihitung
  // ulang dari deadline itu -- bukan dapat waktu penuh baru.
  const mulaiFaseBerwaktu = useCallback(async (fase) => {
    const durasiFallback = fase === 'memorize' ? section.memorizeDurasi : section.durasi;
    setSisaWaktu(durasiFallback); // tampilan langsung jalan sambil menunggu respons server
    setTahap(fase);
    try {
      const res = await fetch(`${API}/mulai-bagian`, {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sesiId: sesiIdRef.current, tahapKe: sectionIdx, fase }),
      });
      if (res.status === 423) { setTahap('terkunci'); return; } // sesi keburu dikunci/selesai
      const data = await res.json();
      if (typeof data.sisaDetik === 'number') setSisaWaktu(data.sisaDetik);
    } catch {
      // gagal terkirim -> tetap pakai durasi default di atas; heartbeat
      // berikutnya akan mencoba resync begitu koneksi kembali
    }
  }, [section, sectionIdx]);

  function mulaiBagian() {
    mulaiFaseBerwaktu(section.tipe === 'memori' ? 'memorize' : 'mengerjakan');
  }

  function pilihJawaban(kodeSoal, teks) {
    setJawabanTerpilih(prev => ({ ...prev, [kodeSoal]: teks }));
    const kirim = () => fetch(`${API}/answer`, {
      method: 'POST', headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sesiId: sesiIdRef.current, kodeSoal, jawabanTeks: teks }),
    }).then(res => { if (res.status === 423) setTahap('terkunci'); return res; });

    kirim().catch(() => {
      // gagal kirim -> coba lagi sekali setelah 3 detik (jaring pengaman sederhana)
      setTimeout(() => { kirim().catch(() => {}); }, 3000);
    });
  }

  const lanjutBagian = useCallback(async () => {
    if (sectionIdx >= sections.length - 1) {
      const res = await fetch(`${API}/finish`, {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sesiId: sesiIdRef.current }),
      });
      const data = await res.json();
      setHasilAkhir(data.hasil);
      setTahap('selesai');
    } else {
      setSectionIdx(i => i + 1);
      setTahap('intro');
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sectionIdx, sections.length]);

  // ================= RENDER =================
  if (checkingSession) {
    return <main className="page-wrap"><div className="shell" style={{ maxWidth: 400 }} /></main>;
  }

  if (tahap === 'login') {
    return (
      <main className="login-wrap">
        <div className="login-bg-circle" style={{ width: 300, height: 300, top: -100, right: -100, opacity: 0.5 }} />
        <div className="login-bg-circle" style={{ width: 200, height: 200, bottom: -60, left: -60, opacity: 0.3 }} />

        <div className="login-card screen">
          <div className="login-logo">
            <div className="login-logo-icon">🧠</div>
            <div className="login-logo-title">Simulasi Tes IST</div>
            <div className="login-logo-sub">Masuk untuk memulai tes diagnostik</div>
          </div>

          {loginError && (
            <div className="alert alert-error"><span>⚠️</span><span>{loginError}</span></div>
          )}

          <form onSubmit={handleLogin}>
            <div className="field">
              <label className="field-label">Username</label>
              <input
                className={`input ${loginError ? 'has-error' : ''}`}
                placeholder="Masukkan username"
                value={form.username}
                onChange={e => setForm(f => ({ ...f, username: e.target.value }))}
                autoComplete="username"
              />
            </div>

            <div className="field">
              <label className="field-label">Password</label>
              <div style={{ position: 'relative' }}>
                <input
                  className={`input ${loginError ? 'has-error' : ''}`}
                  type={showPw ? 'text' : 'password'}
                  placeholder="Masukkan password"
                  value={form.password}
                  onChange={e => setForm(f => ({ ...f, password: e.target.value }))}
                  autoComplete="current-password"
                  style={{ paddingRight: 40 }}
                />
                <button
                  type="button"
                  onClick={() => setShowPw(s => !s)}
                  tabIndex={-1}
                  style={{
                    position: 'absolute', right: 10, top: '50%', transform: 'translateY(-50%)',
                    background: 'none', border: 'none', cursor: 'pointer', fontSize: 15, color: 'var(--t2)',
                  }}
                >
                  {showPw ? '🙈' : '👁️'}
                </button>
              </div>
            </div>

            <div className="field">
              <label className="field-label">Jenjang</label>
              <select
                className="input"
                value={form.jenjang}
                onChange={e => setForm(f => ({ ...f, jenjang: e.target.value }))}
              >
                <option value="smp">SMP</option>
                <option value="sma">SMA</option>
              </select>
            </div>

            <button className="btn btn-primary" disabled={loginLoading} style={{ marginTop: 6 }}>
              {loginLoading ? '⏳ Memverifikasi...' : '🔐 Masuk'}
            </button>
          </form>

          <div className="divider" />
          <div className="hint">
            Gunakan username &amp; password yang diberikan panitia.<br />
            Jawaban tersimpan otomatis — aman bila koneksi terputus.
          </div>
        </div>
      </main>
    );
  }

  if (tahap === 'welcome') {
    const sudahMulai = sectionIdx > 0 || Object.keys(jawabanTerpilih).length > 0;
    return (
      <main className="page-wrap">
        <div className="shell" style={{ maxWidth: 460 }}>
          <div className="card screen" style={{ textAlign: 'center' }}>
            <div
              style={{
                width: 60, height: 60, borderRadius: '50%', background: 'var(--sky)',
                display: 'flex', alignItems: 'center', justifyContent: 'center',
                fontSize: 26, margin: '0 auto 14px',
              }}
            >
              🎓
            </div>
            <p style={{ fontSize: 13, color: 'var(--t2)' }}>Selamat datang,</p>
            <h1 style={{ fontFamily: 'var(--ff-h)', fontSize: 24, marginTop: 2 }}>{sesi?.nama}</h1>
            <div className="tag-row" style={{ justifyContent: 'center', marginTop: 10 }}>
              {sesi?.kelas && <span className="tag">🏷 {sesi.kelas}</span>}
              <span className="tag">🏫 {sesi?.sekolah}</span>
              <span className="tag">📚 {form.jenjang?.toUpperCase()}</span>
            </div>

            {sudahMulai && sections.length > 0 && (
              <div style={{ marginTop: 20, textAlign: 'left' }}>
                <div className="alert alert-info">
                  ↩️ Progres sebelumnya ditemukan — Anda akan melanjutkan dari <strong>Bagian {sectionIdx + 1} dari {sections.length}</strong>. Jawaban yang sudah dipilih tetap tersimpan.
                </div>
              </div>
            )}

            <button
              className="btn btn-primary"
              style={{ marginTop: 18 }}
              onClick={() => setTahap('intro')}
            >
              {sudahMulai ? 'Lanjutkan Tes →' : 'Mulai Tes →'}
            </button>

            <button
              onClick={gantiAkun}
              style={{
                background: 'none', border: 'none', cursor: 'pointer',
                color: 'var(--t2)', fontSize: 12.5, marginTop: 14, textDecoration: 'underline',
              }}
            >
              Bukan {sesi?.nama}? Keluar
            </button>
          </div>
        </div>
      </main>
    );
  }

  if (!section) {
    return (
      <main className="page-wrap"><div className="shell"><div className="card" style={{ textAlign: 'center' }}>Memuat soal...</div></div></main>
    );
  }

  const progressPct = Math.round(((sectionIdx) / sections.length) * 100);

  if (tahap === 'intro') {
    return (
      <main className="page-wrap">
        <div className="shell">
          <div className="card screen">
            <span className="step-pill">Bagian {sectionIdx + 1} dari {sections.length}</span>
            <div className="progress-track"><div className="progress-fill" style={{ width: `${progressPct}%` }} /></div>

            <h2 style={{ fontFamily: 'var(--ff-h)', fontSize: 22, marginTop: 18, marginBottom: 8 }}>
              {SECTION_ICON[section.tipe] || '📄'} {section.title}
            </h2>
            <p style={{ color: 'var(--t2)', fontSize: 14.5, lineHeight: 1.6 }}>{section.instruksi}</p>

            {section.contoh && (
              <div className="example-box">
                <p>{section.contoh.q}</p>
                <ul>
                  {section.contoh.pilihan.map((p, i) => (
                    <li key={i} className={i === section.contoh.jawaban ? 'correct' : ''}>
                      {i === section.contoh.jawaban ? '✓ ' : '— '}{p}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginTop: 22, flexWrap: 'wrap', gap: 12 }}>
              <span className="timer-badge">⏱ {fmtWaktu(section.tipe === 'memori' ? section.memorizeDurasi : section.durasi)}</span>
              <button className="btn btn-primary btn-auto" onClick={mulaiBagian}>Mulai Bagian →</button>
            </div>
          </div>
        </div>
      </main>
    );
  }

  if (tahap === 'memorize') {
    return (
      <main className="page-wrap">
        <div className="shell">
          <div className="card screen">
            <PelanggaranBanner banner={banner} />
            <h2 style={{ fontFamily: 'var(--ff-h)', fontSize: 20, marginBottom: 4 }}>🧠 {section.title} — Hafalkan</h2>
            <p style={{ color: 'var(--t2)', fontSize: 13.5, marginTop: 8 }}>Sisa waktu menghafal</p>
            <span className={`timer-badge ${sisaWaktu <= 20 ? 'timer-danger' : ''}`} style={{ marginTop: 6 }}>
              ⏱ {fmtWaktu(sisaWaktu)}
            </span>

            <table className="mem-table">
              <tbody>
                {(section.meta && section.meta.pasangan_hafalan ? section.meta.pasangan_hafalan
                  : section.soal[0]?.meta?.pasangan_hafalan || []).map(([cat, item], i) => (
                  <tr key={i}><td style={{ fontWeight: 600 }}>{cat}</td><td>{item}</td></tr>
                ))}
              </tbody>
            </table>

            <button className="btn btn-primary" onClick={() => mulaiFaseBerwaktu('mengerjakan')}>
              Sudah Hafal, Mulai Soal →
            </button>
          </div>
        </div>
      </main>
    );
  }

  if (tahap === 'mengerjakan') {
    const timerClass = sisaWaktu <= 10 ? 'timer-danger' : sisaWaktu <= 30 ? 'timer-warn' : '';
    return (
      <main className="page-wrap">
        <div className="shell">
          <div className="card screen">
            <PelanggaranBanner banner={banner} />
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 12, flexWrap: 'wrap' }}>
              <div>
                <span className="step-pill">Bagian {sectionIdx + 1} dari {sections.length}</span>
                <h2 style={{ fontFamily: 'var(--ff-h)', fontSize: 20, marginTop: 6 }}>{section.title}</h2>
              </div>
              <span className={`timer-badge ${timerClass}`}>⏱ {fmtWaktu(sisaWaktu)}</span>
            </div>

            <div style={{ marginTop: 18 }}>
              {section.soal.map((s, i) => (
                <div key={s.kodeSoal} className="q-card">
                  <p><span className="q-num">{i + 1}</span><span className="q-text">{s.pertanyaan}</span></p>

                  {section.tipe === 'figural' && (
                    <div style={{ display: 'flex', gap: 14, alignItems: 'center', margin: '12px 0 4px' }}>
                      {(s.meta?.seq || []).map((desc, k) => (
                        <ShapeIcon key={k} raw={JSON.stringify(desc)} />
                      ))}
                      <span style={{ fontSize: 24, color: 'var(--t2)' }}>→ ?</span>
                    </div>
                  )}
                  {section.tipe === 'kubus' && s.meta && (
                    <div style={{ margin: '12px 0 4px' }}><CubeNet meta={s.meta} /></div>
                  )}

                  <div className="choice-grid">
                    {s.pilihan.map((p, k) => {
                      const dipilih = jawabanTerpilih[s.kodeSoal] === p;
                      const label = section.tipe === 'figural' ? <ShapeIcon raw={p} size={44} /> : p;
                      return (
                        <button
                          key={k}
                          onClick={() => pilihJawaban(s.kodeSoal, p)}
                          className={`choice-btn ${dipilih ? 'choice-selected' : ''}`}
                        >
                          {label}
                        </button>
                      );
                    })}
                  </div>
                </div>
              ))}
            </div>

            <button className="btn btn-primary" onClick={lanjutBagian} style={{ marginTop: 16 }}>
              {sectionIdx >= sections.length - 1 ? '✅ Selesaikan Tes' : 'Lanjut ke Bagian Berikutnya →'}
            </button>
          </div>
        </div>
      </main>
    );
  }

  if (tahap === 'terkunci') {
    return (
      <main className="page-wrap">
        <div className="shell" style={{ maxWidth: 460 }}>
          <div className="card screen" style={{ textAlign: 'center' }}>
            <div style={{ fontSize: 42 }}>🔒</div>
            <h1 style={{ fontFamily: 'var(--ff-h)', fontSize: 20, marginTop: 10 }}>Tes Dikunci Sistem</h1>
            <p style={{ color: 'var(--t2)', fontSize: 14, marginTop: 10, lineHeight: 1.6 }}>
              Halo <strong>{sesi?.nama || ''}</strong>, tes ini dikunci otomatis karena sistem
              mendeteksi pelanggaran berulang selama pengerjaan (pindah tab, jendela tidak
              fokus, menyalin/menempel teks, atau klik kanan) melebihi {AMBANG_PELANGGARAN} kali
              peringatan. Jawaban yang sudah tersimpan tidak hilang.
            </p>
            <div className="alert alert-error" style={{ marginTop: 16, textAlign: 'left' }}>
              <span>Silakan hubungi panitia pengawas untuk membuka kembali atau menyelesaikan tes ini.</span>
            </div>
            <button className="btn btn-outline btn-auto" style={{ marginTop: 16 }} onClick={gantiAkun}>
              Keluar
            </button>
          </div>
        </div>
      </main>
    );
  }

  if (tahap === 'selesai') {
    const h = hasilAkhir || {};
    const domainLabel = { Verbal: 'Verbal', Numerik: 'Numerik', Figural: 'Figural', Memori: 'Memori' };

    return (
      <main className="page-wrap">
        <div className="shell">
          <div className="card screen">
            <div className="result-hero">
              <div className="emoji">🎉</div>
              <h1>Tes Selesai</h1>
              <p>Terima kasih, <strong>{sesi?.nama}</strong>. Semua jawaban Anda sudah tersimpan.</p>
            </div>

            {h.iq != null && (
              <>
                <div className="stat-grid">
                  <div className="stat-tile">
                    <div className="label">Estimasi IQ</div>
                    <div className="value">{h.iq}</div>
                  </div>
                  <div className="stat-tile">
                    <div className="label">Klasifikasi</div>
                    <div className="value" style={{ fontSize: 15 }}>{h.iqClassification}</div>
                  </div>
                  <div className="stat-tile">
                    <div className="label">Skor IST</div>
                    <div className="value">{h.iqTotalCorrect}/{h.iqTotalMax} <span style={{ fontSize: 13, color: 'var(--t2)', fontWeight: 500 }}>({h.iqPercentage}%)</span></div>
                  </div>
                </div>

                {h.iqDomain && (
                  <>
                    <div className="section-title">Kemampuan per Domain</div>
                    {Object.entries(h.iqDomain).map(([k, v]) => (
                      <BarRow key={k} label={domainLabel[k] || k} value={v} />
                    ))}
                  </>
                )}
              </>
            )}

            {h.riasecScores && (
              <>
                <div className="section-title">Minat (RIASEC)</div>
                <div className="tag-row" style={{ marginBottom: 10 }}>
                  <span className="tag">🎯 Kode dominan: {h.riasecTopCode}</span>
                </div>
                {Object.entries(h.riasecScores).map(([k, v]) => (
                  <BarRow key={k} label={RIASEC_LABELS[k] || k} value={v} />
                ))}
              </>
            )}

            {h.gayaScores && (
              <>
                <div className="section-title">Gaya Belajar</div>
                <div className="tag-row" style={{ marginBottom: 10 }}>
                  <span className="tag">🎯 Dominan: {GAYA_LABELS[h.gayaDominant] || h.gayaDominant}</span>
                </div>
                {Object.entries(h.gayaScores).map(([k, v]) => (
                  <BarRow key={k} label={GAYA_LABELS[k] || k} value={v} />
                ))}
              </>
            )}

            {h.bakatScores && (
              <>
                <div className="section-title">Bakat Diferensial</div>
                <div className="tag-row" style={{ marginBottom: 10 }}>
                  <span className="tag">🎯 Terkuat: {BAKAT_LABELS[h.bakatTop] || h.bakatTop}</span>
                </div>
                {Object.entries(h.bakatScores).map(([k, v]) => (
                  <BarRow key={k} label={BAKAT_LABELS[k] || k} value={v} />
                ))}
                {h.bakatRekomendasi && (
                  <div className="alert alert-info" style={{ marginTop: 10 }}>{h.bakatRekomendasi}</div>
                )}
              </>
            )}

            <div className="divider" />
            <button
              onClick={gantiAkun}
              style={{
                background: 'none', border: 'none', cursor: 'pointer', display: 'block',
                margin: '0 auto', color: 'var(--t2)', fontSize: 12.5, textDecoration: 'underline',
              }}
            >
              Selesai — keluar untuk siswa berikutnya
            </button>
          </div>
        </div>
      </main>
    );
  }

  return null;
}
