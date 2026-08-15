import { supabase } from './supabaseClient.js'
import { computeUnitStates } from './progress.js'

/**
 * Charge, pour un niveau CECR donné, toutes les leçons de toutes ses unités,
 * dans l'ordre, avec leur statut (verrouillée / à faire / en cours / terminée),
 * en tenant compte du déblocage en cascade sur l'ensemble de la langue.
 */
export async function getLevelPath(userId, languageId, cecrLevel) {
  const { data: allUnits, error: unitsErr } = await supabase
    .from('units').select('*').eq('language_id', languageId).order('position')
  if (unitsErr) throw unitsErr

  const allStates = await computeUnitStates(userId, languageId, allUnits)
  const levelStates = allStates.filter((s) => s.unit.cecr_level === cecrLevel)
  const levelUnitIds = levelStates.map((s) => s.unit.id)

  if (levelUnitIds.length === 0) return { units: [], nodes: [] }

  const { data: lessons, error: lessonsErr } = await supabase
    .from('lessons').select('*').in('unit_id', levelUnitIds)
  if (lessonsErr) throw lessonsErr

  const { data: progress, error: progressErr } = await supabase
    .from('user_progress').select('lesson_id, status, best_score')
    .eq('user_id', userId).in('unit_id', levelUnitIds)
  if (progressErr) throw progressErr

  const progressByLesson = {}
  progress.forEach((p) => { progressByLesson[p.lesson_id] = p })

  const unitOrder = {}
  levelStates.forEach((s, i) => { unitOrder[s.unit.id] = i })

  const sortedLessons = [...lessons].sort((a, b) => {
    const unitDiff = unitOrder[a.unit_id] - unitOrder[b.unit_id]
    if (unitDiff !== 0) return unitDiff
    return a.position - b.position
  })

  let currentAssigned = false
  const nodes = sortedLessons.map((lesson) => {
    const unitState = levelStates.find((s) => s.unit.id === lesson.unit_id)
    const p = progressByLesson[lesson.id]
    const isLocked = unitState.isLocked
    const isCompleted = p?.status === 'completed'

    let status = 'locked'
    if (!isLocked) {
      if (isCompleted) status = 'completed'
      else if (!currentAssigned) { status = 'current'; currentAssigned = true }
      else status = 'available'
    }

    return { lesson, unit: unitState.unit, status, bestScore: p?.best_score ?? null }
  })

  return { units: levelStates, nodes }
}
