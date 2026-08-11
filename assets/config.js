// ============================================================
//  CONFIG — paste your two Supabase values here, then save.
//  Find them in Supabase → Project Settings → API
// ============================================================

// 1) Your Project URL (looks like https://abcdefgh.supabase.co)
const SUPABASE_URL = "PASTE_YOUR_PROJECT_URL_HERE";

// 2) Your anon / public key (a long string starting with "eyJ...")
//    This key is SAFE to put in public code — it only allows what your
//    RLS policies allow. Never paste the "service_role" key here.
const SUPABASE_ANON_KEY = "PASTE_YOUR_ANON_KEY_HERE";

// 3) Shared password for the Secretariat dashboard.
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
