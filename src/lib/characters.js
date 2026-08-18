import { supabase } from './supabaseClient.js'

export async function getSelectableCharacters() {
  const { data, error } = await supabase
    .from('characters').select('*').eq('is_selectable_as_guide', true).order('position')
  if (error) throw error
  return data
}

export async function getGuideCharacter(userId) {
  const { data: settings, error: settingsErr } = await supabase
    .from('user_settings').select('guide_character_id').eq('user_id', userId).single()
  if (settingsErr) throw settingsErr
  if (!settings.guide_character_id) return null

  const { data: character, error: charErr } = await supabase
    .from('characters').select('*').eq('id', settings.guide_character_id).single()
  if (charErr) throw charErr
  return character
}

export async function setGuideCharacter(userId, characterId) {
  const { error } = await supabase.from('user_settings').update({ guide_character_id: characterId }).eq('user_id', userId)
  if (error) throw error
}

/**
 * Retourne un message contextuel simple pour la bulle du guide sur le
 * tableau de bord, selon la progression du jour (streak, objectif atteint...).
 */
export function guideDashboardMessage({ goalMetToday, currentStreak, hasNextLesson }) {
  if (!hasNextLesson) return { text: "Bravo, tu as tout terminé pour l'instant ! 🎉", state: 'celebrating' }
  if (goalMetToday) return { text: 'Objectif du jour atteint, bien joué !', state: 'happy' }
  if (currentStreak >= 7) return { text: `${currentStreak} jours de suite, impressionnant !`, state: 'happy' }
  if (currentStreak === 0) return { text: 'Prêt à démarrer une nouvelle série ?', state: 'waving' }
  return { text: 'On continue sur notre lancée ?', state: 'neutral' }
}
