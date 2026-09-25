import { supabase } from './supabaseClient.js'
import { filterModernPathUnits } from './pathUnits.js'

const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']

// ─────────────────────────────────────────────────────────────────────────
// LOGIQUE DE PROGRESSION — SOURCE UNIQUE
// computeUnitStates, getNextLesson et la protection d'accès de Lesson
// s'appuient tous sur deriveUnitStates() et lessonCountsAsPassed() : une
// seule définition de « leçon validée », « unité validée » et « unité
// verrouillée ».
// ─────────────────────────────────────────────────────────────────────────

const PASS_SCORE = 0.8

/**
 * Une leçon compte-t-elle comme validée pour PROGRESSER ?
 * - Checkpoint : terminée suffit (non éliminatoire, score ignoré).
 * - Standard   : terminée ET meilleur score >= 80 %.
 */
export function lessonCountsAsPassed(unit, progress) {
  if (!progress || progress.status !== 'completed') return false
  if (unit.unit_type === 'checkpoint') return true
  return (progress.best_score ?? 0) >= PASS_SCORE
}

/**
 * Calcul pur (sans accès base) de l'état de chaque unité du parcours moderne.
 * `units` doit être trié par position ; les unités legacy sont retirées.
 *
 * Défense en profondeur : une unité VERROUILLÉE ne compte jamais comme
 * validée, même si toutes ses leçons sont « completed » en base (accès direct
 * passé, ancienne écriture du test de passage…). Elle ne peut donc servir de
 * prérequis ni à l'unité suivante, ni à un Checkpoint.
 */
export function deriveUnitStates(inputUnits, lessonsByUnit, progressByLesson, unlockedLevel = null) {
  const units = filterModernPathUnits(inputUnits)
  // Déblocage par placement / test de passage / onboarding A1 : niveaux
  // accessibles sans que leurs leçons soient affichées comme « faites ».
  const unlockedIdx = unlockedLevel ? LEVEL_ORDER.indexOf(unlockedLevel) : -1
  const effectivePassedById = {}
  let previousUnitPassed = true // la première unité est toujours accessible

  return units.map((unit, idx) => {
    const lessons = lessonsByUnit[unit.id] || []
    const completions = lessons.map((l) => progressByLesson[l.id]).filter(Boolean)
    const allCompleted = lessons.length > 0 && completions.length === lessons.length
    const rawPassed = lessons.length > 0 && lessons.every((l) => lessonCountsAsPassed(unit, progressByLesson[l.id]))
    const unitLevelIdx = LEVEL_ORDER.indexOf(unit.cecr_level)

    let confirmedByPlacement
    let isLocked
    if (unit.unit_type === 'checkpoint') {
      // Checkpoint de niveau N : accessible si l'utilisateur est placé
      // STRICTEMENT au-dessus de N, ou si TOUTES les unités standard de N
      // qui le précèdent sont (effectivement) validées.
      const bypass = unlockedIdx > unitLevelIdx
      const prerequisites = units.slice(0, idx)
        .filter((u) => u.unit_type === 'standard' && u.cecr_level === unit.cecr_level)
      const allPrerequisitesPassed = prerequisites.every((u) => effectivePassedById[u.id])
      confirmedByPlacement = bypass
      isLocked = !allPrerequisitesPassed && !confirmedByPlacement
    } else {
      confirmedByPlacement = unlockedIdx >= 0 && unitLevelIdx <= unlockedIdx
      isLocked = !previousUnitPassed && !confirmedByPlacement
    }

    const passed = rawPassed && !isLocked
    effectivePassedById[unit.id] = passed
    previousUnitPassed = passed

    const status = isLocked
      ? 'locked'
      : allCompleted
        ? 'completed'
        : completions.length > 0
          ? 'in_progress'
          : 'not_started'

    return { unit, status, isLocked, passed, lessonCount: lessons.length, completedCount: completions.length }
  })
}

/** Charge leçons + progression de l'utilisateur pour un ensemble d'unités. */
async function loadProgressionData(userId, languageId, units) {
  const { data: allLessons, error: lessonsErr } = await supabase
    .from('lessons').select('id, unit_id, position, title')
    .in('unit_id', units.map((u) => u.id))
  if (lessonsErr) throw lessonsErr

  const { data: allProgress, error: progressErr } = await supabase
    .from('user_progress').select('lesson_id, unit_id, status, best_score')
    .eq('user_id', userId).eq('language_id', languageId)
  if (progressErr) throw progressErr

  const lessonsByUnit = {}
  ;[...allLessons].sort((a, b) => (a.position ?? 0) - (b.position ?? 0)).forEach((l) => {
    if (!lessonsByUnit[l.unit_id]) lessonsByUnit[l.unit_id] = []
    lessonsByUnit[l.unit_id].push(l)
  })
  const progressByLesson = {}
  allProgress.forEach((p) => { progressByLesson[p.lesson_id] = p })
  return { lessonsByUnit, progressByLesson }
}

