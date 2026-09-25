// pathUnits.js
// Définit ce qui fait partie du PARCOURS MODERNE.
//
// Les unités `unit_type = 'legacy'` (ex. « Unité 0 : Fondations ») restent en
// base, avec toute la progression historique, mais ne font plus partie du
// parcours : pas de thème affiché, pas de verrouillage, pas de « Continuer »,
// pas de première leçon d'onboarding, pas de pioche dans les tests.
//
// Accès historique : les URL directes /lesson/:id, /unit/:id et
// /unit/:id/test ne passent PAS par ce filtre et restent fonctionnelles.
//
// unit_type null / absent = traité comme parcours moderne (valeur sûre).

import { supabase } from './supabaseClient.js'

export const LEGACY_UNIT_TYPE = 'legacy'
export const CHECKPOINT_UNIT_TYPE = 'checkpoint'

export function isModernPathUnit(unit) {
  return !!unit && unit.unit_type !== LEGACY_UNIT_TYPE
}

export function filterModernPathUnits(units) {
  return (units || []).filter(isModernPathUnit)
}

export function isCheckpointUnit(unit) {
  return !!unit && unit.unit_type === CHECKPOINT_UNIT_TYPE
}

/**
 * Une unité peut-elle proposer un « Test de sortie » (UnitTest) ?
 * NON pour un Checkpoint : il se termine UNIQUEMENT via sa leçon et ses
 * exercices, avec diagnostic. Un Test de sortie réussi marquerait sa leçon
 * « completed » et ouvrirait le niveau suivant sans diagnostic.
 * Utilisé à la fois pour l'affichage (LevelPath, UnitDetail) et comme
 * garde-fou dans UnitTest lui-même.
 */
export function canHaveUnitTest(unit) {
  return !!unit && !isCheckpointUnit(unit)
}

/**
 * Première leçon du parcours moderne pour un niveau CECR donné
 * (première unité non legacy, par position, qui contient au moins une leçon).
 * Retourne null si le niveau n'a aucun contenu.
 */
export async function getFirstPathLessonId(languageId, cecrLevel) {
  const { data: units, error } = await supabase
    .from('units').select('id, position, unit_type')
    .eq('language_id', languageId).eq('cecr_level', cecrLevel)
    .order('position')
  if (error) throw error

  for (const unit of filterModernPathUnits(units)) {
    const { data: lessons, error: lessonsErr } = await supabase
      .from('lessons').select('id').eq('unit_id', unit.id).order('position').limit(1)
    if (lessonsErr) throw lessonsErr
    if (lessons && lessons.length > 0) return lessons[0].id
  }
  return null
}
