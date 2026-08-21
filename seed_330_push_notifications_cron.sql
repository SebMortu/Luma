-- ============================================
-- LUMA — Notifications push (2/2) : programmation quotidienne
-- À exécuter APRÈS avoir déployé la fonction Edge "send-daily-reminders"
-- (voir instructions de déploiement fournies séparément).
-- ============================================

create extension if not exists pg_cron;
create extension if not exists pg_net;

-- Déclenche l'envoi tous les jours à 18h00 UTC (~20h heure française en été).
-- Remplace l'URL par l'URL réelle de ton projet Supabase (Project Settings -> API).
select cron.schedule(
  'luma-daily-reminders',
  '0 18 * * *',
  $$
  select net.http_post(
    url := 'https://TON-PROJET.supabase.co/functions/v1/send-daily-reminders',
    headers := jsonb_build_object(
      'Authorization', 'Bearer TA_SERVICE_ROLE_KEY',
      'Content-Type', 'application/json'
    )
  );
  $$
);

-- Pour vérifier que la tâche est bien programmée :
-- select * from cron.job;

-- Pour la supprimer si besoin :
-- select cron.unschedule('luma-daily-reminders');
