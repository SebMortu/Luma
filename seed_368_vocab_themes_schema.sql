-- ============================================
-- LUMA — Nouvelle section : Vocabulaire par thème
-- Contrairement au parcours principal (strictement organisé par niveau
-- CECRL), ces thèmes mélangent volontairement les niveaux de difficulté —
-- l'idée est de laisser l'utilisateur explorer un sujet qui l'intéresse,
-- pas de suivre une progression stricte.
-- ============================================

create table vocab_themes (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  slug text not null unique,
  title text not null,
  icon text not null,
  position integer not null,
  words jsonb not null default '[]'  -- [{en, fr, level}]
);

create index vocab_themes_language_id_idx on vocab_themes(language_id);

alter table vocab_themes enable row level security;
create policy "Vocab themes are viewable by everyone"
  on vocab_themes for select using (true);

create table vocab_theme_exercises (
  id uuid primary key default gen_random_uuid(),
  theme_id uuid not null references vocab_themes(id) on delete cascade,
  position integer not null,
  type text not null check (type in ('qcm', 'fill_blank', 'true_false', 'matching')),
  content jsonb not null
);

create index vocab_theme_exercises_theme_id_idx on vocab_theme_exercises(theme_id);

alter table vocab_theme_exercises enable row level security;
create policy "Vocab theme exercises are viewable by everyone"
  on vocab_theme_exercises for select using (true);

-- Suivi léger de complétion (cohérent avec le reste de l'app, un peu d'XP)
create table user_vocab_theme_practice (
  user_id uuid not null references auth.users(id) on delete cascade,
  theme_id uuid not null references vocab_themes(id) on delete cascade,
  completed_at timestamptz not null default now(),
  primary key (user_id, theme_id)
);

alter table user_vocab_theme_practice enable row level security;
create policy "Users manage their own vocab theme practice records"
  on user_vocab_theme_practice for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Les 10 thèmes de départ
insert into vocab_themes (language_id, slug, title, icon, position, words)
select id, v.slug, v.title, v.icon, v.position, '[]'::jsonb
from languages, (values
  ('cuisine', 'Cuisine & Nourriture', '🍳', 1),
  ('technologie', 'Technologie', '💻', 2),
  ('sport', 'Sport', '⚽', 3),
  ('voyage', 'Voyage', '✈️', 4),
  ('nature', 'Nature & Environnement', '🌿', 5),
  ('mode', 'Mode & Shopping', '👗', 6),
  ('sante', 'Santé & Corps', '🩺', 7),
  ('travail', 'Travail & Bureau', '💼', 8),
  ('maison', 'Maison & Déco', '🏠', 9),
  ('emotions', 'Émotions & Caractère', '😊', 10)
) as v(slug, title, icon, position)
where languages.code = 'en';
