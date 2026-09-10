// Test isolé, en dehors de Supabase — envoie une notification directement
// depuis ton ordinateur avec exactement la même paire de clés. Si ça
// fonctionne ici mais pas sur Supabase, on saura que le problème vient de
// l'environnement Supabase (Deno), pas des clés elles-mêmes.

import webpush from 'web-push'

const VAPID_PUBLIC_KEY = 'BPGJTsakgJnBlhhRZ1jsEmAG3kcp7H_kfODy0IHF0Dx7gAUg3BYfg4SCqubFnMQb_Ytn_dWEIQvf8Lit5mFsl4s'
const VAPID_PRIVATE_KEY = 'rRHUdyTTYIOJFNZb8jOLFyyvLiR-R2aH-4w9u39TusM'

webpush.setVapidDetails('mailto:contact@luma-app.example', VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY)

// ⚠️ Remplace ces deux valeurs par celles de ton abonnement réel
// (récupérables avec la requête SQL donnée juste après ce script)
const subscription = {
  endpoint: 'COLLE_ICI_L_ENDPOINT',
  keys: {
    p256dh: 'COLLE_ICI_LA_CLE_P256DH',
    auth: 'COLLE_ICI_LA_CLE_AUTH',
  },
}

try {
  await webpush.sendNotification(subscription, JSON.stringify({ title: 'Test', body: 'Ça marche !' }))
  console.log('✅ Notification envoyée avec succès depuis cet ordinateur.')
} catch (err) {
  console.log('❌ Échec :', err.statusCode, err.body || err.message)
}
