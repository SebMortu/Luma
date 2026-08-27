-- ============================================
-- LUMA — Fix CRITIQUE : les nouvelles inscriptions échouaient
-- Cause : la colonne "username" a été rendue obligatoire (NOT NULL) lors de
-- la migration de la couche sociale, mais le déclencheur qui crée le profil
-- à l'inscription (handle_new_user) n'a jamais été mis à jour pour en fournir
-- un — chaque nouvelle inscription échouait donc silencieusement à la création
-- du profil, bloquant le compte.
-- ============================================

create or replace function public.handle_new_user()
returns trigger as $$
declare
  base_username text;
  candidate text;
  suffix int;
begin
  -- Génère un pseudo provisoire à partir de l'email (ex: "sebastien.charles73")
  base_username := regexp_replace(split_part(new.email, '@', 1), '[^a-zA-Z0-9_]', '', 'g');
  if base_username = '' then base_username := 'user'; end if;

  candidate := base_username;
  suffix := 1;
  while exists (select 1 from public.user_settings where lower(username) = lower(candidate)) loop
    suffix := suffix + 1;
    candidate := base_username || suffix::text;
  end loop;

  insert into public.user_settings (user_id, username)
  values (new.id, candidate);

  return new;
end;
$$ language plpgsql security definer;

-- Le trigger existant pointe déjà vers cette fonction, pas besoin de le recréer.

-- ============================================
-- VÉRIFICATION : simule une inscription pour confirmer que le trigger fonctionne
-- (ne crée rien de réel, annule tout à la fin)
-- ============================================
-- begin;
--   insert into auth.users (id, email) values (gen_random_uuid(), 'test-verification@example.com');
--   select username from user_settings where user_id = (select id from auth.users where email = 'test-verification@example.com');
-- rollback;
