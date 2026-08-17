-- ============================================
-- LUMA — Unité 33 (C1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : It was John ___ broke the vase.", "options": ["who", "which", "that only", "whose"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "It-cleft avec une personne : \"who\" (ou \"that\")."}'),
  (6, 'fill_blank', '{"sentence_before": "It ", "sentence_after": " the manager who approved the budget. (was)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "\"It was\" + élément mis en relief."}'),
  (7, 'true_false', '{"statement": "The it-cleft structure emphasizes a specific part of the sentence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien sa fonction."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "was", "Sarah", "who", "called."], "correct_sentence": "It was Sarah who called.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : ___ I need is more time.", "options": ["What", "It", "That", "Which"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "What-cleft : \"What I need is...\""}'),
  (6, 'fill_blank', '{"sentence_before": "What surprised me ", "sentence_after": " his honesty. (was)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "\"What... was\" — structure what-cleft."}'),
  (7, 'true_false', '{"statement": "The what-cleft structure starts with \"What\" and puts the focus at the end.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien sa structure."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["What", "I", "want", "is", "peace."], "correct_sentence": "What I want is peace.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Pour corriger \"It was Tom who called\" → en réalité c''était Sam, on dit :", "options": ["It was Sam who called, not Tom.", "It was Tom who called, actually.", "Tom called, who was Sam.", "Sam who called was Tom."], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "L''it-cleft permet de corriger l''information mise en avant."}'),
  (6, 'fill_blank', '{"sentence_before": "It wasn''t the price ", "sentence_after": " bothered me, it was the quality.", "correct_answers": ["that"], "feedback_correct": "Correct !", "feedback_incorrect": "\"That\" (chose) complète l''it-cleft."}'),
  (7, 'true_false', '{"statement": "Cleft sentences are often used to correct a misunderstanding.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un usage fréquent."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "wasn''t", "me", "who", "did", "it."], "correct_sentence": "It wasn''t me who did it.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"C''est Marie qui a gagné\" se traduit par :", "options": ["It was Marie who won.", "Marie won that.", "It Marie won who.", "Marie is who won."], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"C''est... qui\" = \"It was... who\"."}'),
  (6, 'fill_blank', '{"sentence_before": "Ce que je veux dire, c''est que... → What I ", "sentence_after": " to say is that...", "correct_answers": ["mean"], "feedback_correct": "Correct !", "feedback_incorrect": "\"What I mean is\" traduit \"ce que je veux dire\"."}'),
  (7, 'true_false', '{"statement": "French \"c''est... qui/que\" structures translate naturally to English cleft sentences.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une bonne correspondance."}'),
  (8, 'matching', '{"instruction": "Relie la structure française à sa traduction anglaise.", "pairs": [{"left": "C''est lui qui a fait ça", "right": "It''s him who did that"}, {"left": "Ce qu''il faut, c''est du temps", "right": "What''s needed is time"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'All that / the thing that (variantes du cleft)', '{"rule": "\"All that\" et \"the thing that\" sont des variantes du what-cleft, pour insister différemment (\"tout ce que\" / \"la chose que\").", "table": [{"subject": "All + verbe + is", "affirmative": "All I want is respect.", "negative": "—"}, {"subject": "The thing that + verbe + is", "affirmative": "The thing that annoys me is his tone.", "negative": "—"}], "example": {"en": "All she wanted was a simple thank you. The thing that surprised us most was his silence.", "fr": "Tout ce qu''elle voulait, c''était un simple merci. Ce qui nous a le plus surpris, c''est son silence."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : All I need ___ a little help.", "options": ["is", "are", "was being", "be"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"All I need is\" — structure emphatique."}'),
  (2, 'qcm', '{"question": "\"The thing that bothers me\" met l''accent sur :", "options": ["Une personne", "Ce qui dérange précisément", "Le lieu", "Le temps"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette structure isole précisément la source du problème."}'),
  (3, 'fill_blank', '{"sentence_before": "All I want ", "sentence_after": " to be heard. (is)", "correct_answers": ["is"], "feedback_correct": "Correct !", "feedback_incorrect": "\"All I want is\" — structure emphatique."}'),
  (4, 'true_false', '{"statement": "\"All that\" and \"the thing that\" work similarly to \"what\" in cleft sentences.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — ils fonctionnent bien de manière similaire."}'),
  (5, 'matching', '{"instruction": "Relie la structure à son équivalent what-cleft.", "pairs": [{"left": "All I need is time.", "right": "What I need is time."}, {"left": "The thing that matters is honesty.", "right": "What matters is honesty."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["All", "she", "wanted", "was", "peace."], "correct_sentence": "All she wanted was peace.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : The thing that ___ me most is his patience.", "options": ["impresses", "impress", "impressing", "impressed"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Verbe au présent, sujet singulier : \"impresses\"."}'),
  (8, 'fill_blank', '{"sentence_before": "All that matters ", "sentence_after": " your happiness. (is)", "correct_answers": ["is"], "feedback_correct": "Correct !", "feedback_incorrect": "\"All that matters is\" — structure emphatique."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'L''emphase à l''oral (do/does/did + verbe)', '{"rule": "À l''oral, on peut mettre l''emphase sur un verbe en ajoutant \"do/does/did\" devant la base verbale, même à l''affirmatif.", "table": [{"subject": "do/does/did + base", "affirmative": "I do like it! She does understand.", "negative": "—"}], "example": {"en": "I did tell you, I promise! She does care about you, even if she doesn''t show it.", "fr": "Je te l''ai vraiment dit, je te promets ! Elle tient vraiment à toi, même si elle ne le montre pas."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I do believe you\" ajoute :", "options": ["Une négation", "De l''emphase", "Une question", "Le passé"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Do\" ici ajoute de l''emphase."}'),
  (2, 'qcm', '{"question": "Complète : She ___ love him, despite everything.", "options": ["does", "is", "has", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Emphase avec \"does\" + base verbale."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " try my best, even if it doesn''t show. (do)", "correct_answers": ["do"], "feedback_correct": "Correct !", "feedback_incorrect": "Emphase : \"I do try\"."}'),
  (4, 'true_false', '{"statement": "This emphatic \"do\" is mainly used in spoken or persuasive English.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien typique de l''oral/persuasif."}'),
  (5, 'matching', '{"instruction": "Relie la phrase neutre à sa version emphatique.", "pairs": [{"left": "I like it.", "right": "I do like it!"}, {"left": "She understands.", "right": "She does understand."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "did", "warn", "you", "about", "this!"], "correct_sentence": "I did warn you about this!", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : He ___ apologize, I was there.", "options": ["did", "was", "had", "has"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Emphase passée : \"did apologize\"."}'),
  (8, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " appreciate your help! (do)", "correct_answers": ["do"], "feedback_correct": "Correct !", "feedback_incorrect": "Emphase : \"do appreciate\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'L''emphase avec des adverbes intensifiants', '{"rule": "Des adverbes comme \"absolutely\", \"utterly\", \"completely\" renforcent l''emphase, souvent combinés aux structures cleft déjà vues.", "table": [{"subject": "absolutely", "affirmative": "absolument", "negative": "—"}, {"subject": "utterly", "affirmative": "complètement/totalement", "negative": "—"}], "example": {"en": "It was absolutely her fault. What she said was utterly ridiculous.", "fr": "C''était absolument de sa faute. Ce qu''elle a dit était totalement ridicule."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Utterly\" veut dire :", "options": ["Un peu", "Complètement/totalement", "Jamais", "Rarement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Utterly\" = totalement."}'),
  (2, 'qcm', '{"question": "Ces adverbes intensifiants sont typiques d''un registre :", "options": ["Très familier uniquement", "Soutenu/expressif", "Enfantin", "Technique"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Ils sont typiques d''un registre soutenu/expressif."}'),
  (3, 'fill_blank', '{"sentence_before": "It was ", "sentence_after": " brilliant! (absolument)", "correct_answers": ["absolutely"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Absolument\" = \"absolutely\"."}'),
  (4, 'true_false', '{"statement": "\"Utterly\" and \"absolutely\" intensify the meaning of an adjective.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien leur fonction."}'),
  (5, 'matching', '{"instruction": "Relie l''adverbe intensifiant à sa traduction.", "pairs": [{"left": "entirely", "right": "entièrement"}, {"left": "thoroughly", "right": "profondément"}, {"left": "completely", "right": "complètement"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "was", "utterly", "unexpected."], "correct_sentence": "It was utterly unexpected.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : What she did was ___ unacceptable.", "options": ["absolutely", "hardly", "barely", "rarely"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Intensifiant fort : \"absolutely\"."}'),
  (8, 'fill_blank', '{"sentence_before": "It was ", "sentence_after": " thrilling! (complètement)", "correct_answers": ["completely"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Complètement\" = \"completely\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : toutes les structures emphatiques', '{"rule": "Cette leçon consolide it-cleft, what-cleft, all/the thing that, l''emphase avec do/does/did, et les adverbes intensifiants pour une maîtrise complète de l''emphase en anglais.", "table": [{"subject": "It-cleft", "affirmative": "It was John who called.", "negative": "—"}, {"subject": "What-cleft", "affirmative": "What I need is time.", "negative": "—"}, {"subject": "Do-emphase", "affirmative": "I do care.", "negative": "—"}], "example": {"en": "It was her courage that impressed everyone. What she did was absolutely remarkable. I do believe she deserves recognition.", "fr": "C''est son courage qui a impressionné tout le monde. Ce qu''elle a fait était absolument remarquable. Je crois vraiment qu''elle mérite d''être reconnue."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 33 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : It was the manager ___ made the decision.", "options": ["who", "what", "it", "which only"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "It-cleft avec une personne : \"who\"."}'),
  (2, 'qcm', '{"question": "Complète : ___ surprised me was her reaction.", "options": ["What", "It", "That", "Which"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "What-cleft : \"What surprised me\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " understand your concern. (do, emphase)", "correct_answers": ["do"], "feedback_correct": "Correct !", "feedback_incorrect": "Emphase : \"I do understand\"."}'),
  (4, 'true_false', '{"statement": "Emphatic structures help highlight the most important part of a message.", "correct_answer": true, "feedback_correct": "Exact, bilan des structures emphatiques réussi !", "feedback_incorrect": "Faux — c''est bien leur fonction principale."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque structure emphatique à son exemple.", "pairs": [{"left": "It-cleft", "right": "It was Tom who won."}, {"left": "What-cleft", "right": "What matters is honesty."}, {"left": "Do-emphase", "right": "She does care."}], "feedback_correct": "Parfait, bilan de l''emphase réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "was", "her", "kindness", "that", "touched", "me."], "correct_sentence": "It was her kindness that touched me.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : All I ask ___ your honesty.", "options": ["is", "are", "was", "were"], "correct_index": 0, "feedback_correct": "Correct ! Bilan de l''emphase réussi.", "feedback_incorrect": "\"All I ask is\" — structure emphatique."}'),
  (8, 'fill_blank', '{"sentence_before": "What she said was ", "sentence_after": " true. (absolument)", "correct_answers": ["absolutely"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Absolument\" = \"absolutely\"."}')
) as v(position, type, content);
