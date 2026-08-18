-- ============================================
-- LUMA — Migration : suivi des fins de scénario découvertes
-- ============================================

create table user_scenario_endings (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  scenario_id uuid not null references scenarios(id) on delete cascade,
  ending_label text not null,
  first_reached_at timestamptz not null default now(),
  unique (user_id, scenario_id, ending_label)
);

alter table user_scenario_endings enable row level security;

create policy "Users can view their own scenario endings" on user_scenario_endings
  for select using (auth.uid() = user_id);
create policy "Users can insert their own scenario endings" on user_scenario_endings
  for insert with check (auth.uid() = user_id);
