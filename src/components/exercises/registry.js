// registry.js
// SOURCE UNIQUE des renderers d'exercices pour tout ce qui lit la table
// `exercises` : Lesson, UnitTest (Test de sortie), LevelUpTest (test de
// passage) et PlacementTest (test de positionnement).
//
// Pourquoi : Lesson.jsx et UnitTest.jsx avaient chacun leur propre liste.
// Quand comprehension / multi_select / block_construction ont été ajoutés
// à Lesson seulement, le Test de sortie affichait « Type d'exercice
// inconnu » sans bouton « suivant » : blocage total (P0 audit A0).
//
// Règle : tout nouveau type d'exercice est ajouté ICI, et nulle part ailleurs.

import ExerciseQCM from './ExerciseQCM.jsx'
import ExerciseFillBlank from './ExerciseFillBlank.jsx'
import ExerciseTrueFalse from './ExerciseTrueFalse.jsx'
import ExerciseMatching from './ExerciseMatching.jsx'
import ExerciseReorder from './ExerciseReorder.jsx'
import ExerciseDictation from './ExerciseDictation.jsx'
import ExerciseSpeakingPractice from './ExerciseSpeakingPractice.jsx'
import ExerciseMultiSelect from './ExerciseMultiSelect.jsx'
import ExerciseBlockConstruction from './ExerciseBlockConstruction.jsx'
import ExerciseComprehension from './ExerciseComprehension.jsx'
import ExerciseErrorCorrection from './ExerciseErrorCorrection.jsx'

export const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
  reorder: ExerciseReorder,
  dictation: ExerciseDictation,
  speaking_practice: ExerciseSpeakingPractice,
  multi_select: ExerciseMultiSelect,
  block_construction: ExerciseBlockConstruction,
  comprehension: ExerciseComprehension,
  error_correction: ExerciseErrorCorrection,
}

// Types rendus en leçon mais exclus des tests notés (Test de sortie, test de
// passage) : speaking_practice est auto-déclaratif, toujours « juste ».
// Comportement historique conservé (avant : .neq('type', 'speaking_practice')).
export const TEST_EXCLUDED_TYPES = ['speaking_practice']

const isNonEmptyArray = (v) => Array.isArray(v) && v.length > 0
const isNonEmptyString = (v) => typeof v === 'string' && v.trim().length > 0
const isIndexIn = (i, arr) => Number.isInteger(i) && i >= 0 && i < arr.length

function isValidChoiceQuestion(q) {
  return !!q && isNonEmptyArray(q.options) && q.options.length >= 2 && isIndexIn(q.correct_index, q.options)
}
function isValidMultiQuestion(q) {
  return !!q && isNonEmptyArray(q.options) && isNonEmptyArray(q.correct_indices) &&
    q.correct_indices.every((i) => isIndexIn(i, q.options))
}
function isValidTrueFalseQuestion(q) {
  return !!q && typeof q.correct_answer === 'boolean'
}

// Contrat minimal de chaque type : ce dont le composant a besoin pour
// pouvoir être TERMINÉ (appeler onAnswered). Un exercice qui ne le respecte
// pas bloquerait l'utilisateur : il est écarté (et signalé en console)
// plutôt qu'affiché.
const VALIDATORS = {
  qcm: (c) => isValidChoiceQuestion(c),
  true_false: (c) => isValidTrueFalseQuestion(c),
  multi_select: (c) => isValidMultiQuestion(c),
  fill_blank: (c) => isNonEmptyArray(c?.correct_answers),
  matching: (c) => isNonEmptyArray(c?.pairs) && c.pairs.every((p) => p && p.left != null && p.right != null) &&
    new Set(c.pairs.map((p) => p.left)).size === c.pairs.length,
  reorder: (c) => isNonEmptyArray(c?.words),
  dictation: (c) => isNonEmptyString(c?.sentence),
  speaking_practice: (c) => isNonEmptyString(c?.sentence),
  block_construction: (c) => isNonEmptyArray(c?.available_blocks) && isNonEmptyArray(c?.correct_sequence),
  error_correction: (c) => isNonEmptyString(c?.wrong_sentence) && isNonEmptyString(c?.error_word),
  comprehension: (c) => isNonEmptyArray(c?.questions) && c.questions.every((q) => {
    if (q?.type === 'true_false') return isValidTrueFalseQuestion(q)
    if (q?.type === 'multi_select') return isValidMultiQuestion(q)
    return isValidChoiceQuestion(q) // 'qcm' ou type absent : rendu en choix unique
  }),
}

/** Vrai si l'exercice a un renderer ET un contenu qui permet de le terminer. */
export function isRenderableExercise(exercise) {
  if (!exercise || !EXERCISE_COMPONENTS[exercise.type]) return false
  const validate = VALIDATORS[exercise.type]
  try {
    return validate ? Boolean(validate(exercise.content)) : true
  } catch {
    return false
  }
}

/** Vrai si l'exercice peut entrer dans un test noté. */
export function isTestableExercise(exercise) {
  return isRenderableExercise(exercise) && !TEST_EXCLUDED_TYPES.includes(exercise.type)
}

/**
 * Retire les exercices non terminables, avec un avertissement console
 * (jamais silencieux : un contenu cassé doit rester visible pour le debug).
 */
export function filterRenderableExercises(exercises, where = '') {
  const kept = []
  for (const ex of exercises || []) {
    if (isRenderableExercise(ex)) kept.push(ex)
    else console.warn(`[Luma] Exercice ignoré (type non supporté ou contenu invalide)${where ? ` — ${where}` : ''}`, { id: ex?.id, type: ex?.type })
  }
  return kept
}
