-- ============================================
-- LUMA — Audit expert C1 : 2 indices trompeurs/orphelins corrigés
-- (les réponses elles-mêmes étaient correctes, seuls les indices entre
-- parenthèses ne correspondaient pas à l'exercice)
-- ============================================

update exercises
set content = jsonb_set(content, '{sentence_after}', '" I be late, please start without me. (cas hypothétique, registre soutenu)"')
where type = 'fill_blank'
and content->>'sentence_after' = ' I be late, please start without me. (Were, littéraire)';

update exercises
set content = jsonb_set(content, '{sentence_after}', '" you eaten yet? (forme standard écrite)"')
where type = 'fill_blank'
and content->>'sentence_after' = ' you eaten yet? (wanna=want to, à l''oral: "Ya")';
