-- ============================================
-- LUMA — Unité 14 (A2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : She ___ goes to the gym. (souvent)", "options": ["often", "never", "already", "yet"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Souvent\" = \"often\"."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " drink coffee in the morning. (toujours)", "correct_answers": ["always"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Toujours\" = \"always\"."}'),
  (7, 'true_false', '{"statement": "\"Rarely\" means \"almost never\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"rarely\" veut bien dire presque jamais."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "rarely", "eats", "meat."], "correct_sentence": "He rarely eats meat.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel est l''adverbe de \"quick\" ?", "options": ["quickly", "quicker", "quickest", "quickness"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Adjectif + ly : \"quickly\"."}'),
  (6, 'fill_blank', '{"sentence_before": "She sings ", "sentence_after": ". (magnifiquement)", "correct_answers": ["beautifully"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Beautiful\" + ly = \"beautifully\"."}'),
  (7, 'true_false', '{"statement": "The adverb of \"good\" is \"goodly\".", "correct_answer": false, "feedback_correct": "Exact — c''est \"well\", irrégulier.", "feedback_incorrect": "Faux — l''adverbe de \"good\" est \"well\"."}'),
  (8, 'matching', '{"instruction": "Relie l''adjectif à son adverbe.", "pairs": [{"left": "careful", "right": "carefully"}, {"left": "happy", "right": "happily"}, {"left": "good", "right": "well"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Classe du plus au moins fréquent : always, often, sometimes. Lequel est le plus fréquent ?", "options": ["sometimes", "often", "always", "never"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Always\" (100%) est le plus fréquent."}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " go to concerts. (rarement, faible fréquence)", "correct_answers": ["rarely", "seldom"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Rarement\" = \"rarely\" ou \"seldom\"."}'),
  (7, 'true_false', '{"statement": "\"Usually\" indicates a higher frequency than \"sometimes\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"usually\" est bien plus fréquent que \"sometimes\"."}'),
  (8, 'matching', '{"instruction": "Classe par pourcentage de fréquence.", "pairs": [{"left": "always", "right": "100%"}, {"left": "usually", "right": "80%"}, {"left": "never", "right": "0%"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"In my opinion\" veut dire :", "options": ["Selon les autres", "À mon avis", "C''est prouvé", "Jamais"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"In my opinion\" = à mon avis."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " speaking, I prefer tea. (personnellement)", "correct_answers": ["Personally"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Personnellement\" = \"Personally\"."}'),
  (7, 'true_false', '{"statement": "\"I think\" is a way to express an opinion.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"I think\" exprime bien une opinion."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["In", "my", "opinion,", "it''s", "great."], "correct_sentence": "In my opinion, it''s great.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Position des adverbes de manière dans la phrase', '{"rule": "Les adverbes de manière se placent généralement après le verbe (ou après le complément d''objet), jamais entre le verbe et son objet.", "table": [{"subject": "Correct", "affirmative": "She speaks English fluently.", "negative": "—"}, {"subject": "Incorrect", "affirmative": "She speaks fluently English.", "negative": "—"}], "example": {"en": "He drives carefully. She sings beautifully.", "fr": "Il conduit prudemment. Elle chante magnifiquement."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle phrase est correcte ?", "options": ["She speaks fluently English.", "She speaks English fluently.", "She fluently speaks English.", "Fluently she speaks English."], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "L''adverbe se place après le complément."}'),
  (2, 'qcm', '{"question": "Où se place généralement l''adverbe de manière ?", "options": ["Avant le verbe", "Entre le verbe et l''objet", "Après le verbe/complément", "En début de phrase toujours"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Généralement après le verbe ou son complément."}'),
  (3, 'fill_blank', '{"sentence_before": "He drives his car ", "sentence_after": ". (prudemment)", "correct_answers": ["carefully"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Prudemment\" = \"carefully\", en fin de phrase."}'),
  (4, 'true_false', '{"statement": "\"She quickly ate her lunch\" places the adverb correctly.", "correct_answer": true, "feedback_correct": "Exact — avant le verbe est aussi possible dans certains cas.", "feedback_incorrect": "Faux — c''est une position acceptable pour cet adverbe."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à sa correction.", "pairs": [{"left": "She sings good.", "right": "She sings well."}, {"left": "He runs fastly.", "right": "He runs fast."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "answered", "the", "question", "correctly."], "correct_sentence": "She answered the question correctly.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Fast\" en tant qu''adverbe :", "options": ["devient \"fastly\"", "reste \"fast\"", "devient \"faster\"", "devient \"fasting\""], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Fast\" est identique en adjectif et adverbe."}'),
  (8, 'fill_blank', '{"sentence_before": "He solved the problem ", "sentence_after": ". (facilement)", "correct_answers": ["easily"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Facilement\" = \"easily\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Exprimer son accord et désaccord', '{"rule": "Pour exprimer son accord (\"I agree\") ou désaccord (\"I disagree\"), on peut nuancer avec \"totally\", \"partly\", ou \"I''m not sure\".", "table": [{"subject": "I agree", "affirmative": "je suis d''accord", "negative": "—"}, {"subject": "I disagree", "affirmative": "je ne suis pas d''accord", "negative": "—"}, {"subject": "I''m not sure", "affirmative": "je ne suis pas sûr", "negative": "—"}], "example": {"en": "I totally agree with you, but I''m not sure about the last point.", "fr": "Je suis totalement d''accord avec toi, mais je ne suis pas sûr du dernier point."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I disagree\" veut dire :", "options": ["Je suis d''accord", "Je ne suis pas d''accord", "Je ne sais pas", "Je m''en fiche"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"I disagree\" = je ne suis pas d''accord."}'),
  (2, 'qcm', '{"question": "\"Totally\" renforce l''expression de :", "options": ["L''incertitude", "L''accord/désaccord fort", "Le temps", "Le lieu"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Totally\" renforce l''accord ou le désaccord."}'),
  (3, 'fill_blank', '{"sentence_before": "I completely ", "sentence_after": " with you. (suis d''accord)", "correct_answers": ["agree"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Suis d''accord\" = \"agree\"."}'),
  (4, 'true_false', '{"statement": "\"I''m not sure\" expresses a neutral opinion.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une position neutre."}'),
  (5, 'matching', '{"instruction": "Relie l''expression à son sens.", "pairs": [{"left": "I agree", "right": "d''accord"}, {"left": "I disagree", "right": "pas d''accord"}, {"left": "Maybe you''re right", "right": "nuancé"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "partly", "agree", "with", "that."], "correct_sentence": "I partly agree with that.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"I''m not so sure about that\" exprime :", "options": ["Un fort accord", "Un doute", "Un refus catégorique", "Une joie"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette phrase exprime bien un doute."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " with your opinion. (ne suis pas d''accord)", "correct_answers": ["disagree"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Ne suis pas d''accord\" = \"disagree\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Adverbes de degré (very, quite, too, enough)', '{"rule": "Les adverbes de degré nuancent l''intensité d''un adjectif : \"very\" (très), \"quite\" (assez), \"too\" (trop, négatif), \"enough\" (assez, se place après l''adjectif).", "table": [{"subject": "very", "affirmative": "très", "negative": "—"}, {"subject": "too", "affirmative": "trop", "negative": "—"}, {"subject": "enough", "affirmative": "assez (après l''adjectif)", "negative": "—"}], "example": {"en": "This coffee is too hot, but it''s not sweet enough.", "fr": "Ce café est trop chaud, mais il n''est pas assez sucré."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Où se place \"enough\" par rapport à l''adjectif ?", "options": ["Avant", "Après", "Au milieu", "N''importe où"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Enough\" se place après l''adjectif : \"big enough\"."}'),
  (2, 'qcm', '{"question": "\"Too\" a une connotation :", "options": ["Positive", "Négative (excès)", "Neutre", "Aucune"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Too\" indique un excès négatif."}'),
  (3, 'fill_blank', '{"sentence_before": "This box is not big ", "sentence_after": ". (assez)", "correct_answers": ["enough"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Assez\" (après l''adjectif) = \"enough\"."}'),
  (4, 'true_false', '{"statement": "\"Quite\" means \"assez\" and is less strong than \"very\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"quite\" est bien plus faible que \"very\"."}'),
  (5, 'matching', '{"instruction": "Classe du plus faible au plus fort.", "pairs": [{"left": "quite", "right": "assez"}, {"left": "very", "right": "très"}, {"left": "extremely", "right": "extrêmement"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "soup", "is", "too", "salty."], "correct_sentence": "This soup is too salty.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I''m ___ tired to continue.", "options": ["very", "too", "quite", "enough"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Excès négatif = \"too tired\"."}'),
  (8, 'fill_blank', '{"sentence_before": "She is ", "sentence_after": " intelligent. (assez, positif)", "correct_answers": ["quite"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Assez\" (positif) = \"quite\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : adverbes et opinions', '{"rule": "Cette leçon combine adverbes de fréquence, de manière, de degré, et expressions d''opinion pour s''exprimer avec nuance.", "table": [{"subject": "Fréquence", "affirmative": "always, often, rarely", "negative": "—"}, {"subject": "Manière", "affirmative": "quickly, carefully, well", "negative": "—"}, {"subject": "Degré", "affirmative": "very, too, enough", "negative": "—"}], "example": {"en": "In my opinion, she usually works very carefully, but sometimes too slowly.", "fr": "À mon avis, elle travaille habituellement très soigneusement, mais parfois trop lentement."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 14 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : She ___ arrives on time. (toujours)", "options": ["always", "never", "too", "enough"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Fréquence = \"always\"."}'),
  (2, 'qcm', '{"question": "Quel est l''adverbe de manière de \"careful\" ?", "options": ["carefuly", "carefully", "carefull", "care"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Careful\" + ly = \"carefully\"."}'),
  (3, 'fill_blank', '{"sentence_before": "In my ", "sentence_after": ", this is the best option. (opinion)", "correct_answers": ["opinion"], "feedback_correct": "Correct !", "feedback_incorrect": "\"À mon avis\" = \"in my opinion\"."}'),
  (4, 'true_false', '{"statement": "\"Too\" and \"enough\" both indicate degree.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — les deux indiquent bien un degré."}'),
  (5, 'matching', '{"instruction": "Bilan : classe chaque mot par catégorie d''adverbe.", "pairs": [{"left": "often", "right": "fréquence"}, {"left": "slowly", "right": "manière"}, {"left": "very", "right": "degré"}], "feedback_correct": "Parfait, bilan des adverbes réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Personally,", "I", "think", "it''s", "too", "expensive."], "correct_sentence": "Personally, I think it''s too expensive.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : He works ___ efficiently. (très)", "options": ["very", "too", "enough", "never"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Très\" = \"very\"."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " agree with that statement. (totalement)", "correct_answers": ["totally", "completely"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Totalement\" = \"totally\" ou \"completely\"."}')
) as v(position, type, content);
