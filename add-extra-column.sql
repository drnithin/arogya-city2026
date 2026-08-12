-- ============================================================
--  MIGRATION · adds the "extra" column for story & impact data
--  (partnerships, innovations, more-than-pledged, consent, evidence)
--  Run this ONCE in Supabase SQL Editor. Safe to re-run.
-- ============================================================

alter table submissions
  add column if not exists extra jsonb default '{}'::jsonb;

-- that's it. The pledge form now saves the Story & Impact answers here.
