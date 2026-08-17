-- ============================================
-- LUMA — Unité 25 (B2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : If I had known, I ___ have called you.", "options": ["would", "will", "am", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Third conditional : \"would have\"."}'),
  (6, 'fill_blank', '{"sentence_before": "If she ", "sentence_after": " (study), she would have passed. (past perfect)", "correct_answers": ["had studied"], "feedback_correct": "Correct !", "feedback_incorrect": "Après \"if\" au third conditional : past perfect."}'),
  (7, 'true_false', '{"statement": "The third conditional talks about an unreal past situation.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "had", "known,", "I", "would", "have", "helped."], "correct_sentence": "If I had known, I would have helped.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : If I had studied medicine, I ___ a doctor now.", "options": ["would be", "would have been", "will be", "am"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Condition passée, conséquence présente : \"would be\"."}'),
  (6, 'fill_blank', '{"sentence_before": "If she had taken that job, she ", "sentence_after": " in New York now.", "correct_answers": ["would live", "would be living"], "feedback_correct": "Correct !", "feedback_incorrect": "Conséquence au présent : \"would live\"."}'),
  (7, 'true_false', '{"statement": "Mixed conditionals combine a past condition with a present result.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien leur définition."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "hadn''t", "moved,", "I''d", "still", "be", "there."], "correct_sentence": "If I hadn''t moved, I''d still be there.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : If I weren''t so busy, I ___ have missed the meeting.", "options": ["wouldn''t", "won''t", "don''t", "didn''t"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Condition présente, résultat passé : \"wouldn''t have\"."}'),
  (6, 'fill_blank', '{"sentence_before": "If he ", "sentence_after": " lazy, he would have finished the project. (weren''t, condition présente)", "correct_answers": ["weren''t"], "feedback_correct": "Correct !", "feedback_incorrect": "Condition présente irréelle : \"weren''t\"."}'),
  (7, 'true_false', '{"statement": "This type combines a present condition with a past result.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien cette combinaison."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "I", "weren''t", "afraid,", "I", "would", "have", "tried."], "correct_sentence": "If I weren''t afraid, I would have tried.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I wish I ___ (study) harder.", "options": ["had studied", "studied", "have studied", "study"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Regret passé = \"wish\" + past perfect."}'),
  (6, 'fill_blank', '{"sentence_before": "If only I ", "sentence_after": " listened to you! (avais)", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "\"If only\" + past perfect : \"had listened\"."}'),
  (7, 'true_false', '{"statement": "\"Wish\" + past perfect expresses regret about the past.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "wish", "I", "had", "known", "earlier."], "correct_sentence": "I wish I had known earlier.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Zero conditional : les vérités générales', '{"rule": "Le zero conditional (if + present, present) exprime des vérités générales, des faits scientifiques ou des habitudes systématiques — pas d''hypothèse, juste une règle vraie.", "table": [{"subject": "if + present, present", "affirmative": "If you heat water, it boils.", "negative": "—"}], "example": {"en": "If you mix blue and yellow, you get green.", "fr": "Si tu mélanges du bleu et du jaune, tu obtiens du vert."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If you heat ice, it ___.", "options": ["melts", "will melt", "melted", "would melt"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Vérité générale = zero conditional : present + present."}'),
  (2, 'qcm', '{"question": "Le zero conditional exprime :", "options": ["Une hypothèse improbable", "Une vérité générale", "Un regret", "Un ordre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le zero conditional exprime des vérités générales."}'),
  (3, 'fill_blank', '{"sentence_before": "If you don''t water plants, they ", "sentence_after": ". (die)", "correct_answers": ["die"], "feedback_correct": "Correct !", "feedback_incorrect": "Zero conditional : present simple."}'),
  (4, 'true_false', '{"statement": "The zero conditional can be replaced by \"when\" without changing the meaning.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"when\" fonctionne bien de la même façon ici."}'),
  (5, 'matching', '{"instruction": "Relie la situation au bon conditionnel.", "pairs": [{"left": "Fait scientifique", "right": "zero conditional"}, {"left": "Situation future réaliste", "right": "first conditional"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "you", "freeze", "water,", "it", "becomes", "ice."], "correct_sentence": "If you freeze water, it becomes ice.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : If people don''t eat, they ___ hungry.", "options": ["get", "will get", "got", "would get"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Vérité générale = present + present."}'),
  (8, 'fill_blank', '{"sentence_before": "If the sun ", "sentence_after": " (set), it gets dark.", "correct_answers": ["sets"], "feedback_correct": "Correct !", "feedback_incorrect": "Zero conditional : present simple \"sets\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Would rather et it''s time (structures hypothétiques)', '{"rule": "\"Would rather + past simple\" (préférerait que) et \"it''s time + past simple\" (il est temps que) utilisent étonnamment le passé pour parler du présent/futur, comme wish.", "table": [{"subject": "would rather + past", "affirmative": "I''d rather you left now.", "negative": "—"}, {"subject": "it''s time + past", "affirmative": "It''s time we left.", "negative": "—"}], "example": {"en": "I''d rather you called me tomorrow. It''s time you grew up.", "fr": "Je préférerais que tu m''appelles demain. Il est temps que tu grandisses."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I''d rather you ___ (call) me later.", "options": ["called", "call", "calling", "to call"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Would rather + sujet\" + past simple."}'),
  (2, 'qcm', '{"question": "\"It''s time we left\" utilise quel temps après \"time\" ?", "options": ["Present", "Past simple", "Future", "Present perfect"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"It''s time\" + past simple, malgré le sens présent/futur."}'),
  (3, 'fill_blank', '{"sentence_before": "It''s time you ", "sentence_after": " (start) working. (past simple)", "correct_answers": ["started"], "feedback_correct": "Correct !", "feedback_incorrect": "\"It''s time\" + past simple : \"started\"."}'),
  (4, 'true_false', '{"statement": "\"Would rather you did\" refers to the present or future, despite using past tense.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien le cas, malgré la forme passée."}'),
  (5, 'matching', '{"instruction": "Relie la structure à son sens.", "pairs": [{"left": "I''d rather you left.", "right": "je préférerais que tu partes"}, {"left": "It''s time you left.", "right": "il est temps que tu partes"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''d", "rather", "you", "stayed", "here."], "correct_sentence": "I''d rather you stayed here.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : It''s time we ___ (make) a decision.", "options": ["made", "make", "making", "to make"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"It''s time\" + past simple : \"made\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I''d rather he ", "sentence_after": " (not, know) about this. (didn''t know)", "correct_answers": ["didn''t know"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Would rather\" négatif + past simple : \"didn''t know\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Nuancer un regret avec l''intensité', '{"rule": "On peut nuancer l''intensité d''un regret avec \"really\", \"deeply\", ou au contraire l''atténuer avec \"a bit\", \"slightly\", combinés à wish/if only.", "table": [{"subject": "Fort", "affirmative": "I really wish I had gone.", "negative": "—"}, {"subject": "Léger", "affirmative": "I sort of wish I had gone.", "negative": "—"}], "example": {"en": "I really wish I hadn''t said that. I sort of wish I had stayed longer.", "fr": "J''aurais vraiment aimé ne pas dire ça. J''aurais un peu aimé rester plus longtemps."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I really wish\" exprime un regret :", "options": ["Léger", "Intense", "Inexistant", "Futur"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Really wish\" intensifie le regret."}'),
  (2, 'qcm', '{"question": "\"I sort of wish\" exprime un regret :", "options": ["Très fort", "Nuancé/léger", "Impossible", "Certain"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Sort of\" nuance/atténue le regret."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " wish I had taken that job! (vraiment)", "correct_answers": ["really"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Vraiment\" = \"really\"."}'),
  (4, 'true_false', '{"statement": "Adverbs can intensify or soften the expression of regret.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien leur fonction ici."}'),
  (5, 'matching', '{"instruction": "Relie l''adverbe à son intensité.", "pairs": [{"left": "deeply", "right": "fort"}, {"left": "kind of", "right": "léger"}, {"left": "genuinely", "right": "sincère/fort"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "deeply", "regret", "not", "calling", "her."], "correct_sentence": "I deeply regret not calling her.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I ___ wish things had gone differently.", "options": ["deeply", "barely", "hardly", "never"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Deeply\" intensifie le regret."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " wish I had traveled more. (un peu, léger)", "correct_answers": ["sort of", "kind of"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Sort of\"/\"kind of\" atténue le regret."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : tous les conditionnels et structures hypothétiques', '{"rule": "Cette leçon combine zero, first, second, third et mixed conditionals, plus wish/if only/would rather pour une maîtrise complète de l''hypothèse en anglais.", "table": [{"subject": "Zero", "affirmative": "If + present, present (vérité)", "negative": "—"}, {"subject": "First/Second/Third", "affirmative": "réaliste / hypothétique / passé irréel", "negative": "—"}, {"subject": "Mixed", "affirmative": "combine deux époques", "negative": "—"}], "example": {"en": "If I had studied law, I would be a lawyer now. I wish I had made different choices, but if only life were that simple.", "fr": "Si j''avais étudié le droit, je serais avocat maintenant. J''aurais aimé faire des choix différents, mais si seulement la vie était si simple."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 25 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : If water reaches 100°C, it ___. (vérité)", "options": ["boils", "will boil", "boiled", "would boil"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Vérité générale = zero conditional."}'),
  (2, 'qcm', '{"question": "Complète : If I had left earlier, I ___ late now. (mixed, passé→présent)", "options": ["wouldn''t be", "wouldn''t have been", "won''t be", "am not"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Résultat présent = \"wouldn''t be\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I wish I ", "sentence_after": " more time. (avais, regret présent)", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "Regret présent = wish + past simple."}'),
  (4, 'true_false', '{"statement": "Mixed conditionals let you combine a past condition with a present consequence, or vice versa.", "correct_answer": true, "feedback_correct": "Exact, bilan des conditionnels complet !", "feedback_incorrect": "Faux — c''est bien leur fonction."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque conditionnel à son exemple.", "pairs": [{"left": "Zero", "right": "If you heat ice, it melts."}, {"left": "Third", "right": "If I had known, I would have helped."}, {"left": "Mixed", "right": "If I had studied, I''d be a doctor now."}], "feedback_correct": "Parfait, bilan des conditionnels réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "only", "I", "had", "listened", "to", "you."], "correct_sentence": "If only I had listened to you.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : If she weren''t so shy, she ___ have spoken up. (mixed, présent→passé)", "options": ["would", "will", "had", "has"], "correct_index": 0, "feedback_correct": "Correct ! Bilan des conditionnels réussi.", "feedback_incorrect": "Résultat passé = \"would have spoken\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I''d rather you ", "sentence_after": " me the truth. (told, past simple)", "correct_answers": ["told"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Would rather\" + past simple : \"told\"."}')
) as v(position, type, content);
