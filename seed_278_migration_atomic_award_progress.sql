-- ============================================
-- LUMA — Migration : award_progress atomique (corrige la race condition)
-- ============================================

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
  threshold integer
) as $$
declare
  v_settings user_settings%rowtype;
  v_today date := current_date;
  v_yesterday date := current_date - 1;
  v_xp_today_so_far integer;
  v_xp_today integer;
  v_threshold integer;
  v_goal_met_now boolean;
  v_already_counted boolean;
  v_new_streak integer;
  v_new_last_activity date;
  v_new_longest integer;
  v_new_total_xp integer;
begin
  if auth.uid() is distinct from p_user_id then
    raise exception 'Non autorisé';
  end if;

  -- Verrou de ligne : toute autre transaction concurrente sur ce même
  -- utilisateur attend ici, ce qui élimine la race condition lire-puis-écrire.
  select * into v_settings from user_settings where user_id = p_user_id for update;

  v_xp_today_so_far := case when v_settings.xp_today_date = v_today then v_settings.xp_gained_today else 0 end;
  v_xp_today := v_xp_today_so_far + p_xp_gained;
  v_threshold := coalesce(v_settings.daily_goal_minutes, 10) * 6;
  v_goal_met_now := v_xp_today >= v_threshold;
  v_already_counted := v_settings.last_activity_date = v_today;

  v_new_streak := v_settings.current_streak;
  v_new_last_activity := v_settings.last_activity_date;

  if v_goal_met_now and not v_already_counted then
    if v_settings.last_activity_date = v_yesterday then
      v_new_streak := v_settings.current_streak + 1;
    else
      v_new_streak := 1;
    end if;
    v_new_last_activity := v_today;
  end if;

  v_new_longest := greatest(v_settings.longest_streak, v_new_streak);
  v_new_total_xp := v_settings.total_xp + p_xp_gained;

  update user_settings set
    total_xp = v_new_total_xp,
    xp_gained_today = v_xp_today,
    xp_today_date = v_today,
    current_streak = v_new_streak,
    longest_streak = v_new_longest,
    last_activity_date = v_new_last_activity,
    total_learning_seconds = total_learning_seconds + p_seconds_spent,
    updated_at = now()
  where user_id = p_user_id;

  return query select p_xp_gained, v_new_streak, v_new_total_xp, v_goal_met_now, v_xp_today, v_threshold;
end;
$$ language plpgsql security definer;

grant execute on function award_progress(uuid, integer, integer) to authenticated;
