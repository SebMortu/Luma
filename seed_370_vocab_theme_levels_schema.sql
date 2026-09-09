-- ============================================
-- LUMA — Restructuration : "Niveaux" au sein de chaque thème de vocabulaire
-- Avant : chaque thème avait une seule longue liste de mots (~16).
-- Maintenant : chaque thème contient plusieurs niveaux, chacun avec ~20 mots
-- et ses propres exercices — plus digeste, permet d'ajouter du contenu à
-- volonté sans jamais avoir une liste interminable.
-- Le contenu existant devient automatiquement "Niveau 1" de chaque thème,
-- rien n'est perdu.
-- ============================================

create table vocab_theme_levels (
  id uuid primary key default gen_random_uuid(),
  theme_id uuid not null references vocab_themes(id) on delete cascade,
  position integer not null,
  title text not null,
  words jsonb not null default '[]'
);

create index vocab_theme_levels_theme_id_idx on vocab_theme_levels(theme_id);

alter table vocab_theme_levels enable row level security;
create policy "Vocab theme levels are viewable by everyone"
  on vocab_theme_levels for select using (true);

-- Ajoute la référence de niveau aux exercices (en plus de theme_id, gardé
-- pour l'instant pour ne rien casser pendant la transition)
alter table vocab_theme_exercises add column if not exists level_id uuid references vocab_theme_levels(id) on delete cascade;

-- Migration des données existantes : chaque thème -> "Niveau 1"
insert into vocab_theme_levels (theme_id, position, title, words)
select id, 1, 'Niveau 1', words from vocab_themes;

-- Rattache les exercices existants à ce "Niveau 1" nouvellement créé
update vocab_theme_exercises ve
set level_id = vl.id
from vocab_theme_levels vl
where vl.theme_id = ve.theme_id and vl.position = 1;

-- Suivi de complétion : passe du thème au niveau (plus précis)
create table user_vocab_level_practice (
  user_id uuid not null references auth.users(id) on delete cascade,
  level_id uuid not null references vocab_theme_levels(id) on delete cascade,
  completed_at timestamptz not null default now(),
  primary key (user_id, level_id)
);
alter table user_vocab_level_practice enable row level security;
create policy "Users manage their own vocab level practice records"
  on user_vocab_level_practice for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
