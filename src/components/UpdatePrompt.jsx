import { useEffect, useState } from 'react'
import { registerSW } from 'virtual:pwa-register'

// Détecte quand une nouvelle version de l'app a été déployée et propose
// à l'utilisateur de recharger, plutôt que de le laisser sur une version
// obsolète en cache sans qu'il le sache.
function UpdatePrompt() {
  const [needsRefresh, setNeedsRefresh] = useState(false)
  const [updateFn, setUpdateFn] = useState(null)

  useEffect(() => {
    const update = registerSW({
      onNeedRefresh() {
        setNeedsRefresh(true)
      },
      onRegisteredSW(_url, registration) {
        // Vérifie périodiquement (toutes les 30 min) si une nouvelle version existe,
        // au cas où l'utilisateur laisse l'app ouverte longtemps sans navigation.
        if (registration) {
          setInterval(() => registration.update(), 30 * 60 * 1000)
        }
      },
    })
    setUpdateFn(() => update)
  }, [])

  if (!needsRefresh) return null

  return (
    <div className="update-prompt">
      <p>🆕 Une nouvelle version de Luma est disponible.</p>
      <button className="btn-primary" onClick={() => updateFn?.(true)}>Actualiser</button>
    </div>
  )
}

export default UpdatePrompt
