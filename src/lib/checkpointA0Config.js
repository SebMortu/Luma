// checkpointA0Config.js
// SOURCE UNIQUE (runtime) du mapping exercice -> compétence, pour le
// diagnostic session-only du Checkpoint A0.
//
// HONNÊTETÉ SUR L'ORIGINE (point 14 de la revue) : ce fichier n'est PAS
// généré automatiquement par un script Python->JS -- aucun mécanisme de
// ce type n'existe. C'est un fichier maintenu à la main, dont la source
// de vérité conceptuelle reste build_checkpoint.py (dans les sources
// pédagogiques), mais SANS synchronisation automatique.
//
// Garde-fou minimal : un test de cohérence (voir F_tests) vérifie que
// les positions couvertes ici correspondent exactement aux 16 exercices
// notés (tout sauf EX14, volontairement exclu -- voir plus bas), sur
// les 17 réels. Si le contenu pédagogique change un jour (nouvel
// EX01-EX17), CE FICHIER devra être mis à jour manuellement en miroir --
// ce garde-fou permet au moins de détecter un oubli, pas de l'empêcher
// automatiquement.
//
// EX14 (position 14, réceptif "Here you are.") est volontairement ABSENT
// de ce mapping : il participe au score global (géré nativement par
// Lesson.jsx via `results`), mais jamais au diagnostic de compétences
// (point 12 de la revue).
//
// 1a / 1b / 1c ne sont PAS trois compétences : ce sont trois sous-preuves
// de la compétence unique '1' (point 11) -- déjà fusionnées ci-dessous,
// computeDiagnostic() ne voit jamais 1a/1b/1c séparément.

export const CHECKPOINT_A0_MAPPING = [
  {
    "position": 1,
    "competence": "1"
  },
  {
    "position": 2,
    "competence": "2"
  },
  {
    "position": 3,
    "competence": "3"
  },
  {
    "position": 4,
    "competence": "4"
  },
  {
    "position": 5,
    "competence": "9"
  },
  {
    "position": 6,
    "competence": "5"
  },
  {
    "position": 7,
    "competence": "6"
  },
  {
    "position": 8,
    "competence": "6"
  },
  {
    "position": 9,
    "competence": "8"
  },
  {
    "position": 10,
    "competence": "8"
  },
  {
    "position": 11,
    "competence": "1"
  },
  {
    "position": 12,
    "competence": "7"
  },
  {
    "position": 13,
    "competence": "7"
  },
  {
    "position": 15,
    "competence": "2"
  },
  {
    "position": 16,
    "competence": "1"
  },
  {
    "position": 17,
    "competence": "8"
  }
]

export const CHECKPOINT_A0_COMPETENCIES = {
  '1': { label: "Gérer les formules sociales essentielles (accueil, attention, remerciement)" },
  '2': { label: "Signaler une incompréhension" },
  '3': { label: "Se présenter" },
  '4': { label: "Présenter un proche" },
  '5': { label: "Exprimer une préférence" },
  '6': { label: "Exprimer une envie / demander poliment" },
  '7': { label: "Localiser un élément essentiel" },
  '8': { label: "Signaler qu'un objet manque" },
  '9': { label: "Utiliser un nombre en contexte" },
}

// Logique de statut -- calculée en mémoire à la fin de la session,
// jamais persistée en base (V1 session-only).
//
// Règle explicite pour la compétence '1' (point 11) : ses 3 sous-preuves
// (1a/1b/1c, désormais fondues en une seule entrée '1' dans le mapping
// ci-dessus) suivent la MÊME logique multi-preuves que toute compétence
// à plusieurs observations -- pas de règle spéciale à coder séparément,
// la fusion en amont suffit.
export function computeDiagnostic(answersByPosition) {
  const byCompetence = {}
  for (const item of CHECKPOINT_A0_MAPPING) {
    const comp = item.competence
    if (!byCompetence[comp]) byCompetence[comp] = []
    byCompetence[comp].push(Boolean(answersByPosition[item.position]))
  }
  const result = {}
  for (const [comp, results] of Object.entries(byCompetence)) {
    const successCount = results.filter(Boolean).length
    if (results.length === 1) {
      result[comp] = successCount === 1 ? 'INDICE_POSITIF' : 'NON_CONCLUANT'
    } else {
      if (successCount === results.length) result[comp] = 'MAITRISE'
      else if (successCount === 0) result[comp] = 'A_REVOIR'
      else result[comp] = 'FRAGILE'
    }
  }
  return result
}
