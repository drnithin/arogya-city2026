# Arogya City · Pledge Closeout

A personalised final-report system for Arogya City pledge makers. Each organisation gets a private link that pre-loads their own 2024 pledge and asks them to report against it. The Secretariat gets a live dashboard to see who has done what and to chase the stragglers.

- **Frontend:** plain HTML/CSS/JS, hosted free on GitHub Pages
- **Backend:** Supabase (database + file storage), free tier
- **Login:** shared team password for the dashboard

There is no build step and no server to run. You edit files, push to GitHub, and it's live.

---

## What you'll set up (about 30 minutes, one time)

1. A Supabase project (the backend)
2. Paste two keys into `assets/config.js`
3. Push this folder to GitHub and turn on Pages
4. Send each org their private link

---

## Step 1 — Create the Supabase backend

1. Go to **supabase.com**, sign up (free), click **New project**.
2. Give it a name (e.g. `arogya-city`), set a database password (save it somewhere), pick the region closest to India (**Mumbai** if offered), and create. Wait ~2 minutes for it to spin up.
3. In the left sidebar open **SQL Editor** → **New query**.
4. Open the file `supabase-setup.sql` from this folder, copy everything, paste it in, and click **Run**. You should see "Success". This creates your two tables, security rules, the file bucket, and seeds Arogya World's pledge.

## Step 2 — Get your two keys

1. In Supabase, click the gear icon (**Project Settings**) → **API**.
2. Copy the **Project URL** and the **anon public** key.
3. Open `assets/config.js` in this folder and paste them in:
   ```js
   const SUPABASE_URL = "https://xxxx.supabase.co";
   const SUPABASE_ANON_KEY = "eyJ...";        // the long anon key
   const ADMIN_PASSWORD = "choose-your-team-password";
   ```
   The anon key is **safe to publish** — your database security rules control what it can do. Never paste the `service_role` key.

## Step 3 — Put it on GitHub Pages

**Option A — GitHub website (no terminal):**
1. Go to **github.com**, create a new repository, name it e.g. `arogya-city` (Public).
2. On the new repo page click **uploading an existing file**, then drag in *everything inside this folder* (index.html, admin/, assets/, etc.).
3. Commit.
4. Repo → **Settings** → **Pages** → under "Build and deployment" set Source = **Deploy from a branch**, Branch = **main**, folder = **/ (root)**, Save.
5. Wait ~1 minute. Your site is live at `https://YOURNAME.github.io/arogya-city/`.

**Option B — terminal (if you prefer):**
```bash
cd arogya-city
git init && git add . && git commit -m "Arogya City pledge closeout"
git branch -M main
git remote add origin https://github.com/YOURNAME/arogya-city.git
git push -u origin main
# then turn on Pages in Settings as in Option A step 4
```

## Step 4 — Test it

- **Pledge form:** open `https://YOURNAME.github.io/arogya-city/index.html?t=arogya-world-2024`
  You should see the Arogya World welcome screen. Fill a number, it auto-saves.
- **Dashboard:** open `https://YOURNAME.github.io/arogya-city/admin/`
  Enter your team password. You'll see Arogya World listed, and once you filled a number above it flips to "In progress".

---

## Day-to-day use

### Adding an organisation
Two ways:

**Easiest — from the dashboard:** click **+ Add organisation**, fill the form (commitments go one per line as `Title | number | unit | online/offline`), click **Create + get link**. The private link is copied to your clipboard automatically. Paste it into your email to them.

**Bulk — via SQL:** for many orgs at once, duplicate the seed block at the bottom of `supabase-setup.sql`, change the values, and run it in the SQL Editor.

### Sending links
Each org's link looks like:
`https://YOURNAME.github.io/arogya-city/index.html?t=THEIR-TOKEN`
The **Copy link** button next to each org gives you theirs. This link is their private key — anyone with it can fill their report, so send it directly to their contact.

