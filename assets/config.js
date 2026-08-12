// ============================================================
//  CONFIG — paste your two Supabase values here, then save.
//  Find them in Supabase → Project Settings → API
// ============================================================

// 1) Your Project URL (looks like https://abcdefgh.supabase.co)
const SUPABASE_URL = "https://fxmvmsaoxkclratzqloo.supabase.co";

// 2) Your anon / public key (a long string starting with "eyJ...")
//    This key is SAFE to put in public code — it only allows what your
//    RLS policies allow. Never paste the "service_role" key here.
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4bXZtc2FveGtjbHJhdHpxbG9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODY0MjUzNjksImV4cCI6MjEwMjAwMTM2OX0.5d5tEE6ZF6uTyI8H-1OpLqGcJ40rmWliLlCdLKwo9Rk";

// 3) Shared password for the Arogya City technical team dashboard.
//    Change this to something your team knows. It is a light gate,
//    not bank-grade security — fine for an internal ops dashboard.
const ADMIN_PASSWORD = "arogya2026";

// 4) Storage bucket name (leave as-is unless you renamed it).
const EVIDENCE_BUCKET = "pledge-evidence";

// 5) OPTIONAL — Claude proxy URL for the intake tool's auto-draft.
//    Leave blank to skip auto-draft (you'll fill pledges by hand in the
//    review editor, still fast). To enable auto-draft, deploy the free
//    Cloudflare Worker in claude-proxy-worker.js and paste its URL here.
const CLAUDE_PROXY_URL = "";

// --- do not edit below ---
window.AC_CONFIG = { SUPABASE_URL, SUPABASE_ANON_KEY, ADMIN_PASSWORD, EVIDENCE_BUCKET, CLAUDE_PROXY_URL };
