-- ============================================
-- LUMA — Exercices pratiques pour la bibliothèque de grammaire
-- Jusqu'ici, les 36 fiches n'étaient que de la lecture, sans mise en pratique.
-- Types réutilisés : qcm, fill_blank, true_false, reorder (composants déjà
-- existants et éprouvés) + nouveau type "error_correction" (le classique
-- exercice scolaire "trouve et corrige l'erreur").
-- ============================================

create table grammar_fiche_exercises (
  id uuid primary key default gen_random_uuid(),
  fiche_id uuid not null references grammar_fiches(id) on delete cascade,
  position integer not null,
  type text not null check (type in ('qcm', 'fill_blank', 'true_false', 'reorder', 'error_correction')),
  content jsonb not null
);

create index grammar_fiche_exercises_fiche_id_idx on grammar_fiche_exercises(fiche_id);

alter table grammar_fiche_exercises enable row level security;

create policy "Grammar fiche exercises are viewable by everyone"
  on grammar_fiche_exercises for select
  using (true);

-- Suivi léger de complétion (pour afficher "déjà fait" et donner un peu d'XP,
-- cohérent avec le reste de l'app — sans complexifier avec un système de score)
create table user_grammar_practice (
  user_id uuid not null references auth.users(id) on delete cascade,
  fiche_id uuid not null references grammar_fiches(id) on delete cascade,
  completed_at timestamptz not null default now(),
  primary key (user_id, fiche_id)
);

alter table user_grammar_practice enable row level security;

create policy "Users manage their own grammar practice records"
  on user_grammar_practice for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
