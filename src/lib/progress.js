import { supabase } from './supabaseClient.js'

/**
 * Trouve la prochaine leçon à faire pour un utilisateur :
 * parcourt les unités dans l'ordre, et dans chaque unité les leçons dans l'ordre,
 * jusqu'à trouver la première leçon non terminée.
 */
export async function getNextLesson(userId, languageId) {
  const { data: units, error: unitsErr } = await supabase
    .from('units').select('id, position, title')
    .eq('language_id', languageId)
    .order('position')
  if (unitsErr) throw unitsErr

  const { data: progress, error: progressErr } = await supabase
    .from('user_progress').select('lesson_id, status')
    .eq('user_id', userId)
    .eq('language_id', languageId)
  if (progressErr) throw progressErr

  const completedLessonIds = new Set(
    progress.filter((p) => p.status === 'completed').map((p) => p.lesson_id)
  )

  for (const unit of units) {
    const { data: lessons, error: lessonsErr } = await supabase
      .from('lessons').select('id, position, title, unit_id')
      .eq('unit_id', unit.id)
      .order('position')
    if (lessonsErr) throw lessonsErr

    const nextLesson = lessons.find((l) => !completedLessonIds.has(l.id))
    if (nextLesson) return { lesson: nextLesson, unit }
  }

  return null // tout le contenu disponible est terminé
}

/**
 * Calcule, pour chaque unité, son statut d'avancement et si elle est déblocable.
 * Une unité est débloquée si l'unité précédente est "validée" :
 * toutes ses leçons terminées avec un score ≥ 80% chacune.
 */
export async function computeUnitStates(userId, languageId, units) {
  const { data: allLessons, error: lessonsErr } = await supabase
    .from('lessons').select('id, unit_id')
    .in('unit_id', units.map((u) => u.id))
  if (lessonsErr) throw lessonsErr

  const { data: allProgress, error: progressErr } = await supabase
    .from('user_progress').select('lesson_id, unit_id, status, best_score')
    .eq('user_id', userId).eq('language_id', languageId)
  if (progressErr) throw progressErr

  const lessonsByUnit = {}
  allLessons.forEach((l) => {
    if (!lessonsByUnit[l.unit_id]) lessonsByUnit[l.unit_id] = []
    lessonsByUnit[l.unit_id].push(l)
  })

  const progressByLesson = {}
  allProgress.forEach((p) => { progressByLesson[p.lesson_id] = p })

  let previousUnitPassed = true // la première unité est toujours accessible

  return units.map((unit) => {
    const lessons = lessonsByUnit[unit.id] || []
    const completions = lessons.map((l) => progressByLesson[l.id]).filter(Boolean)
    const allCompleted = lessons.length > 0 && completions.length === lessons.length
    const passed = allCompleted && completions.every((c) => (c.best_score ?? 0) >= 0.8)

    const isLocked = !previousUnitPassed
    const status = isLocked
      ? 'locked'
      : allCompleted
        ? 'completed'
        : completions.length > 0
          ? 'in_progress'
          : 'not_started'

    previousUnitPassed = passed

    return { unit, status, isLocked, passed, lessonCount: lessons.length, completedCount: completions.length }
  })
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
