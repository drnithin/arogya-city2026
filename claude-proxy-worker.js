// ============================================================
//  Arogya City · Claude API proxy (Cloudflare Worker)
//  Lets the intake tool auto-draft pledges without exposing
//  your Anthropic API key in public code.
//
//  SETUP:
//  1. dash.cloudflare.com -> Workers & Pages -> Create -> Create Worker
//  2. Name it "arogya-claude", Deploy, then Edit code.
//  3. Delete the default code, paste THIS whole file, Deploy.
//  4. Settings -> Variables and Secrets -> Add:
//        Type = Secret
//        Name = ANTHROPIC_API_KEY
//        Value = your sk-ant-... key from console.anthropic.com
//     Save and deploy.
//  5. Copy the Worker URL (https://arogya-claude.YOURNAME.workers.dev)
//     and paste it into assets/config.js as CLAUDE_PROXY_URL.
// ============================================================

const ALLOWED_ORIGINS = [
  "https://drnithin.github.io"
];

function corsHeaders(origin) {
  const allow = ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0];
  return {
    "Access-Control-Allow-Origin": allow,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type",
  };
}

export default {
  async fetch(request, env) {
    const origin = request.headers.get("Origin") || "";

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
