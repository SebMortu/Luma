-- ============================================
-- LUMA — Correctifs : audit complet des 36 unités (lecture des 26 restantes)
-- ============================================

-- 1) Question QCM tronquée (Unité 4, A1) — il manquait le nom après le blanc
update exercises
set content = jsonb_set(content, '{question}', '"Complète : This is ___ book."'::jsonb)
where content->>'question' = 'Complète : This is ';

-- 2) Indice incohérent avec la réponse attendue (Unité 35, C1)
-- L'indice parlait de "wanna" (want to) alors que la réponse testée est "Have"
update exercises
set content = jsonb_set(content, '{sentence_after}', '" you eaten yet? (forme informelle à l''oral : \"Ya eaten yet?\")"'::jsonb)
where content->>'sentence_after' like '% you eaten yet? (wanna=want to%';

-- ============================================
-- VÉRIFICATION
-- ============================================
-- select content from exercises where content->>'question' like 'Complète : This is%';
-- select content from exercises where content->>'sentence_after' like '%eaten yet%';
