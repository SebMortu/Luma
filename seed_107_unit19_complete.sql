-- ============================================
-- LUMA — Unité 19 (B1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : If it rains, I ___ stay home.", "options": ["will", "would", "am", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "First conditional : if + present, will + base."}'),
  (6, 'fill_blank', '{"sentence_before": "If you ", "sentence_after": " (study), you will pass.", "correct_answers": ["study"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"if\", on utilise le present simple."}'),
  (7, 'true_false', '{"statement": "The first conditional describes a realistic future possibility.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "have", "time,", "I''ll", "call", "you."], "correct_sentence": "If I have time, I''ll call you.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : If I ___ rich, I would travel.", "options": ["am", "was/were", "will be", "be"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Second conditional : if + past simple."}'),
  (6, 'fill_blank', '{"sentence_before": "If she ", "sentence_after": " (have) more time, she would learn piano.", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"if\" (second conditional), on utilise le past simple."}'),
  (7, 'true_false', '{"statement": "The second conditional describes a hypothetical or unlikely situation.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "won", "the", "lottery,", "I", "would", "travel."], "correct_sentence": "If I won the lottery, I would travel.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : If I ___ you, I would apologize.", "options": ["am", "was", "were", "will be"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Formule figée : \"If I were you\"."}'),
  (6, 'fill_blank', '{"sentence_before": "If I were you, I ", "sentence_after": " talk to her. (conseil)", "correct_answers": ["would"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Would\" complète le conseil hypothétique."}'),
  (7, 'true_false', '{"statement": "\"If I were you\" is used to give advice.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien utilisé pour conseiller."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "were", "you,", "I''d", "wait."], "correct_sentence": "If I were you, I''d wait.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Situation réaliste : \"If it ___ tomorrow, we''ll cancel.\"", "options": ["rains", "rained", "would rain", "will rain"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Réaliste = first conditional."}'),
  (6, 'fill_blank', '{"sentence_before": "If I ", "sentence_after": " (be) a bird, I would fly everywhere. (hypothétique impossible)", "correct_answers": ["were"], "feedback_correct": "Correct !", "feedback_incorrect": "Impossible/hypothétique = second conditional."}'),
  (7, 'true_false', '{"statement": "You choose the conditional based on how realistic the situation is.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien le critère de choix."}'),
  (8, 'matching', '{"instruction": "Relie la situation au bon conditionnel.", "pairs": [{"left": "If I win (réaliste)", "right": "first"}, {"left": "If I were a millionaire (hypothétique)", "right": "second"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Unless (à moins que)', '{"rule": "\"Unless\" équivaut à \"if not\" (sauf si/à moins que). Il s''utilise avec le present simple, comme le first conditional.", "table": [{"subject": "unless = if not", "affirmative": "Unless you hurry, you''ll be late. (= If you don''t hurry)", "negative": "—"}], "example": {"en": "I won''t go unless you come with me.", "fr": "Je n''irai pas à moins que tu viennes avec moi."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Unless\" équivaut à :", "options": ["if", "if not", "when", "because"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Unless\" = \"if not\"."}'),
  (2, 'qcm', '{"question": "Complète : ___ you apologize, she won''t forgive you.", "options": ["If", "Unless", "When", "Because"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Unless\" = à moins que."}'),
  (3, 'fill_blank', '{"sentence_before": "You won''t pass ", "sentence_after": " you study. (à moins que)", "correct_answers": ["unless"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À moins que\" = \"unless\"."}'),
  (4, 'true_false', '{"statement": "\"Unless\" is followed by the present simple, like \"if\" in the first conditional.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"unless\" suit bien la même règle temporelle."}'),
  (5, 'matching', '{"instruction": "Relie la phrase avec \"unless\" à son équivalent avec \"if\".", "pairs": [{"left": "Unless you hurry, you''ll be late.", "right": "If you don''t hurry, you''ll be late."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Unless", "it", "rains,", "we''ll", "go", "out."], "correct_sentence": "Unless it rains, we''ll go out.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I won''t come ___ you invite me properly.", "options": ["if", "unless", "because", "so"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Unless\" = à moins que."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " you leave now, you''ll miss the train. (à moins que)", "correct_answers": ["Unless"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À moins que\" = \"Unless\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'In case (au cas où)', '{"rule": "\"In case\" (au cas où) exprime une précaution prise pour anticiper un événement possible, avec le present simple.", "table": [{"subject": "in case + present", "affirmative": "Take an umbrella in case it rains.", "negative": "—"}], "example": {"en": "I''ll bring extra money in case we need it.", "fr": "J''apporterai de l''argent en plus au cas où on en aurait besoin."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"In case\" veut dire :", "options": ["Parce que", "Au cas où", "Bien que", "Sauf si"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"In case\" = au cas où."}'),
  (2, 'qcm', '{"question": "Complète : Take a jacket ___ it gets cold.", "options": ["in case", "unless", "if only", "so that"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Précaution = \"in case\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I''ll take my phone ", "sentence_after": " I need to call someone. (au cas où)", "correct_answers": ["in case"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Au cas où\" = \"in case\"."}'),
  (4, 'true_false', '{"statement": "\"In case\" is about anticipating a possible future event.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (5, 'matching', '{"instruction": "Relie la précaution à sa raison.", "pairs": [{"left": "Take an umbrella", "right": "in case it rains"}, {"left": "Bring your ID", "right": "in case they ask"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''ll", "bring", "a", "map", "in", "case", "we", "get", "lost."], "correct_sentence": "I''ll bring a map in case we get lost.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"In case\" est suivi de :", "options": ["will + base", "present simple", "past simple", "infinitif"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"In case\" est suivi du present simple."}'),
  (8, 'fill_blank', '{"sentence_before": "Save your work ", "sentence_after": " the computer crashes. (au cas où)", "correct_answers": ["in case"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Au cas où\" = \"in case\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'As long as / provided that (à condition que)', '{"rule": "\"As long as\" et \"provided that\" (à condition que) posent une condition nécessaire, souvent utilisés avec le present simple comme dans le first conditional.", "table": [{"subject": "as long as", "affirmative": "tant que/à condition que", "negative": "—"}, {"subject": "provided that", "affirmative": "à condition que (plus formel)", "negative": "—"}], "example": {"en": "You can go out as long as you finish your homework first.", "fr": "Tu peux sortir à condition de finir tes devoirs d''abord."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"As long as\" veut dire :", "options": ["Bien que", "À condition que", "Parce que", "Malgré"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"As long as\" = à condition que."}'),
  (2, 'qcm', '{"question": "\"Provided that\" est plutôt utilisé dans un registre :", "options": ["Familier", "Formel", "Enfantin", "Vulgaire"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Provided that\" est plus formel."}'),
  (3, 'fill_blank', '{"sentence_before": "You can borrow my car ", "sentence_after": " you drive carefully. (à condition que)", "correct_answers": ["as long as"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À condition que\" = \"as long as\"."}'),
  (4, 'true_false', '{"statement": "\"As long as\" and \"provided that\" express a necessary condition.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les deux expriment bien une condition."}'),
  (5, 'matching', '{"instruction": "Relie l''expression de condition à son registre.", "pairs": [{"left": "as long as", "right": "neutre"}, {"left": "provided that", "right": "formel"}, {"left": "as far as I''m concerned", "right": "opinion personnelle"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["You", "can", "stay", "as", "long", "as", "you", "want."], "correct_sentence": "You can stay as long as you want.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Provided that you agree, we''ll sign the contract.", "options": ["à condition que", "malgré", "bien que", "parce que"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Provided that\" = à condition que."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " you''re careful, it''s safe. (tant que/à condition que)", "correct_answers": ["As long as"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Tant que\" = \"As long as\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : tous les conditionnels et connecteurs conditionnels', '{"rule": "Cette leçon combine first et second conditional, unless, in case, as long as/provided that pour exprimer toutes les nuances de condition.", "table": [{"subject": "First (réaliste)", "affirmative": "If it rains, I''ll stay.", "negative": "—"}, {"subject": "Second (hypothétique)", "affirmative": "If I were rich, I would travel.", "negative": "—"}, {"subject": "Autres", "affirmative": "unless, in case, as long as", "negative": "—"}], "example": {"en": "I''ll come as long as it doesn''t rain. Unless something happens, I''ll be there by 8. I''ll bring an umbrella in case it does.", "fr": "Je viendrai tant qu''il ne pleut pas. À moins qu''il n''arrive quelque chose, je serai là à 8h. J''apporterai un parapluie au cas où."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 19 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If I ___ (have) wings, I would fly. (impossible)", "options": ["have", "had", "will have", "am having"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Situation impossible = second conditional : \"had\"."}'),
  (2, 'qcm', '{"question": "Complète : If you ___ (need) help, call me. (réaliste)", "options": ["need", "needed", "would need", "will need"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Situation réaliste = first conditional : present simple."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " you finish early, we can leave sooner. (à condition que)", "correct_answers": ["As long as", "Provided that"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À condition que\" = \"As long as\" ou \"Provided that\"."}'),
  (4, 'true_false', '{"statement": "\"Unless\", \"in case\", and \"as long as\" are all types of conditional connectors.", "correct_answer": true, "feedback_correct": "Exact, bilan complet réussi !", "feedback_incorrect": "Faux — ce sont bien tous des connecteurs conditionnels."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque connecteur à sa nuance.", "pairs": [{"left": "unless", "right": "sauf si"}, {"left": "in case", "right": "précaution"}, {"left": "as long as", "right": "condition nécessaire"}], "feedback_correct": "Parfait, bilan des conditionnels réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "were", "you,", "I", "would", "apologize."], "correct_sentence": "If I were you, I would apologize.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I''ll take a coat ___ it''s cold.", "options": ["in case", "unless", "as long as", "if only"], "correct_index": 0, "feedback_correct": "Correct ! Bilan complet réussi.", "feedback_incorrect": "Précaution = \"in case\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I won''t go ", "sentence_after": " you come with me. (à moins que)", "correct_answers": ["unless"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À moins que\" = \"unless\"."}')
) as v(position, type, content);
