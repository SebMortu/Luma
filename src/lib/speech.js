// Nettoie un texte d'exercice avant de le donner à la synthèse vocale :
// retire les préfixes d'instruction ("Complète : ", "Choisis : "...) et
// remplace les trous à compléter (___, _ _ _...) par un mot prononçable,
// pour éviter que le TTS lise "Complète" ou une suite de tirets bas.
export function sanitizeForSpeech(text) {
  if (!text) return ''
  return text
    .replace(/^(complète|complete|choisis|traduis|traduisez|complétez|sélectionne|select|translate)\s*:\s*/i, '')
    .replace(/_{2,}(\s*_{2,})*/g, '...') // pause silencieuse plutôt qu'un mot prononcé
    .replace(/\s*=\s*\?\s*$/g, '') // retire le "= ?" de fin (ex: "🐶 = ?"), lu à tort comme "equals"
    .replace(/=/g, '') // tout autre "=" isolé, jamais destiné à être prononcé
    .replace(/\s{2,}/g, ' ')
    .trim()
}

// Fichiers audio premium (générés via OpenAI TTS) — chargés une seule fois,
// à la demande. Si une phrase exacte a un fichier pré-généré, on le joue au
// lieu de la synthèse vocale du navigateur, pour une voix bien plus naturelle.
let audioManifestPromise = null
function loadAudioManifest() {
  if (!audioManifestPromise) {
    audioManifestPromise = fetch('/audio-manifest.json')
      .then((r) => (r.ok ? r.json() : []))
      .then((list) => {
        const map = new Map()
        list.forEach((entry) => map.set(entry.text, entry.filename))
        return map
      })
      .catch(() => new Map())
  }
  return audioManifestPromise
}

/**
 * Retourne l'URL du fichier audio premium pour ce texte exact, ou null s'il
 * n'existe pas encore (fallback vers la synthèse vocale du navigateur).
 */
export async function getPremiumAudioUrl(text) {
  if (!text) return null
  const manifest = await loadAudioManifest()
  const filename = manifest.get(text)
  return filename ? `/audio/${filename}` : null
}

/**
 * Si le texte contient un fragment entre guillemets (ex: '"He are my brother"
 * est grammaticalement correct.'), on ne veut lire QUE ce fragment anglais,
 * pas la phrase française qui l'entoure. Gère guillemets droits et courbes.
 */
export function extractQuotedOrFull(text) {
  if (!text) return ''
  const match = text.match(/["“]([^"”]+)["”]/)
  return match ? match[1] : text
}
