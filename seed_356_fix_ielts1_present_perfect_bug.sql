-- ============================================
-- LUMA — Audit "Apprendre" (Examens) : erreur grammaticale IELTS Test 1
-- "My neighbor ___ moved to Australia last month." avec "has" (present perfect)
-- marqué correct viole la règle enseignée par l'app elle-même : le present
-- perfect est incompatible avec un marqueur temporel précis ("last month").
-- Fix : retire "last month", rendant "has moved" correct (changement/résultat,
-- sans marqueur temporel précis en conflit).
-- ============================================

update toeic_tests
set questions = jsonb_set(
  questions,
  '{part_a}',
  (
    select jsonb_agg(
      case
        when q->>'question' = 'Complète : My neighbor ___ moved to Australia last month.'
          then jsonb_set(q, '{question}', '"Complète : My neighbor ___ moved to Australia."')
        else q
      end
    )
    from jsonb_array_elements(questions->'part_a') as q
  )
)
where title = 'IELTS-like — Test 1';
