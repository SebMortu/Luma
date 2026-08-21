-- ============================================
-- LUMA — Branchement des vraies illustrations de la mascotte (Echo)
-- Fichiers servis directement depuis /public/mascot/ (pas de stockage externe
-- nécessaire pour un petit jeu d'images fixes qui fait partie de l'app).
-- ============================================

-- Bonus reçu en plus des 6 états prévus : une pose "écoute" qui ne correspond
-- à aucun état existant. On la garde en réserve pour un usage futur (ex. un
-- écran d'exercice d'écoute dédié), sans l'attacher nulle part pour l'instant.
alter table characters add column if not exists image_listening_url text;

update characters
set
  image_neutral_url = '/mascot/neutral.webp',
  image_happy_url = '/mascot/happy.webp',
  image_thinking_url = '/mascot/thinking.webp',
  image_sad_url = '/mascot/sad.webp',
  image_celebrating_url = '/mascot/celebrating.webp',
  image_waving_url = '/mascot/waving.webp',
  image_listening_url = '/mascot/listening.webp'
where slug = 'mascot';
