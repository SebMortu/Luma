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

export function formatDuration(totalSeconds) {
  const hours = Math.floor(totalSeconds / 3600)
  const minutes = Math.floor((totalSeconds % 3600) / 60)
  if (hours === 0 && minutes === 0) return '< 1min'
  if (hours === 0) return `${minutes}min`
  return `${hours}h ${minutes}min`
}
