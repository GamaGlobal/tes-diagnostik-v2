'use client';
import { useState, useEffect, useCallback, useMemo } from 'react';

const AMBANG_AKTIF_DETIK = 90;   // heartbeat dikirim tiap 20 detik -> >90 detik dianggap idle
const AMBANG_DITINGGAL_MENIT = 5; // > 5 menit tanpa heartbeat -> kemungkinan ditinggal

function detikSejak(iso) {
  return Math.floor((Date.now() - new Date(iso).getTime()) / 1000);
}
function fmtDurasi(detik) {
  if (detik < 60) return `${detik} detik lalu`;
  const menit = Math.floor(detik / 60);
  if (menit < 60) return `${menit} menit lalu`;
  const jam = Math.floor(menit / 60);
  return `${jam} jam ${menit % 60} menit lalu`;
}
function fmtWaktu(iso) {
  if (!iso) return '-';
  return new Date(iso).toLocaleString('id-ID', { dateStyle: 'short', timeStyle: 'short' });
}
const STATUS_LABEL = {
  mengerjakan: 'Mengerjakan',
  selesai_terkirim: 'Selesai',
  selesai_paksa_panitia: 'Diselesaikan Panitia',
  dibatalkan: 'Dibatalkan',
};

export default function AdminPage() {
  const [pin, setPin] = useState('');
  const [authed, setAuthed] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [rows, setRows] = useState([]);
  const [tab, setTab] = useState('mengerjakan');
  const [search, setSearch] = useState('');
  const [lastLoad, setLastLoad] = useState(null);
  const [actionMsg, setActionMsg] = useState('');
  const [actionLoading, setActionLoading] = useState(null); // sesi_id sedang diproses

  const load = useCallback(async (pinValue) => {
    setLoading(true);
    setError('');
    try {
      const res = await fetch('/api/admin/monitor', { headers: { 'x-panitia-pin': pinValue } });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Gagal memuat data.');
      setRows(data.rows || []);
      setAuthed(true);
      setLastLoad(new Date());
    } catch (e) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  }, []);

  const handleMasuk = (e) => {
    e.preventDefault();
    if (!pin.trim()) { setError('PIN panitia wajib diisi.'); return; }
    load(pin.trim());
  };

  // auto-refresh tiap 15 detik supaya terasa "live"
  useEffect(() => {
    if (!authed) return;
    const iv = setInterval(() => load(pin), 15000);
    return () => clearInterval(iv);
  }, [authed, pin, load]);

  const paksaSelesaikan = async (sesiId, nama) => {
    if (!confirm(`Paksa selesaikan sesi milik "${nama}"? Hasil akan dihitung dari jawaban yang sudah tersimpan sejauh ini.`)) return;
    setActionLoading(sesiId);
    setActionMsg('');
    try {
      const res = await fetch('/api/attempt/finish', {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sesiId, dipaksaOleh: pin }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Gagal memproses.');
      setActionMsg(`✓ Sesi "${nama}" berhasil diselesaikan.`);
      load(pin);
    } catch (e) {
      setActionMsg(`⚠️ ${e.message}`);
    } finally {
      setActionLoading(null);
    }
  };

  const mengerjakan = useMemo(() => rows.filter(r => r.status === 'mengerjakan'), [rows]);
  const selesai = useMemo(() => rows.filter(r => r.status !== 'mengerjakan'), [rows]);

  const cocok = (r, q) => {
    if (!q) return true;
    const hay = `${r.nama} ${r.kelas || ''} ${r.sekolah || ''} ${r.username}`.toLowerCase();
    return hay.includes(q.toLowerCase());
  };
  const mengerjakanTampil = mengerjakan.filter(r => cocok(r, search));
  const selesaiTampil = selesai.filter(r => cocok(r, search));

  const aktifSekarang = mengerjakan.filter(r => detikSejak(r.heartbeat_at) < AMBANG_AKTIF_DETIK).length;
  const kemungkinanDitinggal = mengerjakan.filter(r => detikSejak(r.heartbeat_at) >= AMBANG_DITINGGAL_MENIT * 60).length;

  // ── PIN gate ──────────────────────────────────────────────────────────
  if (!authed) {
    return (
      <main className="login-wrap">
        <div className="login-bg-circle" style={{ width: 300, height: 300, top: -100, right: -100, opacity: 0.5 }} />
        <div className="login-bg-circle" style={{ width: 200, height: 200, bottom: -60, left: -60, opacity: 0.3 }} />
        <div className="login-card screen">
          <div className="login-logo">
            <div className="login-logo-icon">📊</div>
            <div className="login-logo-title">Panel Panitia</div>
            <div className="login-logo-sub">Live monitor peserta Simulasi Tes IST</div>
          </div>

          {error && <div className="alert alert-error"><span>⚠️</span><span>{error}</span></div>}

          <form onSubmit={handleMasuk}>
            <div className="field">
              <label className="field-label">PIN Panitia</label>
              <input
                className="input" type="password" placeholder="Masukkan PIN"
                value={pin} onChange={e => { setPin(e.target.value); setError(''); }}
                autoFocus
              />
            </div>
            <button className="btn btn-navy" disabled={loading}>
              {loading ? '⏳ Memeriksa...' : '🔓 Masuk ke Panel'}
            </button>
          </form>
        </div>
      </main>
    );
  }

  // ── Dashboard ─────────────────────────────────────────────────────────
  return (
    <main className="page-wrap">
      <div className="shell shell-wide">
        <div className="admin-top">
          <div>
            <div className="admin-title">📊 Live Monitor — Simulasi Tes IST</div>
            {lastLoad && <div className="muted">Diperbarui otomatis · terakhir {lastLoad.toLocaleTimeString('id-ID')}</div>}
          </div>
          <div style={{ display: 'flex', gap: 8 }}>
            <button className="btn btn-outline btn-auto btn-sm" onClick={() => load(pin)} disabled={loading}>
              {loading ? '⏳ Memuat...' : '🔄 Refresh'}
            </button>
            <input
              className="search-input" placeholder="Cari nama / kelas / sekolah..."
              value={search} onChange={e => setSearch(e.target.value)}
            />
          </div>
        </div>

        {error && <div className="alert alert-error" style={{ maxWidth: 480 }}><span>⚠️</span><span>{error}</span></div>}
        {actionMsg && (
          <div className={`alert ${actionMsg.startsWith('⚠️') ? 'alert-error' : 'alert-ok'}`} style={{ maxWidth: 480 }}>
            <span>{actionMsg}</span>
          </div>
        )}

        <div className="stat-grid" style={{ marginBottom: 22 }}>
          <div className="stat-tile">
            <div className="label">Sedang mengerjakan</div>
            <div className="value">{mengerjakan.length}</div>
          </div>
          <div className="stat-tile" style={{ background: 'var(--green-l)', borderColor: '#A7F3D0' }}>
            <div className="label">Aktif sekarang</div>
            <div className="value" style={{ color: 'var(--green)' }}>{aktifSekarang}</div>
          </div>
          <div className="stat-tile" style={{ background: 'var(--gold-l)', borderColor: '#FCD34D' }}>
            <div className="label">Kemungkinan ditinggal</div>
            <div className="value" style={{ color: '#92400E' }}>{kemungkinanDitinggal}</div>
          </div>
          <div className="stat-tile">
            <div className="label">Sudah selesai</div>
            <div className="value">{selesai.length}</div>
          </div>
        </div>

        <div className="tabs">
          <button className={`tab-btn ${tab === 'mengerjakan' ? 'tab-active' : ''}`} onClick={() => setTab('mengerjakan')}>
            Sedang Mengerjakan ({mengerjakanTampil.length})
          </button>
          <button className={`tab-btn ${tab === 'selesai' ? 'tab-active' : ''}`} onClick={() => setTab('selesai')}>
            Sudah Selesai ({selesaiTampil.length})
          </button>
        </div>

        {tab === 'mengerjakan' && (
          <div className="table-wrap">
            <table className="data-table">
              <thead>
                <tr>
                  {['Nama', 'Kelas', 'Sekolah', 'Jenjang', 'Progres', 'Soal Terjawab', 'Pelanggaran', 'Terakhir Aktif', 'Status', 'Aksi'].map(h => (
                    <th key={h}>{h}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {mengerjakanTampil.map(r => {
                  const detik = detikSejak(r.heartbeat_at);
                  const ditinggal = detik >= AMBANG_DITINGGAL_MENIT * 60;
                  const aktif = detik < AMBANG_AKTIF_DETIK;
                  return (
                    <tr key={r.sesi_id} className={ditinggal ? 'row-stale' : ''}>
                      <td style={{ fontWeight: 600 }}>{r.nama}</td>
                      <td>{r.kelas || '-'}</td>
                      <td>{r.sekolah}</td>
                      <td style={{ textTransform: 'uppercase' }}>{r.jenjang}</td>
                      <td>{r.tahap_ke}/{r.total_tahap}</td>
                      <td style={{ textAlign: 'center' }}>{r.jumlah_terjawab}</td>
                      <td>
                        {r.cheat_count > 0
                          ? <span className="badge badge-red"><span className="dot" />{r.cheat_count}x pindah tab</span>
                          : <span className="badge badge-gray">-</span>}
                      </td>
                      <td className="muted">{fmtDurasi(detik)}</td>
                      <td>
                        {ditinggal
                          ? <span className="badge badge-gold"><span className="dot" />Kemungkinan ditinggal</span>
                          : aktif
                            ? <span className="badge badge-green"><span className="dot" />Aktif</span>
                            : <span className="badge badge-gray"><span className="dot" />Idle</span>}
                      </td>
                      <td>
                        <button
                          className="btn btn-danger btn-sm btn-auto"
                          disabled={actionLoading === r.sesi_id}
                          onClick={() => paksaSelesaikan(r.sesi_id, r.nama)}
                        >
                          {actionLoading === r.sesi_id ? '...' : 'Paksa Selesaikan'}
                        </button>
                      </td>
                    </tr>
                  );
                })}
                {!mengerjakanTampil.length && (
                  <tr><td colSpan={10} style={{ textAlign: 'center', color: 'var(--t2)', padding: 20 }}>
                    {mengerjakan.length ? 'Tidak ada yang cocok dengan pencarian.' : 'Tidak ada peserta yang sedang mengerjakan.'}
                  </td></tr>
                )}
              </tbody>
            </table>
          </div>
        )}

        {tab === 'selesai' && (
          <div className="table-wrap">
            <table className="data-table">
              <thead>
                <tr>
                  {['Nama', 'Kelas', 'Sekolah', 'Status', 'Level IQ', 'Skor IST', 'Est. IQ', 'RIASEC', 'Gaya', 'Bakat', 'Selesai'].map(h => (
                    <th key={h}>{h}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {selesaiTampil.map(r => (
                  <tr key={r.sesi_id}>
                    <td style={{ fontWeight: 600 }}>{r.nama}</td>
                    <td>{r.kelas || '-'}</td>
                    <td>{r.sekolah}</td>
                    <td>
                      <span className={`badge ${r.status === 'selesai_paksa_panitia' ? 'badge-gold' : 'badge-green'}`}>
                        {STATUS_LABEL[r.status] || r.status}
                      </span>
                    </td>
                    <td>{r.level_ist || '-'}</td>
                    <td>{r.persentase != null ? `${r.persentase}%` : '-'}</td>
                    <td>{r.estimasi_iq ?? '-'}</td>
                    <td>{r.riasec_top || '-'}</td>
                    <td>{r.gaya_dominant || '-'}</td>
                    <td>{r.bakat_top || '-'}</td>
                    <td className="muted">{fmtWaktu(r.selesai_at)}</td>
                  </tr>
                ))}
                {!selesaiTampil.length && (
                  <tr><td colSpan={11} style={{ textAlign: 'center', color: 'var(--t2)', padding: 20 }}>
                    {selesai.length ? 'Tidak ada yang cocok dengan pencarian.' : 'Belum ada peserta yang menyelesaikan tes.'}
                  </td></tr>
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </main>
  );
}
