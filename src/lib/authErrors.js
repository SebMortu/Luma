// Traduit les messages d'erreur Supabase Auth (en anglais) vers du français.
// Recherche par sous-chaîne car Supabase peut légèrement varier le libellé.
const ERROR_TRANSLATIONS = [
  { match: 'Invalid login credentials', fr: 'Email ou mot de passe incorrect.' },
  { match: 'User already registered', fr: 'Un compte existe déjà avec cet email.' },
  { match: 'Email not confirmed', fr: "Cet email n'a pas encore été confirmé — vérifie ta boîte mail." },
  { match: 'Password should be at least', fr: 'Le mot de passe doit contenir au moins 6 caractères.' },
  { match: 'Unable to validate email address', fr: "Cette adresse email n'est pas valide." },
  { match: 'For security purposes', fr: 'Trop de tentatives — merci de patienter un instant avant de réessayer.' },
  { match: 'Email rate limit exceeded', fr: 'Trop de tentatives — merci de patienter un instant avant de réessayer.' },
  { match: 'signup_disabled', fr: 'Les inscriptions sont temporairement désactivées.' },
  { match: 'network', fr: 'Problème de connexion — vérifie ta connexion internet et réessaie.' },
]

export function translateAuthError(message) {
  if (!message) return ''
  const found = ERROR_TRANSLATIONS.find((e) => message.toLowerCase().includes(e.match.toLowerCase()))
  return found ? found.fr : `Une erreur est survenue (${message})`
}
