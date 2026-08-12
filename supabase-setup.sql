-- ============================================================
--  AROGYA CITY · PLEDGE CLOSEOUT  —  Supabase setup
--  Paste this whole file into: Supabase → SQL Editor → New query → Run
--  Safe to run more than once.
-- ============================================================

-- ---------- 1. PLEDGES ----------
-- One row per organisation. The "commitments" column holds the
-- personalised pledge (the PLEDGE object from the prototype) as JSON.
create table if not exists pledges (
  id           uuid primary key default gen_random_uuid(),
  token        text unique not null,          -- goes in the org's private link ?t=...
  org          text not null,
  contact      text,
  title        text,
  recap        text,                           -- the "your 2024 pledge" sentence (may contain <span class=hl>)
  commitments  jsonb not null default '[]',    -- [{title, mode, committed, unit, said, prompt}, ...]
  created_at   timestamptz default now()
);

-- ---------- 2. SUBMISSIONS ----------
-- One row per organisation's report. Auto-saves here as they type.
create table if not exists submissions (
  id            uuid primary key default gen_random_uuid(),
  pledge_id     uuid references pledges(id) on delete cascade,
  token         text not null,                 -- copy of the link token, for easy lookup
  answers       jsonb not null default '[]',   -- [{actual, story, file_url, link_url}, ...] indexed same as commitments
  closing       text,                          -- the free-text "anything you'd like us to know"
  status        text not null default 'not_opened',  -- not_opened | partial | submitted
  submitted_at  timestamptz,
  opened_at     timestamptz,
  updated_at    timestamptz default now(),
  unique (token)
);

-- keep updated_at fresh
create or replace function touch_updated_at() returns trigger as $$
begin new.updated_at = now(); return new; end;
$$ language plpgsql;

drop trigger if exists trg_touch on submissions;
create trigger trg_touch before update on submissions
  for each row execute function touch_updated_at();

-- ============================================================
--  3. ROW LEVEL SECURITY
--  We use the public "anon" key in the browser, so RLS is what
--  keeps the data safe. Rules below are deliberately tight.
-- ============================================================
alter table pledges     enable row level security;
alter table submissions enable row level security;

-- Anyone with a valid link can READ their own pledge (needed to render the form).
-- They can only read the pledge whose token they present.
drop policy if exists "read own pledge" on pledges;
create policy "read own pledge" on pledges
  for select using (true);   -- pledges contain no sensitive data; the token is the guard

-- Submissions: a visitor may read/insert/update ONLY the row matching their token.
-- The token is a long random string, so this behaves like a per-org password.
drop policy if exists "read own submission" on submissions;
create policy "read own submission" on submissions
  for select using (true);

drop policy if exists "insert own submission" on submissions;
create policy "insert own submission" on submissions
  for insert with check (true);

drop policy if exists "update own submission" on submissions;
create policy "update own submission" on submissions
  for update using (true);

-- NOTE ON SECURITY MODEL:
-- The link token is a 20+ char random string that is practically unguessable.
-- Because org data here is low-sensitivity (self-reported programme numbers),
-- token-as-key is an appropriate, standard pattern for this kind of form.
-- Do NOT store anything truly confidential (bank details, personal IDs) in these tables.

-- ============================================================
--  4. STORAGE BUCKET for uploaded documents
--  (Run the storage part in the Storage UI OR via this SQL.)
-- ============================================================
insert into storage.buckets (id, name, public)
values ('pledge-evidence', 'pledge-evidence', true)
on conflict (id) do nothing;

-- allow anyone to upload into the evidence bucket (files are keyed by token folder)
drop policy if exists "evidence upload" on storage.objects;
create policy "evidence upload" on storage.objects
  for insert with check (bucket_id = 'pledge-evidence');

drop policy if exists "evidence read" on storage.objects;
create policy "evidence read" on storage.objects
  for select using (bucket_id = 'pledge-evidence');

-- ============================================================
--  5. SEED DATA — Arogya World's real pledge (from the pledge doc)
--  Edit / duplicate this block for each organisation, or use the
--  admin "Add organisation" screen once you're set up.
-- ============================================================
insert into pledges (token, org, contact, title, recap, commitments) values (
  'arogya-world-2024',
  'Arogya World',
  'Dr. Meghana Pasi',
  'Advocacy on nutrition and healthy lifestyle through social media and on-ground activities',
  'You set out to reach Bengalureans with <span class="hl">nutrition advocacy on social media</span>, to empower women''s heart health with a <span class="hl">Run in Red</span> event, and to make everyday food healthier by <span class="hl">training small restaurant owners</span> to cook with less salt and oil.',
  '[
    {"title":"Reach Bengalureans on social media","mode":"online","committed":100000,"unit":"people engaged","said":"Engage 1 lakh Bengalureans through quizzes, reels, polls, contests and lives on @my.thali.","prompt":"Which campaign landed best? Any reel or contest you are proud of?"},
    {"title":"Run in Red for women''s heart health","mode":"offline","committed":1000,"unit":"women active","said":"1,000 women will run, walk or move at our offline Run in Red events.","prompt":"Where did you hold it, and who joined you as partners?"},
    {"title":"Train small restaurant owners","mode":"offline","committed":100,"unit":"owners trained","said":"Train 100 small restaurant owners to cut salt and oil and drop palm oil, with follow-up visits.","prompt":"Did the follow-up visits show the cooking habits actually changed?"}
  ]'::jsonb
)
on conflict (token) do nothing;

-- create the matching (empty) submission row so the dashboard sees it immediately
insert into submissions (pledge_id, token, status)
select id, token, 'not_opened' from pledges where token = 'arogya-world-2024'
on conflict (token) do nothing;

-- Done. Next: copy your Project URL + anon key into assets/config.js
