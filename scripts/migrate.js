// node scripts/migrate.js
// Menjalankan semua file di db/*.sql berurutan (001, 002, 003, ...) ke Neon.
// Pakai Pool (bukan tagged-template neon()) karena file .sql di sini berisi
// banyak statement sekaligus.
require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { Pool } = require('@neondatabase/serverless');

async function main() {
  if (!process.env.DATABASE_URL) {
    console.error('DATABASE_URL belum diisi (lihat .env.example -> salin ke .env)');
    process.exit(1);
  }
  console.log('Memakai DATABASE_URL:', process.env.DATABASE_URL.replace(/:[^:@]*@/, ':****@'));
  const pool = new Pool({ connectionString: process.env.DATABASE_URL });
  pool.on('error', (err) => console.error('Pool error (di luar query):', err));
  const dir = path.join(__dirname, '..', 'db');
  const files = fs.readdirSync(dir).filter(f => f.endsWith('.sql')).sort();

  for (const file of files) {
    console.log(`\n>> Menjalankan ${file} ...`);
    const sqlText = fs.readFileSync(path.join(dir, file), 'utf8');
    try {
      await pool.query(sqlText);
      console.log(`   OK`);
    } catch (err) {
      console.error(`   GAGAL di ${file}`);
      console.error('   message :', err && err.message);
      console.error('   code    :', err && err.code);
      console.error('   detail  :', err && err.detail);
      console.error('   cause   :', err && err.cause);
      console.error('   raw     :', err);
      process.exit(1);
    }
  }
  console.log('\nSemua migrasi selesai.');
  await pool.end();
}

main();
