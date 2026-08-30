-- ============================================
-- LUMA — Nettoyage de la file de révision espacée
-- Beaucoup d'entrées provenaient de lignes de résumé/règle des tableaux de
-- leçon (conjugaisons groupées, plages de nombres, notes de grammaire),
-- inutilisables comme flashcards de vocabulaire isolé. Même filtre que celui
-- désormais appliqué côté code pour les futures leçons complétées.
-- ============================================

delete from user_review_queue
where content_en like '%/%'                                    -- ex: "He/She/It"
   or content_en ~ '^\d+\s*-\s*\d+$'                             -- ex: "13-19"
   or (length(content_fr) - length(replace(content_fr, ',', ''))) >= 2  -- liste de plusieurs éléments
   or lower(content_en) in ('règle', 'ex.', 'ex', 'astuce', 'notez', 'attention', 'rappel');

-- Pour vérifier combien de lignes ont été retirées :
-- (le message de Supabase après exécution indique le nombre de lignes affectées)
