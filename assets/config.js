// CONFIG — Supabase credentials
const SUPABASE_URL = "https://fxmvmsaoxkclratzqloo.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4bXZtc2FveGtjbHJhdHpxbG9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODY0MjUzNjksImV4cCI6MjEwMjAwMTM2OX0.5d5tEE6ZF6uTyI8H-1OpLqGcJ40rmWliLlCdLKwo9Rk";

// Change this to your team's password for the dashboard
const ADMIN_PASSWORD = "arogya2026";

const EVIDENCE_BUCKET = "pledge-evidence";
const CLAUDE_PROXY_URL = "";

// --- do not edit below ---
window.AC_CONFIG = { SUPABASE_URL, SUPABASE_ANON_KEY, ADMIN_PASSWORD, EVIDENCE_BUCKET, CLAUDE_PROXY_URL };
window.sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
