// lib/db.js — pola sama seperti di simtka-2026-new (@neondatabase/serverless, bukan Prisma)
import { neon } from '@neondatabase/serverless';

export const sql = neon(process.env.DATABASE_URL);
