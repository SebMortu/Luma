-- ============================================
-- LUMA — Unité 32 (C1) : doublement + 4 nouvelles leçons
-- ============================================


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 1)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"Study more,\" she advised. → She advised me ___.", "options": ["to study more", "study more", "studying more", "studied more"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Advise someone to\" + infinitif."}'),
  (6, 'fill_blank', '{"sentence_before": "The doctor advised him ", "sentence_after": " rest. (to)", "correct_answers": ["to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Advise + to\" + infinitif."}'),
  (7, 'true_false', '{"statement": "\"Advise\" follows the same structure as \"tell\" in reported speech.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"advise\" suit bien cette structure."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "advised", "me", "to", "wait."], "correct_sentence": "She advised me to wait.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 2)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"I didn''t do it,\" he said. → He denied ___.", "options": ["doing it", "to do it", "do it", "did it"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Deny\" + gérondif."}'),
  (6, 'fill_blank', '{"sentence_before": "She admitted ", "sentence_after": " (make) a mistake.", "correct_answers": ["making"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Admit\" + gérondif : \"making\"."}'),
  (7, 'true_false', '{"statement": "\"Insist\" can be followed by \"that + clause\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"insist that\" est bien correct."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "denied", "stealing", "the", "money."], "correct_sentence": "He denied stealing the money.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 3)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "\"I''ll help you,\" she said. → She promised ___.", "options": ["to help me", "helping me", "help me", "helped me"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Promise\" + infinitif."}'),
  (6, 'fill_blank', '{"sentence_before": "He offered ", "sentence_after": " (carry) my bags.", "correct_answers": ["to carry"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Offer\" + infinitif : \"to carry\"."}'),
  (7, 'true_false', '{"statement": "\"Threaten\" is followed by the infinitive.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"threaten\" est bien suivi de l''infinitif."}'),
  (8, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "threatened", "to", "quit", "her", "job."], "correct_sentence": "She threatened to quit her job.", "feedback_correct": "Parfait !"}')
) as v(position, type, content);


