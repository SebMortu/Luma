-- ============================================
-- LUMA — Suivi des fiches de grammaire consultées (pour la carte "Reprendre")
-- ============================================

create table user_grammar_fiche_views (
  user_id uuid not null references auth.users(id) on delete cascade,
  fiche_id uuid not null references grammar_fiches(id) on delete cascade,
  viewed_at timestamptz not null default now(),
  primary key (user_id, fiche_id)
);

alter table user_grammar_fiche_views enable row level security;
create policy "Users manage their own grammar fiche views"
  on user_grammar_fiche_views for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
