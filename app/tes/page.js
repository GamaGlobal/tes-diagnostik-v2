'use client';
import { useState, useEffect, useRef, useCallback } from 'react';
import { RIASEC_LABELS, GAYA_LABELS, BAKAT_LABELS } from '../../lib/labels';

const API = '/api/attempt';

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
  const cheatCountRef = useRef(0);
  const sesiIdRef = useRef(null);

  const section = sections[sectionIdx];

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
      setSesi(data);

      const soalRes = await fetch(`${API}/soal?jenjang=${form.jenjang}`);
      const soalData = await soalRes.json();
      setSections(soalData.sections);

      const jawabanAwal = {};
      (data.jawabanTersimpan || []).forEach(j => { jawabanAwal[j.kode_soal] = j.jawaban_teks; });
      setJawabanTerpilih(jawabanAwal);

      setSectionIdx(Math.min(data.tahapKe || 0, soalData.sections.length - 1));
      setTahap('intro');
    } catch {
      setLoginError('Gagal terhubung ke server. Coba lagi.');
    } finally {
      setLoginLoading(false);
    }
  }

  // ---------- heartbeat ----------
  useEffect(() => {
    if (tahap === 'login' || tahap === 'selesai') return;
    const iv = setInterval(() => {
      fetch(`${API}/heartbeat`, {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sesiId: sesiIdRef.current, tahapKe: sectionIdx, cheatCount: cheatCountRef.current }),
      }).catch(() => {}); // aman diabaikan -> jawaban tetap tersimpan per-soal, tidak bergantung heartbeat
    }, 20000);
    return () => clearInterval(iv);
  }, [tahap, sectionIdx]);

  // ---------- deteksi pindah tab (anti-cheat sederhana) ----------
  useEffect(() => {
    function onVis() { if (document.hidden && tahap === 'mengerjakan') cheatCountRef.current += 1; }
    document.addEventListener('visibilitychange', onVis);
    return () => document.removeEventListener('visibilitychange', onVis);
  }, [tahap]);

  // ---------- timer per bagian ----------
  useEffect(() => {
    if (tahap !== 'mengerjakan' && tahap !== 'memorize') return;
    if (sisaWaktu <= 0) { lanjutBagian(); return; }
    const t = setTimeout(() => setSisaWaktu(s => s - 1), 1000);
    return () => clearTimeout(t);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sisaWaktu, tahap]);

  function mulaiBagian() {
    if (section.tipe === 'memori') {
      setSisaWaktu(section.memorizeDurasi);
      setTahap('memorize');
    } else {
      setSisaWaktu(section.durasi);
      setTahap('mengerjakan');
    }
  }

  function pilihJawaban(kodeSoal, teks) {
    setJawabanTerpilih(prev => ({ ...prev, [kodeSoal]: teks }));
    fetch(`${API}/answer`, {
      method: 'POST', headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sesiId: sesiIdRef.current, kodeSoal, jawabanTeks: teks }),
    }).catch(() => {
      // gagal kirim -> coba lagi sekali setelah 3 detik (jaring pengaman sederhana)
      setTimeout(() => {
        fetch(`${API}/answer`, {
          method: 'POST', headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ sesiId: sesiIdRef.current, kodeSoal, jawabanTeks: teks }),
        }).catch(() => {});
      }, 3000);
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

            <button className="btn btn-primary" onClick={() => { setSisaWaktu(section.durasi); setTahap('mengerjakan'); }}>
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
          </div>
        </div>
      </main>
    );
  }

  return null;
}
