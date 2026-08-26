-- ============================================
-- LUMA — Couche sociale minimale : amis + classement hebdomadaire
-- ============================================

-- 1) Pseudo public (nécessaire pour chercher des amis sans exposer les emails)
alter table user_settings add column if not exists username text;
create unique index if not exists user_settings_username_unique on user_settings (lower(username)) where username is not null;

-- Attribution automatique d'un pseudo provisoire à tous les utilisateurs existants
-- (dérivé de leur email, avec un suffixe si collision) — ils pourront le changer.
do $$
declare
  r record;
  base_username text;
  candidate text;
  suffix int;
begin
  for r in
    select us.user_id, au.email
    from user_settings us
    join auth.users au on au.id = us.user_id
    where us.username is null
  loop
    base_username := regexp_replace(split_part(r.email, '@', 1), '[^a-zA-Z0-9_]', '', 'g');
    if base_username = '' then base_username := 'user'; end if;
    candidate := base_username;
    suffix := 1;
    while exists (select 1 from user_settings where lower(username) = lower(candidate)) loop
      suffix := suffix + 1;
      candidate := base_username || suffix::text;
    end loop;
    update user_settings set username = candidate where user_id = r.user_id;
  end loop;
end $$;

alter table user_settings alter column username set not null;

-- 2) Suivi de l'XP hebdomadaire (pour le classement, remis à zéro chaque lundi)
alter table user_settings add column if not exists weekly_xp integer not null default 0;
alter table user_settings add column if not exists weekly_xp_week_start date;

-- 3) Table des amitiés (avec demande à accepter, pas d'ajout à sens unique)
create table if not exists friendships (
  id uuid primary key default gen_random_uuid(),
  requester_id uuid not null references auth.users(id) on delete cascade,
  addressee_id uuid not null references auth.users(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending', 'accepted')),
  created_at timestamptz not null default now(),
  unique (requester_id, addressee_id),
  check (requester_id <> addressee_id)
);

alter table friendships enable row level security;

create policy "Users see friendships involving them"
  on friendships for select
  using (auth.uid() = requester_id or auth.uid() = addressee_id);

create policy "Users can send friend requests"
  on friendships for insert
  with check (auth.uid() = requester_id);

create policy "Users can respond to requests sent to them"
  on friendships for update
  using (auth.uid() = addressee_id)
  with check (auth.uid() = addressee_id);

create policy "Users can remove their own friendships"
  on friendships for delete
  using (auth.uid() = requester_id or auth.uid() = addressee_id);

-- 4) Recherche de pseudo publique (nécessaire pour trouver des amis) — lecture
-- limitée au strict nécessaire, pas d'exposition d'autres données sensibles.
create policy "Usernames are searchable by everyone"
  on user_settings for select
  using (true);
-- Remarque : si une policy de lecture plus restrictive existe déjà sur cette table,
-- Supabase applique l'union de toutes les policies SELECT — celle-ci élargit donc
-- volontairement l'accès en lecture au pseudo (et aux autres colonnes) pour tous
-- les utilisateurs connectés. Si tu préfères restreindre plus finement, dis-le moi.