with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 4)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (5, 'qcm', '{"question": "Pour rapporter un refus catégorique, on utilise :", "options": ["deny", "promise", "offer", "suggest"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Deny\" rapporte un refus/une négation."}'),
  (6, 'fill_blank', '{"sentence_before": "She ", "sentence_after": " going to the party. (a suggéré)", "correct_answers": ["suggested"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Suggest\" + gérondif."}'),
  (7, 'true_false', '{"statement": "Choosing the right reporting verb makes reported speech more precise and natural.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien vrai."}'),
  (8, 'matching', '{"instruction": "Relie le verbe introducteur à son usage.", "pairs": [{"left": "deny", "right": "nier"}, {"left": "promise", "right": "promettre"}, {"left": "threaten", "right": "menacer"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32)
insert into lessons (unit_id, position, title, content) select u.id, 5, 'Accuse, blame, apologize for', '{"rule": "Ces verbes introducteurs expriment le blâme et l''excuse : \"accuse someone of\", \"blame someone for\", \"apologize for\", tous suivis du gérondif.", "table": [{"subject": "accuse someone of", "affirmative": "accuser quelqu''un de", "negative": "—"}, {"subject": "blame someone for", "affirmative": "blâmer quelqu''un pour", "negative": "—"}, {"subject": "apologize for", "affirmative": "s''excuser pour", "negative": "—"}], "example": {"en": "He accused her of lying. She apologized for being late.", "fr": "Il l''a accusée de mentir. Elle s''est excusée d''être en retard."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 5)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He accused her ___ (lie).", "options": ["of lying", "to lie", "lying", "lie"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Accuse someone of\" + gérondif."}'),
  (2, 'qcm', '{"question": "Complète : She apologized ___ (forget) the meeting.", "options": ["for forgetting", "to forget", "forgetting", "forget"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Apologize for\" + gérondif."}'),
  (3, 'fill_blank', '{"sentence_before": "They blamed him ", "sentence_after": " the accident. (pour)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Blame someone for\" + gérondif."}'),
  (4, 'true_false', '{"statement": "These verbs are all followed by a preposition + gerund.", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien leur structure commune."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à sa préposition.", "pairs": [{"left": "accuse", "right": "of"}, {"left": "blame", "right": "for"}, {"left": "apologize", "right": "for"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["He", "apologized", "for", "being", "rude."], "correct_sentence": "He apologized for being rude.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : Don''t blame me ___ your mistakes!", "options": ["for", "of", "to", "in"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Blame someone for\" + nom/gérondif."}'),
  (8, 'fill_blank', '{"sentence_before": "She was accused ", "sentence_after": " cheating. (de)", "correct_answers": ["of"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Accuse someone of\" + gérondif."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32)
insert into lessons (unit_id, position, title, content) select u.id, 6, 'Recommend, propose, urge', '{"rule": "\"Recommend\" et \"propose\" (que) peuvent être suivis du gérondif OU de \"that + subjonctif\" (forme sans -s, très formelle). \"Urge\" (exhorter) est suivi de l''infinitif.", "table": [{"subject": "recommend + -ing / that", "affirmative": "recommend trying / recommend that he try", "negative": "—"}, {"subject": "urge + to", "affirmative": "urge someone to act", "negative": "—"}], "example": {"en": "I recommend trying the local dish. The doctor recommended that he rest. They urged us to leave immediately.", "fr": "Je recommande d''essayer le plat local. Le médecin a recommandé qu''il se repose. Ils nous ont exhortés à partir immédiatement."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 6)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I recommend ___ (try) this restaurant.", "options": ["trying", "to try", "try", "tried"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Recommend\" + gérondif : \"trying\"."}'),
  (2, 'qcm', '{"question": "Complète (subjonctif formel) : I recommend that he ___ (be) careful.", "options": ["be", "is", "was", "being"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Subjonctif : base verbale \"be\", sans -s."}'),
  (3, 'fill_blank', '{"sentence_before": "They urged us ", "sentence_after": " act quickly. (to)", "correct_answers": ["to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Urge someone to\" + infinitif."}'),
  (4, 'true_false', '{"statement": "The subjunctive after \"recommend that\" uses the base form, even for \"he/she\".", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — c''est bien la règle du subjonctif."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à sa construction.", "pairs": [{"left": "recommend", "right": "+ -ing ou that + subjonctif"}, {"left": "urge", "right": "+ to + base"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "propose", "that", "we", "postpone", "the", "meeting."], "correct_sentence": "I propose that we postpone the meeting.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : The teacher recommended that she ___ (study) more.", "options": ["study", "studies", "studied", "studying"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "Subjonctif : base verbale \"study\"."}'),
  (8, 'fill_blank', '{"sentence_before": "The coach urged him ", "sentence_after": " give up. (not to)", "correct_answers": ["not to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Urge someone not to\" + infinitif négatif."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32)
insert into lessons (unit_id, position, title, content) select u.id, 7, 'Regret, mention, remind', '{"rule": "\"Regret\" (regretter), \"mention\" (mentionner) sont suivis du gérondif ou de \"that\". \"Remind someone to\" (rappeler à quelqu''un de) est suivi de l''infinitif.", "table": [{"subject": "regret + -ing", "affirmative": "regretter d''avoir fait", "negative": "—"}, {"subject": "mention + -ing/that", "affirmative": "mentionner", "negative": "—"}, {"subject": "remind someone to", "affirmative": "rappeler à quelqu''un de", "negative": "—"}], "example": {"en": "I regret telling him. She mentioned seeing you. Remind me to call her.", "fr": "Je regrette de le lui avoir dit. Elle a mentionné t''avoir vu. Rappelle-moi de l''appeler."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 7)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : I regret ___ (not, study) harder.", "options": ["not studying", "to not study", "not to study", "not study"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Regret\" + gérondif négatif : \"not studying\"."}'),
  (2, 'qcm', '{"question": "Complète : Remind me ___ (call) her tomorrow.", "options": ["to call", "calling", "call", "called"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Remind someone to\" + infinitif."}'),
  (3, 'fill_blank', '{"sentence_before": "She mentioned ", "sentence_after": " (visit) Paris last year.", "correct_answers": ["visiting"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Mention\" + gérondif : \"visiting\"."}'),
  (4, 'true_false', '{"statement": "\"Remind\" always needs an object (remind someone).", "correct_answer": true, "feedback_correct": "Exact !", "feedback_incorrect": "Faux — \"remind\" a bien besoin d''un objet."}'),
  (5, 'matching', '{"instruction": "Relie le verbe à sa construction.", "pairs": [{"left": "regret", "right": "+ -ing"}, {"left": "remind someone", "right": "+ to + base"}, {"left": "mention", "right": "+ -ing ou that"}], "feedback_correct": "Parfait !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["I", "regret", "not", "calling", "her", "sooner."], "correct_sentence": "I regret not calling her sooner.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : He mentioned ___ (know) her from college.", "options": ["knowing", "to know", "know", "knew"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Mention\" + gérondif : \"knowing\"."}'),
  (8, 'fill_blank', '{"sentence_before": "Please remind me ", "sentence_after": " buy milk. (to)", "correct_answers": ["to"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Remind someone to\" + infinitif."}')
) as v(position, type, content);