/** Unités du parcours moderne d'une langue, triées, + unlocked_level de l'utilisateur. */
async function loadPathContext(userId, languageId) {
  const { data: allUnits, error: unitsErr } = await supabase
    .from('units').select('*')
    .eq('language_id', languageId)
    .order('position')
  if (unitsErr) throw unitsErr
  const { data: settings } = await supabase
    .from('user_settings').select('unlocked_level').eq('user_id', userId).maybeSingle()
  return { units: filterModernPathUnits(allUnits), unlockedLevel: settings?.unlocked_level || null }
}

/**
 * Calcule, pour chaque unité, son statut d'avancement et si elle est déblocable.
 * Une unité standard est validée si toutes ses leçons sont terminées avec un
 * score >= 80 % ; un Checkpoint est validé dès que sa leçon est terminée.
 * (Signature inchangée : Dashboard, Profile, getLevelPath.)
 */
export async function computeUnitStates(userId, languageId, inputUnits, unlockedLevel = null) {
  const units = filterModernPathUnits(inputUnits)
  if (units.length === 0) return []
  const { lessonsByUnit, progressByLesson } = await loadProgressionData(userId, languageId, units)
  return deriveUnitStates(units, lessonsByUnit, progressByLesson, unlockedLevel)
}

/**
 * Prochaine leçon à faire (« Continuer ») : première leçon, dans l'ordre du
 * parcours, qui nécessite encore une action — même règle que le verrouillage.
 * - Standard   : non terminée OU meilleur score < 80 % (à retravailler).
 * - Checkpoint : non terminée (score ignoré).
 * Les niveaux STRICTEMENT inférieurs à unlocked_level sont contournés et ne
 * sont jamais imposés. Une unité verrouillée n'est jamais proposée.
 */
export async function getNextLesson(userId, languageId) {
  const { units, unlockedLevel } = await loadPathContext(userId, languageId)
  if (units.length === 0) return null
  const { lessonsByUnit, progressByLesson } = await loadProgressionData(userId, languageId, units)
  const states = deriveUnitStates(units, lessonsByUnit, progressByLesson, unlockedLevel)
  const unlockedIdx = unlockedLevel ? LEVEL_ORDER.indexOf(unlockedLevel) : -1

  for (const { unit, isLocked } of states) {
    if (unlockedIdx >= 0 && LEVEL_ORDER.indexOf(unit.cecr_level) < unlockedIdx) continue
    if (isLocked) continue
    const lesson = (lessonsByUnit[unit.id] || []).find((l) => !lessonCountsAsPassed(unit, progressByLesson[l.id]))
    if (lesson) return { lesson, unit }
  }
  return null // tout le contenu disponible est terminé
}

/**
 * Protection d'accès direct (/lesson/:id) : l'unité est-elle verrouillée pour
 * cet utilisateur, selon EXACTEMENT les mêmes règles que le parcours ?
 * Retourne false pour une unité hors parcours moderne (legacy = accès historique).
 */
export async function isUnitLockedForUser(userId, languageId, unitId) {
  const { units, unlockedLevel } = await loadPathContext(userId, languageId)
  if (!units.some((u) => u.id === unitId)) return false
  const { lessonsByUnit, progressByLesson } = await loadProgressionData(userId, languageId, units)
  const state = deriveUnitStates(units, lessonsByUnit, progressByLesson, unlockedLevel).find((s) => s.unit.id === unitId)
  return Boolean(state?.isLocked)
}

/**
 * XP nécessaire par jour pour valider le streak, selon l'objectif choisi.
 * Base : 6 XP par minute d'objectif (5min→30XP, 10min→60XP, 20min→120XP).
 */
export function dailyXpThreshold(dailyGoalMinutes) {
  return (dailyGoalMinutes || 10) * 6
}

/**
 * Fonction centrale : attribue de l'XP (leçon ou scénario), met à jour le temps
 * d'apprentissage, et n'incrémente le streak QUE le jour où l'objectif quotidien
 * (en XP) est réellement atteint — pas à la première leçon venue.
 */
export async function awardProgress(userId, { xpGained = 0, secondsSpent = 0 }) {
  const { data, error } = await supabase.rpc('award_progress', {
    p_user_id: userId,
    p_xp_gained: xpGained,
    p_seconds_spent: secondsSpent,
  })
  if (error) throw error

  const result = Array.isArray(data) ? data[0] : data
  return {
    xpGained: result.xp_gained,
    newStreak: result.new_streak,
    newTotalXp: result.new_total_xp,
    goalMetNow: result.goal_met_now,
    xpToday: result.xp_today,
    threshold: result.threshold,
    freezeUsed: result.freeze_used,
    freezeGained: result.freeze_gained,
    streakFreezes: result.streak_freezes,
  }
}

/**
 * Sauvegarde une phrase de vocabulaire (issue d'un livre, par exemple) dans la
 * file de révision espacée. Ignore silencieusement si elle y est déjà.
 */
