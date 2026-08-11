// ============================================================
//  Arogya City · Claude API proxy (Cloudflare Worker)
//  Lets the intake tool auto-draft pledges without exposing
//  your Anthropic API key in public code.
//
//  WHY YOU NEED THIS:
//  A public GitHub Pages site cannot call api.anthropic.com
//  directly (the browser blocks it, and a key in public code
//  would be stolen). This tiny worker holds the key safely on
//  Cloudflare's servers and forwards the request.
//
//  SETUP (about 5 minutes, free):
//  1. Go to dash.cloudflare.com → sign up (free).
//  2. Left sidebar → "Workers & Pages" → "Create" → "Create Worker".
//  3. Name it e.g. "arogya-claude". Click "Deploy" (creates a default worker).
//  4. Click "Edit code". Delete what's there, paste THIS whole file, Deploy.
//  5. Add your key: Worker → "Settings" → "Variables and Secrets"
//     → "Add" → type = Secret, name = ANTHROPIC_API_KEY, value = your key
//     (get a key at console.anthropic.com → API Keys). Save & deploy.
//  6. Copy your worker URL (like https://arogya-claude.YOURNAME.workers.dev).
//  7. Open assets/config.js and set:
//        const CLAUDE_PROXY_URL = "https://arogya-claude.YOURNAME.workers.dev";
//     Commit & push. Auto-draft now works.
//
//  If you skip this, the intake tool still works — it just opens
//  the review editor blank for you to fill by hand.
// ============================================================

const ALLOWED_ORIGINS = [
  // add your GitHub Pages origin here, e.g.:
  // "https://YOURNAME.github.io"
  "*" // permissive default; tighten to your origin for production
];

function corsHeaders(origin) {
  const allow = ALLOWED_ORIGINS.includes("*") ? "*"
    : (ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0]);
  return {
    "Access-Control-Allow-Origin": allow,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type",
  };
}

export default {
  async fetch(request, env) {
    const origin = request.headers.get("Origin") || "";

    // CORS preflight
    if (request.method === "OPTIONS") {
      return new Response(null, { headers: corsHeaders(origin) });
    }
    if (request.method !== "POST") {
      return new Response("POST only", { status: 405, headers: corsHeaders(origin) });
    }
    if (!env.ANTHROPIC_API_KEY) {
      return json({ error: "Server missing ANTHROPIC_API_KEY" }, 500, origin);
    }

    let body;
    try { body = await request.json(); }
    catch { return json({ error: "Bad JSON" }, 400, origin); }

    // Only allow the messages we expect; keep it simple and safe.
    const payload = {
      model: body.model || "claude-sonnet-4-6",
      max_tokens: Math.min(body.max_tokens || 1500, 2000),
      messages: body.messages || [],
    };

    try {
      const r = await fetch("https://api.anthropic.com/v1/messages", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "x-api-key": env.ANTHROPIC_API_KEY,
          "anthropic-version": "2023-06-01",
        },
        body: JSON.stringify(payload),
      });
      const data = await r.json();
      return json(data, r.status, origin);
    } catch (e) {
      return json({ error: String(e) }, 502, origin);
    }
  },
};

function json(obj, status, origin) {
  return new Response(JSON.stringify(obj), {
    status,
    headers: { "Content-Type": "application/json", ...corsHeaders(origin) },
  });
}
