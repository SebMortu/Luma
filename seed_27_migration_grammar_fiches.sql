-- ============================================
-- LUMA — Migration : module Grammaire libre
-- ============================================

create table grammar_fiches (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  cecr_level text not null,
  position integer not null,
  title text not null,
  content jsonb not null default '{}',
  created_at timestamptz not null default now()
);

alter table grammar_fiches enable row level security;
create policy "public read grammar_fiches" on grammar_fiches for select using (true);
grant select on grammar_fiches to anon, authenticated;
