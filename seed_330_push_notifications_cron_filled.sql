-- ============================================
-- LUMA — Notifications push (2/2) : programmation quotidienne
-- Rempli avec les valeurs réelles du projet.
-- ============================================

create extension if not exists pg_cron;
create extension if not exists pg_net;

-- Déclenche l'envoi tous les jours à 18h00 UTC (~20h heure française en été).
select cron.schedule(
  'luma-daily-reminders',
  '0 18 * * *',
  $$
  select net.http_post(
    url := 'https://ftitirerjnpagewgnmne.supabase.co/functions/v1/send-daily-reminders',
    headers := jsonb_build_object(
      'Authorization', 'Bearer sb_secret_0xAWX-dS-aYzFopAvd5slg_1DZV4jie',
      'Content-Type', 'application/json'
    )
  );
  $$
);

-- Pour vérifier que la tâche est bien programmée :
-- select * from cron.job;

-- Pour la supprimer si besoin :
-- select cron.unschedule('luma-daily-reminders');
