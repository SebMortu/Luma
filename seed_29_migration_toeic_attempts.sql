-- ============================================
-- LUMA — Migration : historique des tests type examen
-- ============================================

create table user_toeic_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  toeic_test_id uuid not null references toeic_tests(id) on delete cascade,
  raw_score integer not null,
  max_score integer not null,
  estimated_score integer not null,
  cecr_level_estimate text not null,
  created_at timestamptz not null default now()
);

alter table user_toeic_attempts enable row level security;
create policy "user manages own toeic attempts" on user_toeic_attempts
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
grant all on user_toeic_attempts to authenticated;
