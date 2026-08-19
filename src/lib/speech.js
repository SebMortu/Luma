// Nettoie un texte d'exercice avant de le donner à la synthèse vocale :
// retire les préfixes d'instruction ("Complète : ", "Choisis : "...) et
// remplace les trous à compléter (___, _ _ _...) par un mot prononçable,
// pour éviter que le TTS lise "Complète" ou une suite de tirets bas.
export function sanitizeForSpeech(text) {
  if (!text) return ''
  return text
    .replace(/^(complète|complete|choisis|traduis|traduisez|complétez|sélectionne|select|translate)\s*:\s*/i, '')
    .replace(/_{2,}(\s*_{2,})*/g, '...') // pause silencieuse plutôt qu'un mot prononcé
    .replace(/\s{2,}/g, ' ')
    .trim()
}
