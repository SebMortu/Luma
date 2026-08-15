// Niveau simple : 100 XP par niveau, niveau 1 minimum
export function computeLevel(totalXp) {
  return Math.floor(totalXp / 100) + 1
}

export function xpForNextLevel(totalXp) {
  const currentLevel = computeLevel(totalXp)
  const xpAtLevelStart = (currentLevel - 1) * 100
  const xpIntoLevel = totalXp - xpAtLevelStart
  return { xpIntoLevel, xpNeeded: 100, currentLevel }
}