export async function saveVocabForReview(userId, { contentEn, contentFr, sourceLabel }) {
  const { error } = await supabase.from('user_review_queue').insert({
    user_id: userId,
    item_type: 'vocabulary',
    item_id: null,
    content_en: contentEn,
    content_fr: contentFr,
    source_label: sourceLabel,
    next_review_date: new Date().toISOString().slice(0, 10),
  })
  // Code 23505 = violation de contrainte unique -> déjà sauvegardé, on ignore
  if (error && error.code !== '23505') throw error
  return !error
}

/** Récupère les éléments de vocabulaire dus aujourd'hui (ou en retard). */
export async function getDueVocab(userId) {
  const today = new Date().toISOString().slice(0, 10)
  const { data, error } = await supabase
    .from('user_review_queue').select('*')
    .eq('user_id', userId).eq('item_type', 'vocabulary')
    .lte('next_review_date', today)
    .order('next_review_date')
  if (error) throw error
  return data
}

/** Compte le nombre d'éléments dus aujourd'hui, pour affichage sur le dashboard. */
export async function countDueVocab(userId) {
  const today = new Date().toISOString().slice(0, 10)
  const { count, error } = await supabase
    .from('user_review_queue').select('id', { count: 'exact', head: true })
    .eq('user_id', userId).eq('item_type', 'vocabulary')
    .lte('next_review_date', today)
  if (error) throw error
  return count || 0
}

/**
 * Met à jour l'intervalle de répétition après une révision (méthode simple
 * inspirée de SM-2) : succès -> l'intervalle double (plafonné à 60 jours),
 * échec -> retour à 1 jour et remise à zéro du streak de réussite.
 */
export async function reviewVocabItem(itemId, remembered) {
  const { data: item, error: fetchErr } = await supabase
    .from('user_review_queue').select('*').eq('id', itemId).single()
  if (fetchErr) throw fetchErr

  const newStreak = remembered ? item.success_streak + 1 : 0
  const newInterval = remembered ? Math.min(item.interval_days * 2, 60) : 1
  const nextDate = new Date(Date.now() + newInterval * 86400000).toISOString().slice(0, 10)

  const { error: updateErr } = await supabase
    .from('user_review_queue')
    .update({ success_streak: newStreak, interval_days: newInterval, next_review_date: nextDate })
    .eq('id', itemId)
  if (updateErr) throw updateErr
}

export async function recordLessonCompletion({ userId, languageId, unitId, lessonId, score, secondsSpent = 0, lessonTitle = null, vocabTable = null }) {
  // 1. Vérifier si cette leçon avait déjà été terminée avant (pour ne pas re-donner d'XP)
  const { data: existing } = await supabase
    .from('user_progress').select('status, best_score')
    .eq('user_id', userId).eq('language_id', languageId)
    .eq('unit_id', unitId).eq('lesson_id', lessonId)
    .maybeSingle()

  const alreadyCompleted = existing?.status === 'completed'
  const bestScore = existing ? Math.max(existing.best_score ?? 0, score) : score

  const { error: upsertErr } = await supabase
    .from('user_progress')
    .upsert({
      user_id: userId,
      language_id: languageId,
      unit_id: unitId,
      lesson_id: lessonId,
      status: 'completed',
      best_score: bestScore,
      updated_at: new Date().toISOString(),
    }, { onConflict: 'user_id,language_id,unit_id,lesson_id' })
  if (upsertErr) throw upsertErr

  // Vocabulaire de la leçon -> file de révision espacée, uniquement à la toute
  // première réussite (pas à chaque révision, pour ne pas repousser sa date).
  // Silencieux en cas d'échec : ça ne doit jamais bloquer la complétion de la leçon.
  if (!alreadyCompleted && Array.isArray(vocabTable) && vocabTable.length > 0) {
    const rows = vocabTable
      .filter((entry) => entry?.subject && entry?.affirmative)
      .map((entry) => ({
        user_id: userId,
        item_type: 'vocabulary',
        item_id: null,
        content_en: entry.subject,
        content_fr: entry.affirmative,
        source_label: lessonTitle ? `Leçon : ${lessonTitle}` : 'Leçon',
        next_review_date: new Date().toISOString().slice(0, 10),
      }))
    if (rows.length > 0) {
      // onConflict correspond à l'index unique (user_id, content_en) posé en migration
      await supabase.from('user_review_queue').upsert(rows, { onConflict: 'user_id,content_en', ignoreDuplicates: true })
    }
  }

  // L'XP n'est attribué qu'à la première réussite d'une leçon — les révisions
  // ne permettent pas de farmer l'XP (mais comptent quand même le temps passé)
  const xpGained = alreadyCompleted ? 0 : (score === 1 ? 20 : 10)

  const result = await awardProgress(userId, { xpGained, secondsSpent })
  return { ...result, alreadyCompleted }
}
