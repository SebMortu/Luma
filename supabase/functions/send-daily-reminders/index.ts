// Fonction Edge Supabase — envoie un rappel push aux utilisateurs qui n'ont
// pas encore atteint leur objectif quotidien d'XP, et qui sont abonnés aux
// notifications. Prévue pour être appelée une fois par jour via pg_cron
// (voir seed_330_push_notifications_cron.sql), typiquement en fin d'après-midi.

import webpush from 'npm:web-push@3.6.7'
import { createClient } from 'npm:@supabase/supabase-js@2'

const VAPID_PUBLIC_KEY = Deno.env.get('VAPID_PUBLIC_KEY')!
const VAPID_PRIVATE_KEY = Deno.env.get('VAPID_PRIVATE_KEY')!
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

webpush.setVapidDetails('mailto:contact@luma-app.example', VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY)

Deno.serve(async (req) => {
  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)
  const today = new Date().toISOString().slice(0, 10)

  // Utilisateurs n'ayant pas atteint leur objectif du jour (ou n'ayant rien
  // fait aujourd'hui), avec au moins un abonnement push actif.
  const { data: settingsRows, error: settingsErr } = await supabase
    .from('user_settings')
    .select('user_id, daily_goal_minutes, xp_gained_today, xp_today_date')

  if (settingsErr) {
    return new Response(JSON.stringify({ error: settingsErr.message }), { status: 500 })
  }

  const usersToRemind = (settingsRows || []).filter((s) => {
    const todayXp = s.xp_today_date === today ? (s.xp_gained_today || 0) : 0
    const threshold = (s.daily_goal_minutes || 10) * 6
    return todayXp < threshold
  }).map((s) => s.user_id)

  if (usersToRemind.length === 0) {
    return new Response(JSON.stringify({ sent: 0, message: 'Personne à relancer aujourd\'hui.' }), { status: 200 })
  }

  const { data: subscriptions, error: subsErr } = await supabase
    .from('push_subscriptions')
    .select('id, user_id, endpoint, keys')
    .in('user_id', usersToRemind)

  if (subsErr) {
    return new Response(JSON.stringify({ error: subsErr.message }), { status: 500 })
  }

  const payload = JSON.stringify({
    title: 'Echo t\'attend 🦊',
    body: 'Tu n\'as pas encore fait ta leçon du jour — quelques minutes suffisent pour garder ta série !',
    url: '/dashboard',
    tag: 'daily-reminder',
  })

  let sent = 0
  let failed = 0
  const staleSubscriptionIds = []

  for (const sub of subscriptions || []) {
    try {
      await webpush.sendNotification(
        { endpoint: sub.endpoint, keys: sub.keys },
        payload
      )
      sent++
    } catch (err) {
      failed++
      // 404/410 = l'abonnement n'existe plus côté navigateur (désinstallation,
      // permission révoquée...) -> on le supprime pour ne plus réessayer.
      if (err?.statusCode === 404 || err?.statusCode === 410) {
        staleSubscriptionIds.push(sub.id)
      }
    }
  }

  if (staleSubscriptionIds.length > 0) {
    await supabase.from('push_subscriptions').delete().in('id', staleSubscriptionIds)
  }

  return new Response(JSON.stringify({ sent, failed, cleaned: staleSubscriptionIds.length }), { status: 200 })
})
