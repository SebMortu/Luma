// pathUnits.js
// Définit ce qui fait partie du PARCOURS MODERNE, et son ORDRE CANONIQUE.
//
// Hiérarchie (R0.1) : NIVEAU → THÈME → UNITÉ (nœud) → LEÇON → ACTIVITÉ.
// Types de nœud (units.unit_type) :
//   'standard'     unité d'apprentissage
//   'theme_review' bilan de thème (scène de transfert, non éliminatoire)
//   'checkpoint'   checkpoint de niveau (diagnostic, non éliminatoire)
//   'legacy'       hors parcours, conservé pour l'historique
//
// Visibilité :
//   - legacy : hors parcours, MAIS accessible par URL directe (historique).
//   - draft  (units.status = 'draft' ou thème en 'draft') : INVISIBLE PARTOUT,
//     y compris par URL directe. Sert à construire le nouvel A0 en production
//     sans l'exposer (bascule en une transaction, voir migration R0.1).
//
// unit_type / status null ou absents = standard / publié (valeurs sûres).

import { supabase } from './supabaseClient.js'

export const LEGACY_UNIT_TYPE = 'legacy'
export const CHECKPOINT_UNIT_TYPE = 'checkpoint'
export const THEME_REVIEW_UNIT_TYPE = 'theme_review'
export const DRAFT_STATUS = 'draft'

export const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']

/** Brouillon : l'unité elle-même, ou son thème (si connu), est en draft. */
export function isDraftUnit(unit, themesById = {}) {
  if (!unit) return false
  if (unit.status === DRAFT_STATUS) return true
  const theme = unit.theme_id ? themesById[unit.theme_id] : null
  return theme?.status === DRAFT_STATUS
}

/** Nœud du parcours moderne : ni legacy, ni brouillon. */
export function isModernPathUnit(unit, themesById = {}) {
  return !!unit && unit.unit_type !== LEGACY_UNIT_TYPE && !isDraftUnit(unit, themesById)
}

export function filterModernPathUnits(units, themesById = {}) {
  return (units || []).filter((u) => isModernPathUnit(u, themesById))
}

export function isCheckpointUnit(unit) {
  return !!unit && unit.unit_type === CHECKPOINT_UNIT_TYPE
}

export function isThemeReviewUnit(unit) {
  return !!unit && unit.unit_type === THEME_REVIEW_UNIT_TYPE
}

/**
 * Une unité peut-elle proposer un « Test de sortie » (UnitTest) ?
 * NON pour un Checkpoint (diagnostic), NON pour un bilan de thème (scène de
 * transfert), NON pour un brouillon (invisible). Utilisé pour l'affichage
 * (LevelPath, UnitDetail) ET comme garde-fou dans UnitTest lui-même.
 */
export function canHaveUnitTest(unit, themesById = {}) {
  return !!unit && !isCheckpointUnit(unit) && !isThemeReviewUnit(unit) && !isDraftUnit(unit, themesById)
}

const levelRank = (level) => {
  const i = LEVEL_ORDER.indexOf(level)
  return i < 0 ? LEVEL_ORDER.length : i // niveau inconnu : en fin de parcours
}

/**
 * ORDRE CANONIQUE du parcours (source unique) :
 *   1. rang du niveau (A0 < A1 < … < C1)
 *   2. le Checkpoint d'un niveau est toujours son dernier nœud
 *   3. position du thème dans le niveau (unités sans thème : 0)
 *   4. position de l'unité dans son thème (sans thème : 0)
 *   5. units.position (départage ; seul critère réel pour les niveaux sans thème)
 * Pour les données actuelles (aucun thème), l'ordre est identique au tri
 * historique par units.position : prouvé par tests + requête de contrôle.
 */
export function canonicalCompare(a, b, themesById = {}) {
  const key = (u) => {
    const theme = u.theme_id ? themesById[u.theme_id] : null
    return [
      levelRank(u.cecr_level),
      isCheckpointUnit(u) ? 1 : 0,
      theme?.position ?? 0,
      u.position_in_theme ?? 0,
      u.position ?? 0,
    ]
  }
  const ka = key(a); const kb = key(b)
  for (let i = 0; i < ka.length; i++) if (ka[i] !== kb[i]) return ka[i] - kb[i]
  return 0
}

export function sortCanonical(units, themesById = {}) {
  return [...(units || [])].sort((a, b) => canonicalCompare(a, b, themesById))
}

// Table `themes` pas encore créée (frontend déployé avant la migration, ou
// migration annulée) : on se comporte exactement comme aujourd'hui, sans thème.
// Seule l'absence de la TABLE est tolérée ; toute autre erreur remonte.
const isMissingTableError = (error) =>
  !!error && (error.code === '42P01' || error.code === 'PGRST205' || /relation .*themes.* does not exist/i.test(error.message || ''))

/** Thèmes d'une langue, indexés par id (table absente ou vide : {}). */
export async function loadThemesById(languageId) {
  const { data, error } = await supabase
    .from('themes').select('id, cecr_level, position, title, status, can_do_statement')
    .eq('language_id', languageId)
  if (isMissingTableError(error)) return {}
  if (error) throw error
  const byId = {}
  ;(data || []).forEach((t) => { byId[t.id] = t })
  return byId
}

/** Nœuds visibles d'un niveau, dans l'ordre canonique. */
export async function loadPathUnitsForLevel(languageId, cecrLevel) {
  const { data: units, error } = await supabase
    .from('units').select('*')
    .eq('language_id', languageId).eq('cecr_level', cecrLevel)
    .order('position')
  if (error) throw error
  const themesById = await loadThemesById(languageId)
  return sortCanonical(filterModernPathUnits(units, themesById), themesById)
}

/**
 * L'unité est-elle un brouillon (unité ou thème en draft) ?
 * Pour les accès directs (UnitTest, UnitDetail) qui chargent une unité isolée.
 */
export async function isUnitHidden(unit) {
  if (!unit) return false
  if (unit.status === DRAFT_STATUS) return true
  if (!unit.theme_id) return false
  const { data: theme, error } = await supabase
    .from('themes').select('status').eq('id', unit.theme_id).maybeSingle()
  if (isMissingTableError(error)) return false
  if (error) throw error
  return theme?.status === DRAFT_STATUS
}

/**
 * Première leçon du parcours moderne pour un niveau CECR donné
 * (premier nœud visible, dans l'ordre canonique, qui contient une leçon).
 */
export async function getFirstPathLessonId(languageId, cecrLevel) {
  for (const unit of await loadPathUnitsForLevel(languageId, cecrLevel)) {
    const { data: lessons, error: lessonsErr } = await supabase
      .from('lessons').select('id').eq('unit_id', unit.id).order('position').limit(1)
    if (lessonsErr) throw lessonsErr
    if (lessons && lessons.length > 0) return lessons[0].id
  }
  return null
}
