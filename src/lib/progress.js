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
  const { data: settings, error: settingsErr } = await supabase
    .from('user_settings').select('*').eq('user_id', userId).single()
  if (settingsErr) throw settingsErr

  const today = new Date().toISOString().slice(0, 10)
  const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10)

  // Cumul de l'XP du jour (remis à zéro si on change de jour)
  const xpTodaySoFar = settings.xp_today_date === today ? settings.xp_gained_today : 0
  const xpToday = xpTodaySoFar + xpGained

  const threshold = dailyXpThreshold(settings.daily_goal_minutes)
  const goalMetNow = xpToday >= threshold
  const alreadyCountedToday = settings.last_activity_date === today

  let newStreak = settings.current_streak
  let newLastActivity = settings.last_activity_date

  // Le streak n'avance que la première fois où l'objectif est atteint dans la journée
  if (goalMetNow && !alreadyCountedToday) {
    newStreak = settings.last_activity_date === yesterday ? settings.current_streak + 1 : 1
    newLastActivity = today
  }
  const newLongest = Math.max(settings.longest_streak, newStreak)
  const newTotalXp = settings.total_xp + xpGained

  const { error: updateErr } = await supabase
    .from('user_settings')
    .update({
      total_xp: newTotalXp,
      xp_gained_today: xpToday,
      xp_today_date: today,
      current_streak: newStreak,
      longest_streak: newLongest,
      last_activity_date: newLastActivity,
      total_learning_seconds: settings.total_learning_seconds + secondsSpent,
      updated_at: new Date().toISOString(),
    })
    .eq('user_id', userId)
  if (updateErr) throw updateErr

  return { xpGained, newStreak, newTotalXp, goalMetNow, xpToday, threshold }
}

export async function recordLessonCompletion({ userId, languageId, unitId, lessonId, score, secondsSpent = 0 }) {
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

  // L'XP n'est attribué qu'à la première réussite d'une leçon — les révisions
  // ne permettent pas de farmer l'XP (mais comptent quand même le temps passé)
  const xpGained = alreadyCompleted ? 0 : (score === 1 ? 20 : 10)

  const result = await awardProgress(userId, { xpGained, secondsSpent })
  return { ...result, alreadyCompleted }
}
