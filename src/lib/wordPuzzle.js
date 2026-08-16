// Construit la correspondance case → lettre attendue, à partir de la liste des mots
export function buildCellMap(words) {
  const cellMap = {}
  words.forEach((w) => {
    for (let i = 0; i < w.answer.length; i++) {
      const r = w.direction === 'down' ? w.row + i : w.row
      const c = w.direction === 'across' ? w.col + i : w.col
      cellMap[`${r},${c}`] = w.answer[i].toUpperCase()
    }
  })
  return cellMap
}

// Numérote chaque case de départ de mot, dans l'ordre de lecture (comme une vraie grille)
export function numberWords(words) {
  const uniqueStarts = [...new Map(words.map((w) => [`${w.row},${w.col}`, { row: w.row, col: w.col }])).values()]
    .sort((a, b) => a.row - b.row || a.col - b.col)
  const numbers = {}
  uniqueStarts.forEach((s, i) => { numbers[`${s.row},${s.col}`] = i + 1 })
  return words.map((w) => ({ ...w, number: numbers[`${w.row},${w.col}`] }))
}

export function formatTime(seconds) {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${m}:${s.toString().padStart(2, '0')}`
}

/**
 * Calcule, pour chaque grille résolue par l'utilisateur, son rang réel
 * (comparé au meilleur temps de chaque autre joueur ayant joué cette grille).
 */
export async function loadWordPuzzleHistory(supabase, userId) {
  const { data: myScores } = await supabase.from('word_puzzle_scores').select('puzzle_id, time_seconds').eq('user_id', userId)
  if (!myScores || myScores.length === 0) return []

  const puzzleIds = [...new Set(myScores.map((s) => s.puzzle_id))]
  const myBestByPuzzle = {}
  myScores.forEach((s) => {
    if (!(s.puzzle_id in myBestByPuzzle) || s.time_seconds < myBestByPuzzle[s.puzzle_id]) myBestByPuzzle[s.puzzle_id] = s.time_seconds
  })

  const { data: allScores } = await supabase.from('word_puzzle_scores').select('puzzle_id, user_id, time_seconds').in('puzzle_id', puzzleIds)
  const { data: puzzles } = await supabase.from('word_puzzles').select('id, title, type').in('id', puzzleIds)

  return puzzleIds.map((pid) => {
    const bestByUser = {}
    allScores.filter((s) => s.puzzle_id === pid).forEach((s) => {
      if (!(s.user_id in bestByUser) || s.time_seconds < bestByUser[s.user_id]) bestByUser[s.user_id] = s.time_seconds
    })
    const sorted = Object.entries(bestByUser).sort((a, b) => a[1] - b[1])
    const rank = sorted.findIndex(([uid]) => uid === userId) + 1
    const puzzle = puzzles.find((p) => p.id === pid)
    return { puzzleId: pid, title: puzzle?.title, type: puzzle?.type, bestTime: myBestByPuzzle[pid], rank, totalPlayers: sorted.length }
  }).sort((a, b) => a.rank - b.rank)
}
