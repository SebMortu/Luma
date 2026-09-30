// shuffle.js — SOURCE UNIQUE du mélange (R0.2)
//
// Garanties :
//   - Fisher-Yates non biaisé ;
//   - le mélange est calculé UNE fois par tentative : les composants l'appellent
//     dans l'initialiseur de useState (jamais dans le rendu) ; une nouvelle
//     tentative (exercice rejoué = nouvel id = nouveau montage) est remélangée ;
//   - l'évaluation se fait toujours sur les INDEX D'ORIGINE (correct_index /
//     correct_indices inchangés en base) ;
//   - anti-fuite : pour les exercices à reconstruire (reorder, blocs, repli de
//     dictée, matching), l'ordre initial n'est jamais déjà la solution.

let randomSource = Math.random

/** Tests uniquement : impose une source aléatoire (null = Math.random). */
export function __setShuffleRandomForTests(fn) {
  randomSource = typeof fn === 'function' ? fn : Math.random
}

/** Permutation aléatoire [0..n-1] : order[positionAffichée] = indexD'origine. */
export function randomPermutation(n) {
  const order = Array.from({ length: n }, (_, i) => i)
  for (let i = n - 1; i > 0; i--) {
    const j = Math.floor(randomSource() * (i + 1))
    ;[order[i], order[j]] = [order[j], order[i]]
  }
  return order
}

/** Copie mélangée d'un tableau. */
export function shuffleArray(array) {
  return randomPermutation(array.length).map((i) => array[i])
}

/**
 * Copie mélangée qui ne satisfait PAS `isSolved` (ex. : ordre identique à la
 * solution). Nouveau tirage si besoin ; si le hasard n'y parvient pas (très
 * petits tableaux), rotation d'un cran, qui ne peut pas être la solution
 * lorsque les éléments diffèrent.
 */
export function shuffleAvoiding(array, isSolved, maxTries = 20) {
  if (array.length < 2) return [...array]
  for (let t = 0; t < maxTries; t++) {
    const candidate = shuffleArray(array)
    if (!isSolved(candidate)) return candidate
  }
  const rotated = [...array.slice(1), array[0]]
  return isSolved(rotated) ? [...array].reverse() : rotated
}
