'use client';
import { useState, useEffect, useRef, useCallback } from 'react';

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
const box = (s) => ({ width: s, height: s, display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid #ddd' });

// ---------- Render jaring-jaring kubus ----------
function CubeNet({ meta }) {
  const { net, target, layout } = meta;
  const cell = (pos, extra) => (
    <div style={{
      ...cellStyle,
      ...(pos === target ? { border: '3px solid #2563eb', background: '#eff6ff' } : {}),
      ...extra,
    }}>
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
const cellStyle = { width: 56, height: 56, display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid #ccc', fontSize: 22, margin: 1 };

function fmtWaktu(detik) {
  const m = Math.floor(detik / 60), s = detik % 60;
  return `${m}:${String(s).padStart(2, '0')}`;
}

export default function TesPage() {
  const [tahap, setTahap] = useState('login'); // login | intro | mengerjakan | memorize | pindah | selesai
  const [form, setForm] = useState({ username: '', password: '', jenjang: 'smp' });
  const [loginError, setLoginError] = useState('');
  const [sesi, setSesi] = useState(null); // {sesiId, nama, kelas, sekolah}
  const [sections, setSections] = useState([]);
  const [sectionIdx, setSectionIdx] = useState(0);
  const [jawabanTerpilih, setJawabanTerpilih] = useState({}); // {kodeSoal: teks}
  const [sisaWaktu, setSisaWaktu] = useState(0);
  const [hasilAkhir, setHasilAkhir] = useState(null);
  const cheatCountRef = useRef(0);
  const sesiIdRef = useRef(null);

  const section = sections[sectionIdx];

  // ---------- login ----------
  async function handleLogin(e) {
    e.preventDefault();
    setLoginError('');
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
      <main style={wrap}>
        <h1>Simulasi Tes IST</h1>
        <form onSubmit={handleLogin} style={{ display: 'grid', gap: 10, maxWidth: 320 }}>
          <input placeholder="Username" value={form.username}
            onChange={e => setForm(f => ({ ...f, username: e.target.value }))} style={inp} />
          <input placeholder="Password" type="password" value={form.password}
            onChange={e => setForm(f => ({ ...f, password: e.target.value }))} style={inp} />
          <select value={form.jenjang} onChange={e => setForm(f => ({ ...f, jenjang: e.target.value }))} style={inp}>
            <option value="smp">SMP</option>
            <option value="sma">SMA</option>
          </select>
          <button style={btn}>Masuk</button>
          {loginError && <p style={{ color: 'crimson' }}>{loginError}</p>}
        </form>
      </main>
    );
  }

  if (!section) return <main style={wrap}>Memuat soal...</main>;

  if (tahap === 'intro') {
    return (
      <main style={wrap}>
        <p>Bagian {sectionIdx + 1} dari {sections.length}</p>
        <h2>{section.title}</h2>
        <p>{section.instruksi}</p>
        {section.contoh && (
          <div style={{ background: '#f5f5f5', padding: 12, borderRadius: 6 }}>
            <p>{section.contoh.q}</p>
            <ul>{section.contoh.pilihan.map((p, i) => (
              <li key={i} style={{ fontWeight: i === section.contoh.jawaban ? 'bold' : 'normal' }}>{p}</li>
            ))}</ul>
          </div>
        )}
        <p>Waktu: {fmtWaktu(section.tipe === 'memori' ? section.memorizeDurasi : section.durasi)}</p>
        <button style={btn} onClick={mulaiBagian}>Mulai</button>
      </main>
    );
  }

  if (tahap === 'memorize') {
    return (
      <main style={wrap}>
        <h2>{section.title} — Hafalkan</h2>
        <p>Sisa waktu menghafal: <b>{fmtWaktu(sisaWaktu)}</b></p>
        <table style={{ borderCollapse: 'collapse' }}>
          <tbody>
            {(section.meta && section.meta.pasangan_hafalan ? section.meta.pasangan_hafalan
              : section.soal[0]?.meta?.pasangan_hafalan || []).map(([cat, item], i) => (
              <tr key={i}><td style={td}>{cat}</td><td style={td}>{item}</td></tr>
            ))}
          </tbody>
        </table>
        <button style={btn} onClick={() => { setSisaWaktu(section.durasi); setTahap('mengerjakan'); }}>
          Sudah Hafal, Mulai Soal
        </button>
      </main>
    );
  }

  if (tahap === 'mengerjakan') {
    return (
      <main style={wrap}>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          <h2>{section.title}</h2>
          <div>Sisa waktu: <b>{fmtWaktu(sisaWaktu)}</b></div>
        </div>
        {section.soal.map((s, i) => (
          <div key={s.kodeSoal} style={{ margin: '16px 0', paddingBottom: 12, borderBottom: '1px solid #eee' }}>
            <p><b>{i + 1}.</b> {s.pertanyaan}</p>

            {section.tipe === 'figural' && (
              <div style={{ display: 'flex', gap: 16, alignItems: 'center', marginBottom: 8 }}>
                {(s.meta?.seq || []).map((desc, k) => (
                  <ShapeIcon key={k} raw={JSON.stringify(desc)} />
                ))}
                <span style={{ fontSize: 28 }}>→ ?</span>
              </div>
            )}
            {section.tipe === 'kubus' && s.meta && (
              <div style={{ marginBottom: 8 }}><CubeNet meta={s.meta} /></div>
            )}

            <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
              {s.pilihan.map((p, k) => {
                const dipilih = jawabanTerpilih[s.kodeSoal] === p;
                const label = section.tipe === 'figural' ? <ShapeIcon raw={p} size={48} /> : p;
                return (
                  <button key={k} onClick={() => pilihJawaban(s.kodeSoal, p)}
                    style={{ ...pilihanBtn, ...(dipilih ? pilihanBtnAktif : {}) }}>
                    {label}
                  </button>
                );
              })}
            </div>
          </div>
        ))}
        <button style={btn} onClick={lanjutBagian}>
          {sectionIdx >= sections.length - 1 ? 'Selesaikan Tes' : 'Lanjut ke Bagian Berikutnya'}
        </button>
      </main>
    );
  }

  if (tahap === 'selesai') {
    return (
      <main style={wrap}>
        <h1>Tes Selesai</h1>
        <p>Terima kasih, {sesi?.nama}. Jawaban Anda sudah tersimpan.</p>
        {hasilAkhir && (
          <pre style={{ background: '#f5f5f5', padding: 12, whiteSpace: 'pre-wrap' }}>
            {JSON.stringify(hasilAkhir, null, 2)}
          </pre>
        )}
      </main>
    );
  }

  return null;
}

const wrap = { fontFamily: 'sans-serif', padding: 24, maxWidth: 720, margin: '0 auto' };
const inp = { padding: 10, fontSize: 16 };
const btn = { padding: '10px 20px', fontSize: 16, marginTop: 16, cursor: 'pointer' };
const td = { border: '1px solid #ccc', padding: 6 };
const pilihanBtn = { padding: '10px 14px', border: '1px solid #ccc', borderRadius: 6, background: '#fff', cursor: 'pointer' };
const pilihanBtnAktif = { background: '#2563eb', color: '#fff', borderColor: '#2563eb' };
