import { precacheAndRoute } from 'workbox-precaching'

// Point d'injection requis par vite-plugin-pwa (stratégie injectManifest) :
// la liste des fichiers à mettre en cache est générée automatiquement au build.
precacheAndRoute(self.__WB_MANIFEST)

self.addEventListener('install', () => {
  self.skipWaiting()
})

self.addEventListener('activate', (event) => {
  event.waitUntil(self.clients.claim())
})

// Réception d'une notification push envoyée par le serveur (rappel quotidien,
// streak en danger, etc.)
self.addEventListener('push', (event) => {
  if (!event.data) return
  let payload
  try {
    payload = event.data.json()
  } catch {
    payload = { title: 'Luma', body: event.data.text() }
  }

  const title = payload.title || 'Luma'
  const options = {
    body: payload.body || '',
    icon: '/icons/icon-192-v3.png',
    badge: '/icons/icon-192-v3.png',
    data: { url: payload.url || '/dashboard' },
    tag: payload.tag || 'luma-reminder',
    renotify: true,
  }

  event.waitUntil(self.registration.showNotification(title, options))
})

// Clic sur la notification : ouvre l'app (ou la ramène au premier plan si déjà ouverte)
self.addEventListener('notificationclick', (event) => {
  event.notification.close()
  const targetUrl = event.notification.data?.url || '/dashboard'

  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clientList) => {
      for (const client of clientList) {
        if (client.url.includes(self.location.origin) && 'focus' in client) {
          client.navigate(targetUrl)
          return client.focus()
        }
      }
      return self.clients.openWindow(targetUrl)
    })
  )
})
