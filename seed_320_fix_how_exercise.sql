-- ============================================
-- LUMA — Fix : l'exercice "How are you?" en fill_blank demandait de deviner
-- un mot jamais montré au préalable (juste un indice français), trop exigeant
-- pour un vrai débutant en toute première leçon. Converti en QCM (reconnaissance).
-- ============================================

update exercises
set type = 'qcm',
    content = jsonb_build_object(
      'question', 'Complète : ___ are you? (Comment vas-tu ?)',
      'options', jsonb_build_array('How', 'What', 'Who', 'Where'),
      'correct_index', 0,
      'feedback_correct', 'Correct ! "How are you?" est une façon très courante de demander comment ça va.',
      'feedback_incorrect', 'On utilise "How" pour demander comment ça va : "How are you?"'
    )
where content->>'sentence_after' = ' are you? (Comment vas-tu ?)';
