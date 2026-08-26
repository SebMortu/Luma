-- ============================================
-- LUMA — Signalement de contenu par les utilisateurs
-- ============================================

create table if not exists content_reports (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  content_type text not null,        -- 'exercise', 'book_page', 'scenario', etc.
  content_id uuid,                   -- id de l'exercice/leçon concerné (nullable si non applicable)
  lesson_title text,                 -- contexte lisible directement, sans jointure nécessaire
  question_snippet text,             -- extrait du contenu concerné, pour identifier le problème sans reproduire
  category text not null,            -- 'grammaire', 'traduction', 'confus', 'bug', 'autre'
  comment text,
  status text not null default 'open' check (status in ('open', 'reviewed', 'resolved')),
  created_at timestamptz not null default now()
);

alter table content_reports enable row level security;

create policy "Users can submit their own reports"
  on content_reports for insert
  with check (auth.uid() = user_id);

create policy "Users can see their own reports"
  on content_reports for select
  using (auth.uid() = user_id);

-- Remarque : pas de policy de lecture "admin" ici — pour consulter tous les
-- signalements, utilise directement l'éditeur de table Supabase (accès
-- service_role, qui contourne RLS). Si tu veux un vrai tableau de bord
-- d'administration dans l'app plus tard, dis-le moi.
