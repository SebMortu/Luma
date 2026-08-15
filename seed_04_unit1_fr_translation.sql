-- ============================================
-- LUMA — Correction linguistique de l'Unité 1 (niveau A1)
-- Seuls les exercices vrai/faux étaient en anglais par erreur — on les repasse en français
-- (les QCM et textes à trous étaient déjà corrects, en français)
-- ============================================

-- Leçon 1.1 (to be)
update exercises set content = jsonb_set(content, '{statement}', '"\"He are my brother\" est grammaticalement correct."')
where lesson_id = (select l.id from lessons l join units u on u.id = l.unit_id join languages lg on lg.id = u.language_id where lg.code='en' and u.position=1 and l.position=1)
  and position = 4;

-- Leçon 1.2 (pronoms/salutations)
update exercises set content = jsonb_set(content, '{statement}', '"\"Hi\" est plus formel que \"Good morning\"."')
where lesson_id = (select l.id from lessons l join units u on u.id = l.unit_id join languages lg on lg.id = u.language_id where lg.code='en' and u.position=1 and l.position=2)
  and position = 4;

-- Leçon 1.3 (alphabet/prononciation) — celui que tu as repéré
update exercises set content = jsonb_set(content, '{statement}', '"Le \"h\" en anglais est généralement muet, comme en français."')
where lesson_id = (select l.id from lessons l join units u on u.id = l.unit_id join languages lg on lg.id = u.language_id where lg.code='en' and u.position=1 and l.position=3)
  and position = 1;

-- Leçon 1.4 (se présenter)
update exercises set content = jsonb_set(content, '{statement}', '"En anglais, il faut toujours un article (a/an) devant une profession, contrairement au français."')
where lesson_id = (select l.id from lessons l join units u on u.id = l.unit_id join languages lg on lg.id = u.language_id where lg.code='en' and u.position=1 and l.position=4)
  and position = 4;

-- Exemple d'ajout du bouton "Traduire" sur le premier exercice de la leçon 1.1
-- (juste pour vérifier que le mécanisme fonctionne — on en ajoutera plus lors des prochains imports)
update exercises set content = content || '{"question_fr": "Complète : She ___ tired. (Elle est fatiguée)"}'::jsonb
where lesson_id = (select l.id from lessons l join units u on u.id = l.unit_id join languages lg on lg.id = u.language_id where lg.code='en' and u.position=1 and l.position=1)
  and position = 1;