### Chasing stragglers
The dashboard shows exactly who is at "Not opened" or "In progress". Copy their link, drop them a warm reminder. When they submit, a **View report** button appears so you can read their numbers, story, files and links.

### Reading uploaded files
Files open straight from the **View report** popup. Large videos come in as pasted links (YouTube/Drive), which also open from there.

---

## Storage notes

- Uploaded documents live in Supabase Storage (free tier: **1 GB**, plenty for photos/PDFs/spreadsheets across 40 orgs).
- The form caps direct uploads at **25 MB** and nudges people to **paste a link** for anything bigger (videos, big photo folders). This keeps you on the free tier.
- If you ever need more, Supabase Pro is $25/month for 100 GB — no code change needed.

## Security notes (plain English)

- The dashboard password is a light gate for an internal ops tool, not bank security. Fine for programme numbers; don't store confidential personal data here.
- Each org's link token is a long random string, effectively a per-org password.
- The public "anon" key in `config.js` is meant to be public; the database rules in the SQL file are what actually protect the data.

## Making forms from your pledge documents (the intake tool)

You do **not** need to type each pledge in by hand. Open **`admin/intake.html`** (or click "+ Add from document" in the dashboard header):

1. **Upload** the organisation's pledge as `.docx`, `.pdf`, or `.txt` (or paste the text).
2. The tool reads the document and **drafts** the organisation name, contact, pledge title, a friendly welcome sentence, and every commitment with its target number, unit, and type.
3. **Review and fix** anything on screen, then click **Create organisation + link**. The private link is copied to your clipboard, ready to email.

The document is read entirely in your browser. The drafting step calls the Claude API to structure the text.

### One extra setup for auto-draft
The auto-draft feature sends the pledge text to the Anthropic API. For it to work you need an API route. Two options:

- **Simplest (recommended):** run this on Anthropic's Claude platform / an environment where the `api.anthropic.com` call is authorised for you. If your GitHub Pages call to the API is blocked by CORS or needs a key, use the fallback below.
- **Fallback that always works:** if auto-draft is unavailable, the tool still opens the **review editor with blank fields** so you can fill the pledge in quickly by hand (much faster than SQL). Nothing breaks; you just lose the auto-fill.
- **To enable auto-draft reliably in production:** add a tiny serverless function (e.g. a free Cloudflare Worker or Vercel function) that holds your Anthropic API key and forwards the request. Ask and I can generate that 20-line proxy for you. Never put a secret API key directly in `config.js` (it is public).

Even with auto-draft off, the intake tool's upload + review editor is the fastest way to add orgs.

## The Impact Wall (public showcase)

**`wall.html`** is a public page that shows every **submitted** pledge with its impact numbers and the organisation's own closing words, plus live running totals. Share the link publicly. Two reasons it matters:

- It is the **recognition carrot**: organisations report in order to be seen on it, which pulls in the stragglers better than reminder emails.
- Partial and not-opened pledges never appear, so nothing embarrassing shows. A pledge appears only once its final report is submitted.

No setup needed beyond the main install; it reads the same database.

## Files in this project
```
index.html              the pledge form (what orgs fill)
wall.html               the public Impact Wall
admin/index.html        the Secretariat dashboard
admin/intake.html       upload a pledge doc → draft → create link
assets/
  config.js             ← paste your keys here
  db.js                 talks to Supabase
  styles.css            shared look & feel (Arogya City colours)
  logo-main.png         Arogya City Bengaluru lockup
  logo-partners.png     Rotary · Arogya World · B.PAC strip
supabase-setup.sql      run once in Supabase to build the backend
```

## If something doesn't work
- Blank form / "couldn't find that pledge" → check the `?t=` token matches one in your `pledges` table, and that `config.js` has the right URL + anon key.
- Dashboard empty → same key check; open the browser console (F12) for the exact error.
- Uploads fail → make sure Step 1's SQL ran fully (it creates the `pledge-evidence` bucket and its policies).
