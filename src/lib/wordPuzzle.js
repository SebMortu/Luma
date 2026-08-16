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
