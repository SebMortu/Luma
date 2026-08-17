-- ============================================
-- LUMA — Unité 27 (B2) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : This ___ be done carefully.", "options": ["must", "must be", "must to", "musting"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Passif avec modal : \"must be done\"."}'),
  (6, 'fill_blank', '{"sentence_before": "The report ", "sentence_after": " be finished by Friday. (doit)", "correct_answers": ["must"], "feedback_correct": "Correct !", "feedback_incorrect": "Modal + be + participe : \"must be finished\"."}'),
  (7, 'true_false', '{"statement": "Passive with modals uses modal + be + past participle.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien cette structure."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["This", "problem", "can", "be", "solved."], "correct_sentence": "This problem can be solved.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"They gave her a prize\" au passif :", "options": ["She was given a prize.", "A prize was given her.", "Her was given a prize.", "A prize gave her."], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "L''objet indirect devient sujet : \"She was given a prize.\""}'),
  (6, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " sent an email yesterday. (ai été envoyé)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "Passif : \"was sent\"."}'),
  (7, 'true_false', '{"statement": "With two-object verbs, either object can become the subject in the passive.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien possible, avec une préférence pour la personne."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "was", "offered", "a", "new", "job."], "correct_sentence": "He was offered a new job.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"He is said to be very rich\" veut dire :", "options": ["On dit qu''il est très riche", "Il a dit qu''il était riche", "Il est certainement riche", "Il n''est pas riche"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Is said to\" = on dit que."}'),
  (6, 'fill_blank', '{"sentence_before": "She is ", "sentence_after": " to be the best in her field. (crue/considérée)", "correct_answers": ["believed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Is believed to\" = on croit que."}'),
  (7, 'true_false', '{"statement": "\"Is said to\" is used to report general opinion without naming a source.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "is", "thought", "to", "be", "abroad."], "correct_sentence": "He is thought to be abroad.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Le passif est fréquent dans le style académique car il :", "options": ["Rend le texte plus long", "Met l''accent sur les faits, pas l''auteur", "Est plus familier", "Est incorrect"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le passif dépersonnalise et objective le propos."}'),
  (6, 'fill_blank', '{"sentence_before": "The data ", "sentence_after": " (collect) over six months.", "correct_answers": ["was collected"], "feedback_correct": "Correct !", "feedback_incorrect": "Style académique passif : \"was collected\"."}'),
  (7, 'true_false', '{"statement": "Academic writing often avoids \"I\" by using the passive.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une pratique courante."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "results", "are", "shown", "below."], "correct_sentence": "The results are shown below.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Have something done (faire faire)', '{"rule": "\"Have something done\" (avoir + participe passé) exprime qu''on fait faire quelque chose par quelqu''un d''autre, plutôt que de le faire soi-même.", "table": [{"subject": "have + object + participe", "affirmative": "I had my hair cut. (quelqu''un l''a coupé pour moi)", "negative": "—"}], "example": {"en": "I''m having my car repaired tomorrow.", "fr": "Je fais réparer ma voiture demain."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I had my car washed\" veut dire :", "options": ["J''ai lavé ma voiture moi-même", "Quelqu''un a lavé ma voiture pour moi", "Ma voiture est sale", "Je vais laver ma voiture"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Have something done\" = faire faire par quelqu''un d''autre."}'),
  (2, 'qcm', '{"question": "Complète : She is having her house ___ (paint).", "options": ["painted", "paint", "painting", "to paint"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Have something done\" : participe passé \"painted\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I need to have my teeth ", "sentence_after": ". (checked)", "correct_answers": ["checked"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Have + object + checked\" (participe)."}'),
  (4, 'true_false', '{"statement": "\"I cut my hair\" and \"I had my hair cut\" mean the same thing.", "correct_answer": false, "feedback_correct": "Exact — dans le premier, tu le fais toi-même ; dans le second, quelqu''un le fait pour toi.", "feedback_incorrect": "Faux — les deux ont un sens différent."}'),
  (5, 'matching', '{"instruction": "Relie la phrase à son sens.", "pairs": [{"left": "I painted my room.", "right": "je l''ai fait moi-même"}, {"left": "I had my room painted.", "right": "quelqu''un l''a fait pour moi"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["We", "had", "our", "kitchen", "renovated."], "correct_sentence": "We had our kitchen renovated.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : I''m having my photo ___ (take) tomorrow.", "options": ["taken", "take", "taking", "to take"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Participe passé : \"taken\"."}'),
  (8, 'fill_blank', '{"sentence_before": "He had his suit ", "sentence_after": " for the wedding. (fait sur mesure)", "correct_answers": ["made"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Had his suit made\" = fait faire son costume."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Passif impersonnel (it is said/thought/reported that)', '{"rule": "Une alternative à \"is said to\" est la structure impersonnelle \"It is said/thought/reported that + proposition\", très utilisée dans le journalisme et l''écrit formel.", "table": [{"subject": "It is said that", "affirmative": "On dit que", "negative": "—"}, {"subject": "It is reported that", "affirmative": "Il est rapporté que", "negative": "—"}], "example": {"en": "It is reported that the company will close next year.", "fr": "Il est rapporté que l''entreprise fermera l''an prochain."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"It is thought that\" veut dire :", "options": ["On pense que", "Il pense que", "Je pense que", "Ils ont pensé"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"It is thought that\" = on pense que (impersonnel)."}'),
  (2, 'qcm', '{"question": "Cette structure est typique de quel registre ?", "options": ["Familier", "Journalistique/formel", "Enfantin", "Argotique"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "C''est typique du style journalistique/formel."}'),
  (3, 'fill_blank', '{"sentence_before": "It is ", "sentence_after": " that the plan will succeed. (crue/pensée)", "correct_answers": ["believed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"It is believed that\" = on croit que."}'),
  (4, 'true_false', '{"statement": "\"It is said to\" and \"It is said that\" can express similar ideas differently structured.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien vrai, structures différentes."}'),
  (5, 'matching', '{"instruction": "Relie la structure impersonnelle à sa traduction.", "pairs": [{"left": "It is reported that", "right": "il est rapporté que"}, {"left": "It is expected that", "right": "on s''attend à ce que"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "is", "said", "that", "he", "left", "town."], "correct_sentence": "It is said that he left town.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : It is ___ that prices will rise.", "options": ["expected", "expect", "expecting", "to expect"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"It is expected that\" = participe passé \"expected\"."}'),
  (8, 'fill_blank', '{"sentence_before": "It is ", "sentence_after": " that the CEO will resign. (rapporté)", "correct_answers": ["reported"], "feedback_correct": "Correct !", "feedback_incorrect": "\"It is reported that\" = il est rapporté que."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Nominalisation dans le style académique', '{"rule": "Le style académique préfère souvent les noms aux verbes (\"the analysis of\" plutôt que \"to analyze\"), combinés au passif, pour un ton plus objectif et formel.", "table": [{"subject": "Verbe → Nom", "affirmative": "analyze → analysis, decide → decision", "negative": "—"}], "example": {"en": "The analysis was conducted carefully. (rather than: We analyzed carefully)", "fr": "L''analyse a été menée avec soin. (plutôt que : Nous avons analysé avec soin)"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Quelle est la forme nominale de \"decide\" ?", "options": ["decision", "decider", "deciding", "decisive"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Decide\" → \"decision\"."}'),
  (2, 'qcm', '{"question": "Quelle est la forme nominale de \"analyze\" ?", "options": ["analyzer", "analysis", "analyzing", "analyzed"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Analyze\" → \"analysis\"."}'),
  (3, 'fill_blank', '{"sentence_before": "The ", "sentence_after": " of the data took two weeks. (analyse)", "correct_answers": ["analysis"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Analyse\" (nom) = \"analysis\"."}'),
  (4, 'true_false', '{"statement": "Nominalization is common in formal and academic English.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien fréquent dans ce registre."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à sa forme nominale.", "pairs": [{"left": "develop", "right": "development"}, {"left": "conclude", "right": "conclusion"}, {"left": "discover", "right": "discovery"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "conclusion", "was", "clear", "and", "concise."], "correct_sentence": "The conclusion was clear and concise.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Quelle est la forme nominale de \"discover\" ?", "options": ["discoverment", "discovery", "discovering", "discoverance"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Discover\" → \"discovery\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The ", "sentence_after": " of this new method changed everything. (développement)", "correct_answers": ["development"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Développement\" = \"development\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : passif avancé et style formel', '{"rule": "Cette leçon combine passif avec modaux, verbes à deux compléments, is said/believed to, structures impersonnelles, have something done, et nominalisation — un vrai bilan du style formel avancé.", "table": [{"subject": "Passif + modal", "affirmative": "must be done", "negative": "—"}, {"subject": "Réputation", "affirmative": "is said to / it is said that", "negative": "—"}, {"subject": "Service rendu", "affirmative": "have something done", "negative": "—"}], "example": {"en": "The report must be submitted by Friday. It is believed to contain important findings. I had it reviewed by an expert before submission.", "fr": "Le rapport doit être soumis avant vendredi. On pense qu''il contient des découvertes importantes. Je l''ai fait relire par un expert avant soumission."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 27 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : The document ___ be signed by tomorrow.", "options": ["must", "must be", "musting", "musts"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Passif + modal : \"must be signed\"."}'),
  (2, 'qcm', '{"question": "Complète : He is ___ to have left the country.", "options": ["said", "saying", "say", "says"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Is said to\" = participe passé \"said\"."}'),
  (3, 'fill_blank', '{"sentence_before": "I had my presentation ", "sentence_after": " by a colleague. (relue)", "correct_answers": ["reviewed"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Have something done\" : \"reviewed\"."}'),
  (4, 'true_false', '{"statement": "Formal English often combines passive structures with nominalization.", "correct_answer": true, "feedback_correct": "Exact, bilan du style formel réussi !", "feedback_incorrect": "Faux — c''est bien une combinaison fréquente."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque structure à son usage.", "pairs": [{"left": "must be done", "right": "passif + modal"}, {"left": "is believed to be", "right": "réputation/opinion générale"}, {"left": "have something done", "right": "service rendu par quelqu''un"}], "feedback_correct": "Parfait, bilan du passif avancé réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["It", "is", "believed", "that", "he", "escaped."], "correct_sentence": "It is believed that he escaped.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : This issue ___ be addressed immediately.", "options": ["should", "should be", "shoulding", "shoulds"], "correct_index": 1, "feedback_correct": "Correct ! Bilan du style formel réussi.", "feedback_incorrect": "Passif + modal : \"should be addressed\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The ", "sentence_after": " of this study will be published soon. (résultats/findings)", "correct_answers": ["findings"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Résultats\" (académique) = \"findings\"."}')
) as v(position, type, content);
