-- ============================================
-- LUMA — Schéma de base de données initial
-- À exécuter dans Supabase → SQL Editor → New query
-- ============================================

-- Extension nécessaire pour générer des UUID
create extension if not exists "pgcrypto";

-- ============================================
-- 1. CONTENU DE RÉFÉRENCE (lecture publique, écriture jamais depuis le client)
-- ============================================

create table languages (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,              -- 'en', 'it', 'es', 'de', 'ja', 'ar', 'pt', 'zh', 'ru', 'ko'
  name text not null,                     -- 'Anglais', 'Italien'...
  script_direction text not null default 'ltr',  -- 'ltr' ou 'rtl'
  is_tonal boolean not null default false,
  created_at timestamptz not null default now()
);

create table units (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  cecr_level text not null,               -- 'A1', 'A2', 'B1', 'B2', 'C1'
  position integer not null,              -- ordre d'affichage (1 à 36)
  title text not null,
  created_at timestamptz not null default now()
);

create table lessons (
  id uuid primary key default gen_random_uuid(),
  unit_id uuid not null references units(id) on delete cascade,
  position integer not null,
  title text not null,
  content jsonb not null default '{}',    -- règle, exemple, vocabulaire
  created_at timestamptz not null default now()
);

create table exercises (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references lessons(id) on delete cascade,
  type text not null,                     -- 'qcm', 'fill_blank', 'true_false', 'matching', 'reorder', 'flashcard', 'timed_challenge', 'dialogue_choice'
  position integer not null,
  content jsonb not null default '{}',
  is_hybrid boolean not null default false, -- true = prévu pour usage IA en V2, inactif en V1
  created_at timestamptz not null default now()
);

create table irregular_verbs (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  base_form text not null,
  past_form text not null,
  participle_form text not null,
  family text,                            -- groupe de mémorisation (voir module verbes irréguliers)
  translation text not null,
  is_priority boolean not null default false, -- fait partie du "top 30"
  created_at timestamptz not null default now()
);

create table scenario_themes (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  category text not null,                 -- 'quotidien', 'fantastique', 'culture', 'pays'
  title text not null,                    -- 'Restaurant', 'Donjons & dragons'...
  position integer not null,
  created_at timestamptz not null default now()
);

create table scenarios (
  id uuid primary key default gen_random_uuid(),
  theme_id uuid not null references scenario_themes(id) on delete cascade,
  format text not null,                   -- 'court', 'moyen', 'long'
  cecr_level text not null,
  title text not null,
  content jsonb not null default '{}',    -- personnages, synopsis, arbre de dialogue
  created_at timestamptz not null default now()
);

create table toeic_tests (
  id uuid primary key default gen_random_uuid(),
  language_id uuid not null references languages(id) on delete cascade,
  title text not null,
  questions jsonb not null default '[]',
  created_at timestamptz not null default now()
);

-- ============================================
-- 2. DONNÉES UTILISATEUR (lecture/écriture uniquement par le propriétaire)
-- ============================================

create table user_settings (
  user_id uuid primary key references auth.users(id) on delete cascade,
  active_language_id uuid references languages(id),
  level text,                             -- niveau choisi à l'onboarding
  objective text,                         -- 'voyage', 'travail', 'culture', 'perso'
  daily_goal_minutes integer default 10,
  current_streak integer not null default 0,
  longest_streak integer not null default 0,
  last_activity_date date,
  total_xp integer not null default 0,
  updated_at timestamptz not null default now()
);

create table user_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  language_id uuid not null references languages(id) on delete cascade,
  unit_id uuid not null references units(id) on delete cascade,
  lesson_id uuid references lessons(id) on delete cascade,
  status text not null default 'not_started', -- 'not_started', 'in_progress', 'completed'
  best_score numeric,
  updated_at timestamptz not null default now(),
  unique (user_id, language_id, unit_id, lesson_id)
);

create table user_review_queue (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  item_type text not null,                -- 'grammar_point', 'irregular_verb', 'vocabulary'
  item_id uuid not null,
  next_review_date date not null,
  success_streak integer not null default 0, -- nombre de réussites consécutives ≥90%
  interval_days integer not null default 3,
  created_at timestamptz not null default now()
);

create table push_subscriptions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  endpoint text not null,
  keys jsonb not null,
  created_at timestamptz not null default now()
);

-- ============================================
-- 3. SÉCURITÉ — Row Level Security (RLS)
-- ============================================

-- Contenu de référence : lecture publique pour tout le monde (connecté ou non)
alter table languages enable row level security;
alter table units enable row level security;
alter table lessons enable row level security;
alter table exercises enable row level security;
alter table irregular_verbs enable row level security;
alter table scenario_themes enable row level security;
alter table scenarios enable row level security;
alter table toeic_tests enable row level security;

create policy "public read languages" on languages for select using (true);
create policy "public read units" on units for select using (true);
create policy "public read lessons" on lessons for select using (true);
create policy "public read exercises" on exercises for select using (true);
create policy "public read irregular_verbs" on irregular_verbs for select using (true);
create policy "public read scenario_themes" on scenario_themes for select using (true);
create policy "public read scenarios" on scenarios for select using (true);
create policy "public read toeic_tests" on toeic_tests for select using (true);

-- Données utilisateur : chacun ne voit et ne modifie que ses propres données
alter table user_settings enable row level security;
alter table user_progress enable row level security;
alter table user_review_queue enable row level security;
alter table push_subscriptions enable row level security;

create policy "user manages own settings" on user_settings
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "user manages own progress" on user_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "user manages own review queue" on user_review_queue
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "user manages own push subscriptions" on push_subscriptions
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- ============================================
-- 4. PERMISSIONS DE BASE (évite les erreurs 403 rencontrées sur FIT/SCAN)
-- ============================================

grant usage on schema public to anon, authenticated;
grant select on languages, units, lessons, exercises, irregular_verbs, scenario_themes, scenarios, toeic_tests to anon, authenticated;
grant all on user_settings, user_progress, user_review_queue, push_subscriptions to authenticated;

-- ============================================
-- 5. CRÉATION AUTOMATIQUE DU PROFIL À L'INSCRIPTION
-- ============================================

create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.user_settings (user_id)
  values (new.id);
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
