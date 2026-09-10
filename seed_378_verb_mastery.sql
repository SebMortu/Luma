-- ============================================
-- LUMA — Maîtrise par verbe irrégulier
-- "Maîtrisé" = 3 bonnes réponses d'affilée sur ce verbe, tous modes
-- d'entraînement confondus (liste exclue, qui n'interroge pas). Une fois
-- atteint, le verbe reste "maîtrisé" même après une erreur ultérieure — le
-- badge représente une compétence démontrée, pas un état à préserver en
-- continu. La série (correct_streak) continue elle d'évoluer normalement.
-- ============================================

create table user_verb_mastery (
  user_id uuid not null references auth.users(id) on delete cascade,
  verb_id uuid not null references irregular_verbs(id) on delete cascade,
  correct_streak integer not null default 0,
  mastered boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (user_id, verb_id)
);

alter table user_verb_mastery enable row level security;
create policy "Users manage their own verb mastery"
  on user_verb_mastery for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
