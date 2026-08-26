-- ============================================
-- LUMA — Streak freeze : protège la série en cas de jour manqué
-- Principe : 1 gel gagné automatiquement tous les 7 jours de série
-- consécutifs (max 2 en stock), consommé automatiquement si exactement
-- un jour est manqué. Aucune monnaie virtuelle à gérer.
-- ============================================

alter table user_settings add column if not exists streak_freezes integer not null default 0;
alter table user_settings add column if not exists last_freeze_milestone integer not null default 0; -- évite de re-donner un gel pour le même palier de 7 jours

create or replace function award_progress(
  p_user_id uuid,
  p_xp_gained integer,
  p_seconds_spent integer default 0
) returns table(
  xp_gained integer,
  new_streak integer,
  new_total_xp integer,
  goal_met_now boolean,
  xp_today integer,
  threshold integer,
  freeze_used boolean,
  freeze_gained boolean,
  streak_freezes integer
) as $$
declare
  v_settings user_settings%rowtype;
  v_today date := current_date;
  v_yesterday date := current_date - 1;
  v_day_before_yesterday date := current_date - 2;
  v_xp_today_so_far integer;
  v_xp_today integer;
  v_threshold integer;
  v_goal_met_now boolean;
  v_already_counted boolean;
  v_new_streak integer;
  v_new_last_activity date;
  v_new_longest integer;
  v_new_total_xp integer;
  v_freeze_used boolean := false;
  v_freeze_gained boolean := false;
  v_new_freezes integer;
  v_new_milestone integer;
begin
  if auth.uid() is distinct from p_user_id then
    raise exception 'Non autorisé';
  end if;

  select * into v_settings from user_settings where user_id = p_user_id for update;

  v_xp_today_so_far := case when v_settings.xp_today_date = v_today then v_settings.xp_gained_today else 0 end;
  v_xp_today := v_xp_today_so_far + p_xp_gained;
  v_threshold := coalesce(v_settings.daily_goal_minutes, 10) * 6;
  v_goal_met_now := v_xp_today >= v_threshold;
  v_already_counted := v_settings.last_activity_date is not distinct from v_today;

  v_new_streak := coalesce(v_settings.current_streak, 0);
  v_new_last_activity := v_settings.last_activity_date;
  v_new_freezes := coalesce(v_settings.streak_freezes, 0);
  v_new_milestone := coalesce(v_settings.last_freeze_milestone, 0);

  if v_goal_met_now and not v_already_counted then
    if v_settings.last_activity_date is not distinct from v_yesterday then
      -- Jour consécutif normal
      v_new_streak := coalesce(v_settings.current_streak, 0) + 1;
    elsif v_settings.last_activity_date is not distinct from v_day_before_yesterday and v_new_freezes > 0 then
      -- Exactement un jour manqué, et un gel est disponible -> on le consomme,
      -- la série continue comme si de rien n'était.
      v_new_streak := coalesce(v_settings.current_streak, 0) + 1;
      v_new_freezes := v_new_freezes - 1;
      v_freeze_used := true;
    else
      -- Trop de jours manqués, ou pas de gel disponible -> la série repart de 1
      v_new_streak := 1;
      v_new_milestone := 0;
    end if;
    v_new_last_activity := v_today;

    -- Gagne un nouveau gel tous les 7 jours de série (max 2 en stock)
    if v_new_streak >= v_new_milestone + 7 and v_new_freezes < 2 then
      v_new_freezes := v_new_freezes + 1;
      v_new_milestone := v_new_milestone + 7;
      v_freeze_gained := true;
    end if;
  end if;

  v_new_longest := greatest(coalesce(v_settings.longest_streak, 0), v_new_streak);
  v_new_total_xp := coalesce(v_settings.total_xp, 0) + p_xp_gained;

  update user_settings set
    total_xp = v_new_total_xp,
    xp_gained_today = v_xp_today,
    xp_today_date = v_today,
    current_streak = v_new_streak,
    longest_streak = v_new_longest,
    last_activity_date = v_new_last_activity,
    streak_freezes = v_new_freezes,
    last_freeze_milestone = v_new_milestone,
    total_learning_seconds = coalesce(total_learning_seconds, 0) + p_seconds_spent,
    updated_at = now()
  where user_id = p_user_id;

  return query select p_xp_gained, v_new_streak, v_new_total_xp, v_goal_met_now, v_xp_today, v_threshold,
    v_freeze_used, v_freeze_gained, v_new_freezes;
end;
$$ language plpgsql security definer;

grant execute on function award_progress(uuid, integer, integer) to authenticated;
