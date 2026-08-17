-- ============================================
-- LUMA — Unité 35 (C1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Quel mot est le plus formel pour \"buy\" ?", "options": ["purchase", "get", "grab", "snag"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Purchase\" est plus formel que \"buy\"."}'),
  (6, 'fill_blank', '{"sentence_before": "Formal: We would like to ", "sentence_after": " for the delay. (apologize)", "correct_answers": ["apologize"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Apologize\" est formel (vs \"sorry\" informel)."}'),
  (7, 'true_false', '{"statement": "\"Kids\" is more informal than \"children\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"kids\" est bien plus familier."}'),
  (8, 'matching', '{"instruction": "Relie le mot informel à son équivalent formel.", "pairs": [{"left": "get", "right": "obtain"}, {"left": "fix", "right": "repair"}, {"left": "guy", "right": "gentleman"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Comment commence un email professionnel formel ?", "options": ["Hey!", "Dear Mr. Smith,", "Yo,", "Sup"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Dear Mr. Smith,\" est la formule formelle."}'),
  (6, 'fill_blank', '{"sentence_before": "I am writing to ", "sentence_after": " about the meeting. (enquire)", "correct_answers": ["enquire", "inquire"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Enquire/inquire about\" = se renseigner sur."}'),
  (7, 'true_false', '{"statement": "\"Best regards\" is an appropriate formal email closing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une formule de clôture formelle."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "look", "forward", "to", "hearing", "from", "you."], "correct_sentence": "I look forward to hearing from you.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Gonna\" est la contraction orale de :", "options": ["going to", "got a", "give another", "get one"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Gonna\" = \"going to\" à l''oral familier."}'),
  (6, 'fill_blank', '{"sentence_before": "", "sentence_after": " you eaten yet? (wanna=want to, à l''oral: \"Ya\")", "correct_answers": ["Have"], "feedback_correct": "Correct !", "feedback_incorrect": "Forme standard écrite : \"Have you eaten yet?\""}'),
  (7, 'true_false', '{"statement": "\"Wanna\", \"gonna\", and \"gotta\" are typical of casual spoken English.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien caractéristique de l''oral familier."}'),
  (8, 'matching', '{"instruction": "Relie la contraction orale à sa forme standard.", "pairs": [{"left": "wanna", "right": "want to"}, {"left": "gotta", "right": "got to"}, {"left": "kinda", "right": "kind of"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Dans un CV, on préfère écrire :", "options": ["I did stuff at my last job", "I managed a team of ten people", "I was kinda busy", "I dunno what I did"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Le CV demande un registre précis et formel."}'),
  (6, 'fill_blank', '{"sentence_before": "Between friends: ", "sentence_after": " up? (What''s, informel)", "correct_answers": ["What''s"], "feedback_correct": "Correct !", "feedback_incorrect": "\"What''s up?\" est une salutation informelle."}'),
  (7, 'true_false', '{"statement": "The right register depends on the audience and context.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien le critère principal."}'),
  (8, 'matching', '{"instruction": "Relie le contexte au registre approprié.", "pairs": [{"left": "Email au PDG", "right": "très formel"}, {"left": "Message à un ami", "right": "informel"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Les verbes latins vs anglo-saxons (registre)', '{"rule": "En anglais, les mots d''origine latine/française (obtain, commence, terminate) sont plus formels que leurs équivalents anglo-saxons (get, start, end) qui sont plus courants et neutres/informels.", "table": [{"subject": "Formel (latin)", "affirmative": "obtain, commence, terminate, purchase", "negative": "—"}, {"subject": "Neutre/informel (anglo-saxon)", "affirmative": "get, start, end, buy", "negative": "—"}], "example": {"en": "The meeting will commence at 9am. (formal) / The meeting will start at 9am. (neutral)", "fr": "La réunion débutera à 9h. (formel) / La réunion commencera à 9h. (neutre)"}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"Commence\" est l''équivalent formel de :", "options": ["start", "stop", "continue", "finish"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Commence\" (formel) = \"start\" (neutre)."}'),
  (2, 'qcm', '{"question": "\"Terminate\" est l''équivalent formel de :", "options": ["begin", "end", "continue", "pause"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Terminate\" (formel) = \"end\" (neutre)."}'),
  (3, 'fill_blank', '{"sentence_before": "We need to ", "sentence_after": " approval before proceeding. (formel : obtain)", "correct_answers": ["obtain"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Obtain\" est plus formel que \"get\"."}'),
  (4, 'true_false', '{"statement": "Words of Latin origin tend to sound more formal in English.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien une tendance générale en anglais."}'),
  (5, 'matching', '{"instruction": "Relie le mot anglo-saxon à son équivalent latin formel.", "pairs": [{"left": "buy", "right": "purchase"}, {"left": "help", "right": "assist"}, {"left": "ask", "right": "request"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["The", "contract", "will", "terminate", "in", "June."], "correct_sentence": "The contract will terminate in June.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Assist\" est l''équivalent formel de :", "options": ["help", "hurt", "leave", "stay"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Assist\" (formel) = \"help\" (neutre)."}'),
  (8, 'fill_blank', '{"sentence_before": "Please ", "sentence_after": " your documents before Friday. (formel : submit)", "correct_answers": ["submit"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Submit\" est plus formel que \"send/give\"."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Formules de politesse en anglais des affaires', '{"rule": "L''anglais des affaires utilise des formules figées pour atténuer les demandes, exprimer un désaccord poli, ou clôturer une conversation professionnellement.", "table": [{"subject": "Demande atténuée", "affirmative": "I was wondering if you could...", "negative": "—"}, {"subject": "Désaccord poli", "affirmative": "I see your point, but...", "negative": "—"}, {"subject": "Clôture", "affirmative": "Please don''t hesitate to contact me.", "negative": "—"}], "example": {"en": "I was wondering if you could send me the report. I see your point, but I have a different perspective.", "fr": "Je me demandais si vous pourriez m''envoyer le rapport. Je comprends votre point de vue, mais j''ai une perspective différente."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"I was wondering if you could...\" est une formule :", "options": ["Très directe", "Polie/atténuée", "Agressive", "Familière"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette formule atténue poliment une demande."}'),
  (2, 'qcm', '{"question": "\"I see your point, but...\" sert à :", "options": ["Accepter totalement", "Exprimer un désaccord poli", "Refuser catégoriquement", "Ignorer l''autre"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette formule exprime un désaccord nuancé et poli."}'),
  (3, 'fill_blank', '{"sentence_before": "Please don''t hesitate to ", "sentence_after": " me if you have questions. (contact)", "correct_answers": ["contact"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Contact me\" complète la formule de clôture."}'),
  (4, 'true_false', '{"statement": "Business English favors indirect, softened requests.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien le cas en anglais des affaires."}'),
  (5, 'matching', '{"instruction": "Relie la formule professionnelle à sa fonction.", "pairs": [{"left": "I was wondering if...", "right": "demande polie"}, {"left": "With all due respect...", "right": "désaccord poli"}, {"left": "Looking forward to...", "right": "clôture"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "was", "wondering", "if", "you", "could", "help."], "correct_sentence": "I was wondering if you could help.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"With all due respect\" introduit :", "options": ["Un compliment simple", "Un désaccord poli mais ferme", "Une question", "Un remerciement"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "Cette formule introduit un désaccord poli mais ferme."}'),
  (8, 'fill_blank', '{"sentence_before": "I ", "sentence_after": " forward to hearing from you soon. (look)", "correct_answers": ["look"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Look forward to\" clôture poliment."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Le slang et les expressions très familières', '{"rule": "Le slang (argot) est très spécifique au contexte informel entre proches — utile à comprendre, mais à utiliser avec prudence selon le contexte.", "table": [{"subject": "chill", "affirmative": "se détendre/tranquille", "negative": "—"}, {"subject": "legit", "affirmative": "authentique/vraiment", "negative": "—"}, {"subject": "no biggie", "affirmative": "pas grave", "negative": "—"}], "example": {"en": "That''s legit amazing! Don''t worry, it''s no biggie.", "fr": "C''est vraiment incroyable ! T''inquiète, c''est pas grave."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "\"No biggie\" veut dire :", "options": ["C''est très grave", "Ce n''est pas grave", "C''est énorme", "C''est impossible"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"No biggie\" = pas grave/pas de problème."}'),
  (2, 'qcm', '{"question": "\"Legit\" (argot) veut dire :", "options": ["Faux", "Vraiment/authentique", "Illégal", "Ennuyeux"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Legit\" = vraiment/authentique en argot."}'),
  (3, 'fill_blank', '{"sentence_before": "Just ", "sentence_after": " out, everything''s fine. (chill)", "correct_answers": ["chill"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Chill out\" = se détendre."}'),
  (4, 'true_false', '{"statement": "Slang should be avoided in professional or formal writing.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien vrai, à éviter en formel."}'),
  (5, 'matching', '{"instruction": "Relie l''expression familière à sa traduction.", "pairs": [{"left": "my bad", "right": "c''est ma faute"}, {"left": "for real", "right": "vraiment/sérieux"}, {"left": "sick (adjectif)", "right": "génial (argot)"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["That''s", "so", "sick,", "for", "real!"], "correct_sentence": "That''s so sick, for real!", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"My bad\" veut dire :", "options": ["Ma mauvaise humeur", "C''est de ma faute, désolé", "Mon ennemi", "Ma dernière chance"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"My bad\" = c''est ma faute (excuse informelle)."}'),
  (8, 'fill_blank', '{"sentence_before": "That movie was ", "sentence_after": " good, for real! (legit)", "correct_answers": ["legit"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Legit\" (argot) = vraiment."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : maîtriser tous les registres de langue', '{"rule": "Cette leçon consolide tous les registres vus dans l''unité : vocabulaire formel/informel, email professionnel, contractions orales, et slang — pour s''adapter à n''importe quel contexte.", "table": [{"subject": "Très formel", "affirmative": "purchase, commence, obtain", "negative": "—"}, {"subject": "Neutre", "affirmative": "buy, start, get", "negative": "—"}, {"subject": "Familier/argot", "affirmative": "grab, kick off, snag", "negative": "—"}], "example": {"en": "Formal email: I am writing to inquire about the position. Casual text: Hey, just wanted to ask about the job, lol.", "fr": "Email formel : Je vous écris pour me renseigner sur le poste. Texto familier : Salut, je voulais juste demander pour le job, mdr."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 35 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Dans un email à un client, on préfère :", "options": ["Hey!", "Dear Sir/Madam,", "Yo!", "Sup"], "correct_index": 1, "feedback_correct": "Correct !", "feedback_incorrect": "\"Dear Sir/Madam\" convient au registre professionnel."}'),
  (2, 'qcm', '{"question": "\"Purchase\" vs \"buy\" — lequel est le plus formel ?", "options": ["purchase", "buy", "les deux sont identiques", "aucun n''est correct"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Purchase\" est plus formel que \"buy\"."}'),
  (3, 'fill_blank', '{"sentence_before": "Formal: I would like to ", "sentence_after": " a meeting. (schedule)", "correct_answers": ["schedule"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Schedule a meeting\" est une formule professionnelle standard."}'),
  (4, 'true_false', '{"statement": "Mastering different registers helps you communicate appropriately in any situation.", "correct_answer": true, "feedback_correct": "Exact, bravo, bilan des registres réussi !", "feedback_incorrect": "Faux — c''est bien l''objectif de cette compétence."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque expression à son registre.", "pairs": [{"left": "purchase", "right": "formel"}, {"left": "buy", "right": "neutre"}, {"left": "grab", "right": "familier"}], "feedback_correct": "Parfait, bilan des registres réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "look", "forward", "to", "your", "reply."], "correct_sentence": "I look forward to your reply.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "\"Gonna\" appartient à quel registre ?", "options": ["Très formel", "Oral familier", "Académique", "Juridique"], "correct_index": 1, "feedback_correct": "Correct ! Bilan des registres réussi.", "feedback_incorrect": "\"Gonna\" est typique de l''oral familier."}'),
  (8, 'fill_blank', '{"sentence_before": "We ", "sentence_after": " forward to working with you. (look)", "correct_answers": ["look"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Look forward to\" est une formule professionnelle."}')
) as v(position, type, content);
