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
