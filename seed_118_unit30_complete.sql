-- ============================================
-- LUMA — Unité 30 (dernière de B2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I wish I ___ (be) taller. (présent)", "options": ["were", "am", "was going to be", "will be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Wish + présent irréel = past simple : \"were\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I wish I ", "sentence_after": " (know) the answer yesterday. (passé)", "correct_answers": ["had known"], "feedback_correct": "Correct !", "feedback_incorrect": "Wish + regret passé = past perfect."}'),
  (7, 'true_false', '{"statement": "\"Wish\" + past simple expresses a present regret.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "wish", "I", "had", "more", "time."], "correct_sentence": "I wish I had more time.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"If only\" a le même sens que :", "options": ["wish", "hope", "must", "will"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"If only\" = \"wish\", en plus insistant."}'),
  (6, 'fill_blank', '{"sentence_before": "If only I ", "sentence_after": " (be) there! (past simple, présent)", "correct_answers": ["were"], "feedback_correct": "Correct !", "feedback_incorrect": "\"If only\" + past simple pour le présent."}'),
  (7, 'true_false', '{"statement": "\"If only\" is more emphatic than \"wish\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"if only\" est bien plus insistant."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["If", "only", "I", "could", "help!"], "correct_sentence": "If only I could help!", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : I''d rather ___ (stay) home tonight.", "options": ["stay", "to stay", "staying", "stayed"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Would rather\" (même sujet) + base verbale : \"stay\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I''d rather ", "sentence_after": " coffee than tea. (have)", "correct_answers": ["have"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Would rather\" + base verbale."}'),
  (7, 'true_false', '{"statement": "\"Would rather\" with the same subject is followed by the base verb form.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien suivi de la base verbale."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''d", "rather", "walk", "than", "drive."], "correct_sentence": "I''d rather walk than drive.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : You ___ hurry, the train leaves soon.", "options": ["had better", "would rather", "wish", "if only"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Conseil urgent = \"had better\"."}'),
  (6, 'fill_blank', '{"sentence_before": "You had better ", "sentence_after": " that now. (fix)", "correct_answers": ["fix"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Had better\" + base verbale."}'),
  (7, 'true_false', '{"statement": "\"Had better\" implies a negative consequence if not followed.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son implication."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["You", "had", "better", "leave", "now."], "correct_sentence": "You had better leave now.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Wish + would (irritation face à autrui)', '{"rule": "\"Wish + would\" exprime une irritation ou un souhait de changement de comportement chez une autre personne (jamais pour soi-même).", "table": [{"subject": "wish + would", "affirmative": "I wish you would stop shouting.", "negative": "—"}], "example": {"en": "I wish he would call me back. I wish they would be quiet.", "fr": "J''aimerais qu''il me rappelle. J''aimerais qu''ils se taisent."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I wish you would listen\" exprime :", "options": ["De la joie", "De l''irritation/un souhait de changement", "De la certitude", "De l''indifférence"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wish + would\" exprime l''irritation."}'),
  (2, 'qcm', '{"question": "\"Wish + would\" s''utilise généralement pour :", "options": ["Soi-même", "Une autre personne", "Un objet", "Le passé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wish + would\" concerne le comportement d''autrui."}'),
  (3, 'fill_blank', '{"sentence_before": "I wish she ", "sentence_after": " stop complaining. (would)", "correct_answers": ["would"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Wish + would\" pour l''irritation."}'),
  (4, 'true_false', '{"statement": "\"I wish I would be taller\" is correct English.", "correct_answer": false, "feedback_correct": "Exact — pour soi-même, on utilise \"wish + past simple\" (were).", "feedback_incorrect": "Faux — pour soi-même, c''est \"I wish I were taller\"."}'),
  (5, 'matching', '{"instruction": "Relie l''usage à la bonne structure wish.", "pairs": [{"left": "Regret sur soi (présent)", "right": "wish + past simple"}, {"left": "Irritation envers autrui", "right": "wish + would"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "wish", "you", "would", "be", "on", "time."], "correct_sentence": "I wish you would be on time.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I wish it ___ stop raining.", "options": ["would", "will", "were", "had"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Wish + would\" pour souhaiter un changement."}'),
  (8, 'fill_blank', '{"sentence_before": "I wish my neighbors ", "sentence_after": " turn down the music. (would)", "correct_answers": ["would"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Wish + would\" = irritation."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Would rather + past simple (préférence sur autrui)', '{"rule": "Quand \"would rather\" concerne le comportement d''une AUTRE personne, on utilise le past simple, même pour parler du présent/futur (comme wish + would).", "table": [{"subject": "would rather + sujet différent + past simple", "affirmative": "I''d rather you called me tomorrow.", "negative": "—"}], "example": {"en": "I''d rather you didn''t smoke here. I''d rather she stayed a bit longer.", "fr": "Je préférerais que tu ne fumes pas ici. Je préférerais qu''elle reste un peu plus longtemps."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I''d rather you ___ (not, tell) him yet.", "options": ["didn''t tell", "don''t tell", "not to tell", "not telling"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Sujet différent + past simple négatif."}'),
  (2, 'qcm', '{"question": "Pourquoi utilise-t-on le past simple ici, malgré un sens présent ?", "options": ["Erreur fréquente", "Structure standard avec sujet différent", "C''est optionnel", "Ça ne s''utilise jamais ainsi"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "C''est bien la structure standard, comme wish + would."}'),
  (3, 'fill_blank', '{"sentence_before": "I''d rather you ", "sentence_after": " (ask) me first. (asked)", "correct_answers": ["asked"], "feedback_correct": "Correct !", "feedback_incorrect": "Sujet différent + past simple : \"asked\"."}'),
  (4, 'true_false', '{"statement": "\"I''d rather you left\" and \"I''d rather leave\" have the same subject structure.", "correct_answer": false, "feedback_correct": "Exact — le premier concerne une autre personne, le second soi-même.", "feedback_incorrect": "Faux — les structures diffèrent selon le sujet concerné."}'),
  (5, 'matching', '{"instruction": "Relie la structure au bon contexte.", "pairs": [{"left": "I''d rather stay (moi-même)", "right": "base verbale"}, {"left": "I''d rather you stayed (autrui)", "right": "past simple"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''d", "rather", "you", "didn''t", "go", "alone."], "correct_sentence": "I''d rather you didn''t go alone.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I''d rather she ___ (arrive) earlier next time.", "options": ["arrived", "arrives", "arrive", "to arrive"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Sujet différent + past simple : \"arrived\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I''d rather you ", "sentence_after": " (not, worry) about it. (didn''t worry)", "correct_answers": ["didn''t worry"], "feedback_correct": "Correct !", "feedback_incorrect": "Sujet différent, négatif + past simple."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Suppose et supposing (hypothèse)', '{"rule": "\"Suppose\" et \"supposing\" (imaginons/à supposer que) introduisent une hypothèse, souvent au début de phrase, suivis du present simple (réaliste) ou du past simple (hypothétique).", "table": [{"subject": "Suppose/Supposing + present", "affirmative": "Suppose it rains, what will we do?", "negative": "—"}, {"subject": "Suppose/Supposing + past", "affirmative": "Suppose you won the lottery, what would you do?", "negative": "—"}], "example": {"en": "Suppose you lost your job, what would you do? Supposing it''s true, what should we do?", "fr": "Imagine que tu perdes ton emploi, que ferais-tu ? À supposer que ce soit vrai, que devrions-nous faire ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Suppose\" en début de phrase introduit :", "options": ["Une certitude", "Une hypothèse", "Un ordre", "Un regret"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Suppose\" introduit une hypothèse."}'),
  (2, 'qcm', '{"question": "Complète : Suppose you ___ (win) the lottery, what would you do?", "options": ["won", "win", "would win", "have won"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Hypothèse improbable = past simple : \"won\"."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " it rains tomorrow, will you still come? (imagine, réaliste)", "correct_answers": ["Suppose", "Supposing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Imagine que\" = \"Suppose\" ou \"Supposing\"."}'),
  (4, 'true_false', '{"statement": "\"Suppose\" and \"supposing\" work similarly to \"if\" to introduce hypotheses.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — ils fonctionnent bien comme \"if\"."}'),
  (5, 'matching', '{"instruction": "Relie la structure hypothétique à son équivalent avec \"if\".", "pairs": [{"left": "Suppose you won...", "right": "If you won..."}, {"left": "Supposing it''s true...", "right": "If it''s true..."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Suppose", "you", "had", "more", "time,", "what", "would", "you", "do?"], "correct_sentence": "Suppose you had more time, what would you do?", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Supposing she ___ (be) here, what would you say?", "options": ["were", "is", "will be", "was going to be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Hypothèse = past simple : \"were\"."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " we''re wrong about this, what then? (à supposer que)", "correct_answers": ["Suppose", "Supposing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À supposer que\" = \"Suppose\" ou \"Supposing\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan final B2 : toutes les structures hypothétiques avancées', '{"rule": "Cette dernière leçon du niveau B2 combine wish/if only (regrets), would rather/had better (préférences et conseils), wish+would (irritation), et suppose/supposing (hypothèses) — un vrai bilan avant le niveau C1.", "table": [{"subject": "Regret", "affirmative": "wish, if only", "negative": "—"}, {"subject": "Préférence/conseil", "affirmative": "would rather, had better", "negative": "—"}, {"subject": "Hypothèse", "affirmative": "suppose, supposing", "negative": "—"}], "example": {"en": "I wish I had studied harder. I''d rather focus on the future now. You''d better start preparing. Suppose you fail, what''s your plan B?", "fr": "J''aurais aimé étudier davantage. Je préfère me concentrer sur l''avenir maintenant. Tu ferais mieux de commencer à te préparer. Imagine que tu échoues, quel est ton plan B ?"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 30 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I wish I ___ (know) then what I know now.", "options": ["had known", "knew", "know", "would know"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Regret passé = wish + past perfect."}'),
  (2, 'qcm', '{"question": "Complète : You ___ apologize before it''s too late.", "options": ["had better", "would rather", "wish", "suppose"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Conseil urgent = \"had better\"."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " you lost everything, what would you do? (imagine)", "correct_answers": ["Suppose", "Supposing"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Imagine\" = \"Suppose\" ou \"Supposing\"."}'),
  (4, 'true_false', '{"statement": "This unit''s structures all express hypothetical, unreal, or preferred situations.", "correct_answer": true, "feedback_correct": "Exact, bravo, tu as terminé le niveau B2 !", "feedback_incorrect": "Faux — c''est bien leur point commun."}'),
  (5, 'matching', '{"instruction": "Bilan B2 : relie chaque structure à sa fonction.", "pairs": [{"left": "wish/if only", "right": "regret"}, {"left": "had better", "right": "conseil urgent"}, {"left": "suppose", "right": "hypothèse"}], "feedback_correct": "Parfait, félicitations pour avoir terminé B2 !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I''d", "rather", "you", "told", "me", "the", "truth."], "correct_sentence": "I''d rather you told me the truth.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I wish he ___ stop interrupting me.", "options": ["would", "will", "were", "had"], "correct_index": 0, "feedback_correct": "Correct ! Bravo, tu as terminé le niveau B2 !", "feedback_incorrect": "Irritation envers autrui = \"wish + would\"."}'),
  (8, 'fill_blank', '{"sentence_before": "If only I ", "sentence_after": " have said something different! (avais pu)", "correct_answers": ["could"], "feedback_correct": "Correct ! Félicitations pour avoir terminé le niveau B2 !", "feedback_incorrect": "\"If only\" + \"could have\" = regret d''une capacité passée."}')
) as v(position, type, content);
