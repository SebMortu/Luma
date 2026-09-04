-- ============================================
-- LUMA — Assouplit la distinction may/might (matching A2)
-- Retire la hiérarchie stricte de probabilité contestable, garde la
-- nuance réelle (might = plus prudent/hypothétique) sans l'affirmer
-- comme moins probable.
-- ============================================

update exercises
set content = '{"instruction": "Relie le modal à son usage.", "pairs": [{"left": "will", "right": "certain"}, {"left": "may", "right": "possible (neutre)"}, {"left": "might", "right": "possible (plus hypothétique)"}], "feedback_correct": "Parfait !", "feedback_incorrect": "''May'' et ''might'' expriment tous deux une possibilité — ''might'' est simplement un peu plus prudent/hypothétique, pas moins probable."}'::jsonb
where type = 'matching'
and content->>'instruction' = 'Relie le modal à son degré de certitude.';
