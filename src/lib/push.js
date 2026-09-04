import { supabase } from './supabaseClient.js'

// Clé publique VAPID — publique par nature, aucun risque à l'exposer côté client.
const VAPID_PUBLIC_KEY = 'BPGJTsakgJnBlhhRZ1jsEmAG3kcp7H_kfODy0IHF0Dx7gAUg3BYfg4SCqubFnMQb_Ytn_dWEIQvf8Lit5mFsl4s'

function urlBase64ToUint8Array(base64String) {
  const padding = '='.repeat((4 - (base64String.length % 4)) % 4)
  const base64 = (base64String + padding).replace(/-/g, '+').replace(/_/g, '/')
  const rawData = atob(base64)
  return Uint8Array.from([...rawData].map((c) => c.charCodeAt(0)))
}

export function isPushSupported() {
  return 'serviceWorker' in navigator && 'PushManager' in window
}

export async function getPushSubscriptionStatus() {
  if (!isPushSupported()) return 'unsupported'
  if (Notification.permission === 'denied') return 'denied'
  const registration = await navigator.serviceWorker.ready
  const sub = await registration.pushManager.getSubscription()
  return sub ? 'subscribed' : 'not-subscribed'
}

export async function subscribeToPush(userId) {
  if (!isPushSupported()) throw new Error('Notifications non supportées sur cet appareil.')

  const permission = await Notification.requestPermission()
  if (permission !== 'granted') throw new Error('Permission refusée.')

  const registration = await navigator.serviceWorker.ready
  let subscription = await registration.pushManager.getSubscription()
  // Si un abonnement existe déjà mais utilise une clé VAPID différente de
  // l'actuelle (ex: après une régénération de clés), il faut d'abord s'en
  // désabonner, sinon le navigateur le réutilise tel quel silencieusement.
  if (subscription) {
    const currentKey = subscription.options?.applicationServerKey
      ? btoa(String.fromCharCode(...new Uint8Array(subscription.options.applicationServerKey))).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '')
      : null
    if (currentKey !== VAPID_PUBLIC_KEY) {
      await subscription.unsubscribe()
      subscription = null
    }
  }
  if (!subscription) {
    subscription = await registration.pushManager.subscribe({
      userVisibleOnly: true,
      applicationServerKey: urlBase64ToUint8Array(VAPID_PUBLIC_KEY),
    })
  }

  const raw = subscription.toJSON()
  const { error } = await supabase.from('push_subscriptions').upsert({
    user_id: userId,
    endpoint: raw.endpoint,
    keys: raw.keys,
  }, { onConflict: 'user_id,endpoint' })
  if (error) throw error

  return subscription
}

export async function unsubscribeFromPush(userId) {
  if (!isPushSupported()) return
  const registration = await navigator.serviceWorker.ready
  const subscription = await registration.pushManager.getSubscription()
  if (subscription) {
    await supabase.from('push_subscriptions').delete().eq('user_id', userId).eq('endpoint', subscription.endpoint)
    await subscription.unsubscribe()
  }
}
