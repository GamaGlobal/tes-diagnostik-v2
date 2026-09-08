// node test-api.js
// Tes alur lengkap: login/start -> jawab 1 soal -> finish
const BASE = 'http://localhost:3000/api';

async function main() {
  console.log('1) START (login)...');
  const startRes = await fetch(`${BASE}/attempt/start`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      username: '27706', password: 'Mtsn3bks#27', jenjang: 'smp', totalTahap: 9
    })
  });
  const start = await startRes.json();
  console.log(JSON.stringify(start, null, 2));
  if (!start.sesiId) { console.log('GAGAL di langkah start, berhenti.'); return; }

  console.log('\n2) Ambil kunci jawaban SE_smp_1 langsung dari API tidak ada,');
  console.log('   jadi kita coba jawab dengan teks sembarang dulu (boleh salah,');
  console.log('   yang penting kita cek apakah tersimpan):');

  const answerRes = await fetch(`${BASE}/attempt/answer`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ sesiId: start.sesiId, kodeSoal: 'SE_smp_1', jawabanTeks: 'contoh jawaban' })
  });
  console.log(JSON.stringify(await answerRes.json(), null, 2));

  console.log('\n3) FINISH (hitung hasil)...');
  const finishRes = await fetch(`${BASE}/attempt/finish`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ sesiId: start.sesiId })
  });
  console.log(JSON.stringify(await finishRes.json(), null, 2));

  console.log('\nSelesai. sesiId yang dipakai:', start.sesiId);
  console.log('Cek di Neon Console: tabel jawaban (harus ada 1 baris) dan tabel hasil (harus ada 1 baris).');
}

main().catch(err => console.error('ERROR:', err));
