-- ============================================
-- LUMA — Audit "Apprendre" (Examens) : bug de construction dans le Test TOEIC 2
-- "___ despite the heavy rain, the match continued." avec "Despite" comme
-- réponse correcte produit littéralement "Despite despite the heavy rain"
-- une fois complété — le mot était déjà présent dans la phrase fixe.
-- ============================================

update toeic_tests
set questions = jsonb_set(
  questions,
  '{part_a}',
  (
    select jsonb_agg(
      case
        when q->>'question' = 'Complète : ___ despite the heavy rain, the match continued.'
          then jsonb_set(q, '{question}', '"Complète : ___ the heavy rain, the match continued."')
        else q
      end
    )
    from jsonb_array_elements(questions->'part_a') as q
  )
)
where title = 'Test type TOEIC-like — Niveau 2';
