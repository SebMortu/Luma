-- ============================================
-- LUMA — Reprendre un scénario en cours de route
-- Sauvegarde le nœud courant et l'historique du dialogue ; supprimée dès que
-- le scénario est terminé (une fin atteinte), puisqu'il n'y a alors plus
-- rien à reprendre.
-- ============================================

create table user_scenario_sessions (
  user_id uuid not null references auth.users(id) on delete cascade,
  scenario_id uuid not null references scenarios(id) on delete cascade,
  current_node_id text not null,
  history jsonb not null default '[]',
  updated_at timestamptz not null default now(),
  primary key (user_id, scenario_id)
);

alter table user_scenario_sessions enable row level security;
create policy "Users manage their own scenario sessions"
  on user_scenario_sessions for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