with u as (select units.id from units join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32)
insert into lessons (unit_id, position, title, content) select u.id, 8, 'Bilan : tous les verbes introducteurs avancés', '{"rule": "Cette leçon consolide tous les verbes introducteurs de l''unité : advise, deny/admit/insist, promise/offer/threaten, accuse/blame/apologize, recommend/urge, regret/mention/remind.", "table": [{"subject": "+ infinitif", "affirmative": "advise, promise, offer, threaten, urge, remind", "negative": "—"}, {"subject": "+ gérondif", "affirmative": "deny, admit, apologize for, regret, mention", "negative": "—"}, {"subject": "+ that (subjonctif)", "affirmative": "insist, recommend, propose", "negative": "—"}], "example": {"en": "She denied lying, apologized for the confusion, and promised to explain everything. I recommend that she be given a second chance.", "fr": "Elle a nié avoir menti, s''est excusée pour la confusion, et a promis de tout expliquer. Je recommande qu''on lui donne une seconde chance."}}'::jsonb from u;

with l as (select lessons.id from lessons join units on units.id = lessons.unit_id join languages on languages.id = units.language_id where languages.code = 'en' and units.position = 32 and lessons.position = 8)
insert into exercises (lesson_id, type, position, content, is_hybrid) select l.id, v.type, v.position, v.content::jsonb, false from l, (values
  (1, 'qcm', '{"question": "Complète : He denied ___ (break) the window.", "options": ["breaking", "to break", "break", "broke"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Deny\" + gérondif."}'),
  (2, 'qcm', '{"question": "Complète : She promised ___ (help) us.", "options": ["to help", "helping", "help", "helped"], "correct_index": 0, "feedback_correct": "Correct !", "feedback_incorrect": "\"Promise\" + infinitif."}'),
  (3, 'fill_blank', '{"sentence_before": "He apologized ", "sentence_after": " the mistake. (pour)", "correct_answers": ["for"], "feedback_correct": "Correct !", "feedback_incorrect": "\"Apologize for\" + gérondif/nom."}'),
  (4, 'true_false', '{"statement": "Different reporting verbs require different grammatical structures.", "correct_answer": true, "feedback_correct": "Exact, bilan des verbes introducteurs réussi !", "feedback_incorrect": "Faux — c''est bien vrai, chacun a sa structure."}'),
  (5, 'matching', '{"instruction": "Bilan : relie chaque verbe à sa construction.", "pairs": [{"left": "advise", "right": "+ to + base"}, {"left": "admit", "right": "+ -ing"}, {"left": "insist", "right": "+ that + subjonctif"}], "feedback_correct": "Parfait, bilan des verbes introducteurs réussi !", "feedback_incorrect": "Quelques erreurs, regarde les corrections."}'),
  (6, 'reorder', '{"instruction": "Remets les mots dans le bon ordre.", "words": ["She", "insisted", "that", "he", "apologize."], "correct_sentence": "She insisted that he apologize.", "feedback_correct": "Parfait !"}'),
  (7, 'qcm', '{"question": "Complète : They accused him ___ (lie).", "options": ["of lying", "to lie", "lying", "lie"], "correct_index": 0, "feedback_correct": "Correct ! Bilan des verbes introducteurs réussi.", "feedback_incorrect": "\"Accuse someone of\" + gérondif."}'),
  (8, 'fill_blank', '{"sentence_before": "I recommend that she ", "sentence_after": " (be) more careful. (subjonctif)", "correct_answers": ["be"], "feedback_correct": "Correct !", "feedback_incorrect": "Subjonctif après \"recommend that\" : base verbale \"be\"."}')
) as v(position, type, content);
