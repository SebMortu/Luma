// Moteur léger de variables narratives pour les scénarios interactifs.
// Ajoute, sans casser le format existant (nœuds/choix/fins déjà en place) :
//  - des variables propres à chaque scénario (TRUST, MONEY, SECRET_FOUND...)
//  - des choix conditionnels (visibles seulement si une condition est remplie)
//  - des répliques variables (un personnage se souvient du comportement du joueur)
//  - des mutations de variables appliquées quand un choix est pris, avec effet
//    éventuellement différé (la conséquence n'apparaît que plus tard)
//
// Un scénario qui n'utilise aucune de ces fonctionnalités continue de
// fonctionner exactement comme avant — tout est optionnel.

// Évalue une condition unique du type ">=3", "==true", "!=false", ou une
// valeur directe (nombre/booléen/chaîne) pour une égalité simple.
function evalSingleCondition(value, condition) {
  if (typeof condition === 'boolean' || typeof condition === 'number') {
    return value === condition
  }
  if (typeof condition === 'string') {
    const m = condition.match(/^(>=|<=|==|!=|>|<)\s*(.+)$/)
    if (!m) return value === condition
    const [, op, rawTarget] = m
    let target = rawTarget.trim()
    if (target === 'true') target = true
    else if (target === 'false') target = false
    else if (!isNaN(Number(target))) target = Number(target)
    const current = value === undefined ? 0 : value
    switch (op) {
      case '>=': return current >= target
      case '<=': return current <= target
      case '>': return current > target
      case '<': return current < target
      case '==': return current === target
      case '!=': return current !== target
      default: return false
    }
  }
  return false
}

// Un ensemble de conditions ({TRUST: ">=3", SECRET_FOUND: true}) doit être
// entièrement satisfait (ET logique) pour être valide. Un "requires" absent
// ou vide est toujours valide.
export function evaluateCondition(variables, requires) {
  if (!requires || Object.keys(requires).length === 0) return true
  return Object.entries(requires).every(([key, condition]) => evalSingleCondition(variables[key], condition))
}

// Applique les mutations d'un choix ("set": {"TRUST": "+1", "MONEY": 20,
// "SECRET_FOUND": true}) sur une copie des variables. "+1"/"-2" sont relatifs
// à la valeur actuelle (0 par défaut) ; toute autre valeur est posée telle quelle.
export function applyMutations(variables, set) {
  if (!set) return variables
  const next = { ...variables }
  Object.entries(set).forEach(([key, mutation]) => {
    if (typeof mutation === 'string' && /^[+-]\d+(\.\d+)?$/.test(mutation)) {
      next[key] = (next[key] || 0) + parseFloat(mutation)
    } else {
      next[key] = mutation
    }
  })
  return next
}

// Un nœud peut proposer plusieurs formulations ("variants") selon l'état des
// variables — c'est ce qui permet à un personnage de "se souvenir" du joueur.
// La première variante dont la condition "when" est vraie est utilisée ;
// une variante sans "when" (ou {}) sert de repli par défaut. Sans "variants",
// le texte de base du nœud est utilisé, comme avant.
export function resolveNodeText(node, variables) {
  if (node.variants && node.variants.length > 0) {
    const match = node.variants.find((v) => evaluateCondition(variables, v.when))
    if (match) return { text: match.text, text_fr: match.text_fr ?? node.text_fr }
  }
  return { text: node.text, text_fr: node.text_fr }
}

// Filtre les choix d'un nœud : un choix avec "requires" n'est proposé que si
// la condition est remplie (permet de réserver un choix à un joueur qui a
// découvert une information, gagné assez de confiance, etc.)
export function visibleChoices(node, variables) {
  return (node.choices || []).filter((c) => evaluateCondition(variables, c.requires))
}

// Construit le résumé "Ton parcours" affiché en fin de scénario, à partir des
// variables et d'une éventuelle carte de libellés humains fournie par le
// scénario (variable_labels: {TRUST: "Confiance"}). Générique : fonctionne
// pour n'importe quel scénario sans code spécifique.
export function buildJourneySummary(variables, variableLabels = {}) {
  return Object.entries(variables)
    .filter(([, value]) => value !== undefined && value !== null && value !== 0 && value !== false)
    .map(([key, value]) => ({
      label: variableLabels[key] || key,
      value: typeof value === 'boolean' ? (value ? 'Oui' : 'Non') : String(value),
    }))
    .slice(0, 5)
}
