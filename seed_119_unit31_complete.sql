-- ============================================
-- LUMA — Unité 31 (C1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Never ___ I seen such a mess.", "options": ["have", "I have", "did", "has"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"never\" : \"have I\"."}'),
  (6, 'fill_blank', '{"sentence_before": "Rarely ", "sentence_after": " we see such dedication. (do)", "correct_answers": ["do"], "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"rarely\" : \"do we\"."}'),
  (7, 'true_false', '{"statement": "Starting a sentence with a negative adverb triggers subject-auxiliary inversion.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la règle."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Never", "have", "I", "felt", "so", "proud."], "correct_sentence": "Never have I felt so proud.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Not only ___ she smart, but also kind.", "options": ["is", "she is", "does", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"not only\" : \"is she\"."}'),
  (6, 'fill_blank', '{"sentence_before": "Not only did he apologize, ", "sentence_after": " also brought a gift.", "correct_answers": ["but he"], "feedback_correct": "Correct !", "feedback_incorrect": "\"But also\" (ou \"but he also\") complète la structure."}'),
  (7, 'true_false', '{"statement": "\"Not only... but also\" requires inversion in the first clause.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — l''inversion est bien requise."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Not", "only", "is", "she", "talented,", "but", "also", "humble."], "correct_sentence": "Not only is she talented, but also humble.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Complète : Hardly ___ I arrived when it started raining.", "options": ["had", "have", "did", "was"], "affirmative": "", "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Hardly had I\" — inversion avec past perfect."}'),
  (6, 'fill_blank', '{"sentence_before": "No sooner ", "sentence_after": " he left than the phone rang. (had)", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "\"No sooner had he\" — inversion."}'),
  (7, 'true_false', '{"statement": "\"Hardly... when\" and \"no sooner... than\" both describe two events happening in quick succession.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien leur usage."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Hardly", "had", "we", "sat", "down", "when", "the", "bell", "rang."], "correct_sentence": "Hardly had we sat down when the bell rang.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Little did he know\" veut dire :", "options": ["Il savait beaucoup", "Il ne savait pas du tout", "Il savait un peu", "Il ne voulait pas savoir"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Little did he know\" = il ignorait complètement."}'),
  (6, 'fill_blank', '{"sentence_before": "Little ", "sentence_after": " she know what awaited her. (did)", "correct_answers": ["did"], "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"little\" : \"did she\"."}'),
  (7, 'true_false', '{"statement": "This structure is often used dramatically in storytelling.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un usage narratif dramatique."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Little", "did", "they", "know", "the", "truth."], "correct_sentence": "Little did they know the truth.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Inversion après so/such (intensité)', '{"rule": "\"So + adjectif\" et \"Such + nom\" en début de phrase déclenchent aussi l''inversion, pour insister sur une intensité.", "table": [{"subject": "So + adj + verbe/sujet", "affirmative": "So loud was the noise that...", "negative": "—"}, {"subject": "Such + nom + verbe/sujet", "affirmative": "Such was her joy that...", "negative": "—"}], "example": {"en": "So great was his fear that he couldn''t move. Such was the chaos that no one knew what to do.", "fr": "Sa peur était si grande qu''il ne pouvait pas bouger. Le chaos était tel que personne ne savait quoi faire."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : So tired ___ she that she fell asleep instantly.", "options": ["was", "she was", "did", "is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"so + adjectif\" : \"was she\"."}'),
  (2, 'qcm', '{"question": "Cette structure est typique de quel registre ?", "options": ["Très familier", "Littéraire/formel", "Enfantin", "SMS"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "C''est une structure littéraire/formelle."}'),
  (3, 'fill_blank', '{"sentence_before": "Such ", "sentence_after": " her surprise that she couldn''t speak. (was)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"such\" : \"was her surprise\"."}'),
  (4, 'true_false', '{"statement": "This inversion adds dramatic emphasis to a sentence.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien son effet."}'),
  (5, 'matching', '{"instruction": "Relie la structure d''intensité à son inversion.", "pairs": [{"left": "So loud was the music", "right": "that we couldn''t talk"}, {"left": "Such was the silence", "right": "that I could hear my heartbeat"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["So", "cold", "was", "it", "that", "the", "lake", "froze."], "correct_sentence": "So cold was it that the lake froze.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Such ___ the demand that we sold out in an hour.", "options": ["was", "did", "had", "is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"such\" : \"was the demand\"."}'),
  (8, 'fill_blank', '{"sentence_before": "So beautiful ", "sentence_after": " the view that we stayed for hours. (was)", "correct_answers": ["was"], "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"so + adjectif\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Inversion conditionnelle (Were I, Had I, Should)', '{"rule": "Dans un registre très formel/littéraire, on peut omettre \"if\" et inverser le verbe et le sujet : \"Were I rich\" (= If I were rich), \"Had I known\" (= If I had known).", "table": [{"subject": "Were I...", "affirmative": "Were I you, I would accept. (= If I were you)", "negative": "—"}, {"subject": "Had I...", "affirmative": "Had I known, I would have come. (= If I had known)", "negative": "—"}, {"subject": "Should you...", "affirmative": "Should you need help, call me. (= If you should need help)", "negative": "—"}], "example": {"en": "Had I known the truth, I would have acted differently.", "fr": "Si j''avais connu la vérité, j''aurais agi différemment."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Were I you\" équivaut à :", "options": ["If I am you", "If I were you", "If I was you", "If I will be you"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Were I you\" = \"If I were you\"."}'),
  (2, 'qcm', '{"question": "\"Had I known\" équivaut à :", "options": ["If I know", "If I knew", "If I had known", "If I have known"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "\"Had I known\" = \"If I had known\"."}'),
  (3, 'fill_blank', '{"sentence_before": "", "sentence_after": " you need anything, just ask. (Should)", "correct_answers": ["Should"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Should you\" = \"If you should\"."}'),
  (4, 'true_false', '{"statement": "This inversion is typical of formal or literary English.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien un registre formel/littéraire."}'),
  (5, 'matching', '{"instruction": "Relie la structure inversée à sa version avec \"if\".", "pairs": [{"left": "Were I rich...", "right": "If I were rich..."}, {"left": "Had she known...", "right": "If she had known..."}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Had", "I", "known,", "I", "would", "have", "helped."], "correct_sentence": "Had I known, I would have helped.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Should you have questions\" équivaut à :", "options": ["If you have questions", "If you should have questions", "les deux sont corrects", "aucun n''est correct"], "correct_index": 2, "feedback_correct": "Correct !", "feedback_incorrect": "Les deux formulations sont équivalentes."}'),
  (8, 'fill_blank', '{"sentence_before": "", "sentence_after": " I be late, please start without me. (Were, littéraire)", "correct_answers": ["Should"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Should I be late\" = \"If I should be late\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'L''inversion dans un texte narratif littéraire', '{"rule": "Cette leçon applique toutes les inversions vues à un contexte narratif riche, typique de la littérature ou du discours élégant.", "table": [{"subject": "Effet stylistique", "affirmative": "L''inversion crée du suspense, de l''emphase, un ton littéraire.", "negative": "—"}], "example": {"en": "Never had she felt so alone. Little did she know that everything was about to change. Not only was she scared, but also determined.", "fr": "Jamais elle ne s''était sentie aussi seule. Elle ignorait que tout était sur le point de changer. Non seulement elle avait peur, mais elle était aussi déterminée."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Pourquoi les auteurs utilisent-ils l''inversion en littérature ?", "options": ["Par erreur", "Pour créer un effet stylistique/dramatique", "C''est obligatoire", "Pour simplifier le texte"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "L''inversion crée un effet stylistique voulu."}'),
  (2, 'qcm', '{"question": "Complète : Never ___ she experienced such joy.", "options": ["had", "has", "did", "was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion avec past perfect : \"had she\"."}'),
  (3, 'fill_blank', '{"sentence_before": "Little ", "sentence_after": " he realize what was coming. (did)", "correct_answers": ["did"], "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"little\" : \"did he\"."}'),
  (4, 'true_false', '{"statement": "Inversion structures are more common in written literature than casual speech.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien plus fréquent à l''écrit littéraire."}'),
  (5, 'matching', '{"instruction": "Relie la structure inversée à son effet narratif.", "pairs": [{"left": "Never had I seen...", "right": "emphase sur l''unicité"}, {"left": "Little did she know...", "right": "suspense/ironie dramatique"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Not", "only", "did", "she", "survive,", "but", "thrive."], "correct_sentence": "Not only did she survive, but thrive.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : So intense ___ the storm that the ship sank.", "options": ["was", "did", "had", "is"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"so + adjectif\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Hardly ", "sentence_after": " the sun risen when the birds began to sing. (had)", "correct_answers": ["had"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Hardly had\" — inversion."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : toutes les inversions avancées', '{"rule": "Cette leçon consolide toutes les structures d''inversion vues dans l''unité : adverbes négatifs, not only...but also, hardly/no sooner, little did, so/such, et conditionnelle sans if.", "table": [{"subject": "Adverbes négatifs", "affirmative": "never, rarely, hardly + inversion", "negative": "—"}, {"subject": "Intensité", "affirmative": "so/such + inversion", "negative": "—"}, {"subject": "Conditionnel", "affirmative": "were/had/should + inversion", "negative": "—"}], "example": {"en": "Never had I imagined such a moment. Had I known earlier, not only would I have prepared, but also warned others.", "fr": "Jamais je n''avais imaginé un tel moment. Si j''avais su plus tôt, non seulement je me serais préparé, mais j''aurais aussi averti les autres."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 31 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : Rarely ___ such dedication seen.", "options": ["is", "has", "does", "was"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"rarely\" avec present perfect passif : \"has\"."}'),
  (2, 'qcm', '{"question": "Complète : ___ I known, I would have come earlier.", "options": ["Had", "Have", "Did", "Was"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Conditionnelle inversée : \"Had I known\"."}'),
  (3, 'fill_blank', '{"sentence_before": "Not only ", "sentence_after": " she brilliant, but also modest. (is)", "correct_answers": ["is"], "feedback_correct": "Correct !", "feedback_incorrect": "Inversion après \"not only\" : \"is she\"."}'),
  (4, 'true_false', '{"statement": "All these inversion structures are more common in formal, written, or literary English.", "correct_answer": true, "feedback_correct": "Exact, bravo, tu as terminé cette unité avancée !", "feedback_incorrect": "Faux — c''est bien leur registre commun."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque structure inversée à sa catégorie.", "pairs": [{"left": "Never have I...", "right": "adverbe négatif"}, {"left": "So great was...", "right": "intensité"}, {"left": "Had I known...", "right": "conditionnel"}], "feedback_correct": "Parfait, bilan des inversions réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["Little", "did", "we", "know", "what", "awaited", "us."], "correct_sentence": "Little did we know what awaited us.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : No sooner ___ the game started than it began to rain.", "options": ["had", "has", "did", "was"], "correct_index": 0, "feedback_correct": "Correct ! Bilan des inversions réussi.", "feedback_incorrect": "\"No sooner had\" — inversion avec past perfect."}'),
  (8, 'fill_blank', '{"sentence_before": "Should you ", "sentence_after": " any questions, feel free to ask. (avoir)", "correct_answers": ["have"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Should you have\" = \"If you should have\"."}')
) as v(position, type, content);
