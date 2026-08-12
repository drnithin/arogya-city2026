-- ============================================================
--  MIGRATION · adds "sent_at" for follow-up tracking
--  Records when you sent each org their link, so the dashboard
--  can flag who needs chasing.
--  Run ONCE in Supabase SQL Editor. Safe to re-run.
-- ============================================================

alter table submissions
  add column if not exists sent_at timestamptz;

-- that's it. Use the "Mark sent" button on the dashboard after you
-- email an org their link, and the follow-up flags start counting.
