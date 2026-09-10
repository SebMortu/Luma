// Fonction Edge Supabase — envoie un rappel push aux utilisateurs qui n'ont
// pas encore atteint leur objectif quotidien d'XP, et qui sont abonnés aux
// notifications. Prévue pour être appelée une fois par jour via pg_cron
// (voir seed_330_push_notifications_cron.sql), typiquement en fin d'après-midi.
//
// Utilise @negrel/webpush, une bibliothèque conçue spécifiquement pour Deno
// (contrairement à la bibliothèque npm "web-push" qui dépend de fonctions
// Node comme crypto.ECDH, non implémentées dans l'environnement Deno de
// Supabase — d'où les échecs répétés des versions précédentes).

import { createClient } from 'npm:@supabase/supabase-js@2'
import { ApplicationServer } from 'jsr:@negrel/webpush'

const VAPID_PUBLIC_KEY = Deno.env.get('VAPID_PUBLIC_KEY')!
const VAPID_PRIVATE_KEY = Deno.env.get('VAPID_PRIVATE_KEY')!
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

function base64UrlToUint8Array(base64url: string): Uint8Array {
  const padding = '='.repeat((4 - (base64url.length % 4)) % 4)
  const base64 = (base64url + padding).replace(/-/g, '+').replace(/_/g, '/')
  const raw = atob(base64)
  return Uint8Array.from(raw, (c) => c.charCodeAt(0))
}
function uint8ArrayToBase64Url(bytes: Uint8Array): string {
  let str = ''
  for (const b of bytes) str += String.fromCharCode(b)
  return btoa(str).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '')
}

async function importVapidKeyPair(): Promise<CryptoKeyPair> {
  const publicBytes = base64UrlToUint8Array(VAPID_PUBLIC_KEY) // 0x04 + x(32) + y(32)
  const x = publicBytes.slice(1, 33)
  const y = publicBytes.slice(33, 65)
  const d = base64UrlToUint8Array(VAPID_PRIVATE_KEY)

  const publicKey = await crypto.subtle.importKey(
    'jwk',
    { kty: 'EC', crv: 'P-256', x: uint8ArrayToBase64Url(x), y: uint8ArrayToBase64Url(y), ext: true },
    { name: 'ECDSA', namedCurve: 'P-256' },
    true,
    []
  )
  const privateKey = await crypto.subtle.importKey(
    'jwk',
    { kty: 'EC', crv: 'P-256', x: uint8ArrayToBase64Url(x), y: uint8ArrayToBase64Url(y), d: uint8ArrayToBase64Url(d), ext: true },
    { name: 'ECDSA', namedCurve: 'P-256' },
    true,
    ['sign']
  )
  return { publicKey, privateKey }
}

Deno.serve(async (req) => {
  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)
  const today = new Date().toISOString().slice(0, 10)

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

  const vapidKeys = await importVapidKeyPair()
  const applicationServer = await ApplicationServer.new({
    contactInformation: 'mailto:contact@luma-app.example',
    vapidKeys,
  })

  let sent = 0
  let failed = 0
  const staleSubscriptionIds: string[] = []
  const errorDetails: unknown[] = []

  for (const sub of subscriptions || []) {
    try {
      const subscriber = applicationServer.subscribe({
        endpoint: sub.endpoint,
        keys: { p256dh: sub.keys.p256dh, auth: sub.keys.auth },
      })
      await subscriber.pushTextMessage(payload, {})
      sent++
    } catch (err: any) {
      failed++
      const statusCode = err?.response?.status
      let bodyText = ''
      try { bodyText = await err?.response?.text() } catch { /* ignore */ }
      errorDetails.push({ statusCode, body: bodyText, message: err instanceof Error ? err.message : String(err) })
      if (statusCode === 404 || statusCode === 410) {
        staleSubscriptionIds.push(sub.id)
      }
    }
  }

  if (staleSubscriptionIds.length > 0) {
    await supabase.from('push_subscriptions').delete().in('id', staleSubscriptionIds)
  }

  return new Response(JSON.stringify({ sent, failed, cleaned: staleSubscriptionIds.length, errorDetails }), { status: 200 })
})
