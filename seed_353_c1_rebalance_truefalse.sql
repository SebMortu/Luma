-- ============================================
-- LUMA — Audit expert C1 : rééquilibrage des Vrai/Faux
-- Les 48 exercices Vrai/Faux du niveau C1 étaient TOUS marqués "Vrai" (100%),
-- rendant le format devinable sans lire la question. 13 affirmations
-- converties en variantes fausses mais plausibles, sur le même sujet,
-- pour retrouver un vrai mélange (35 Vrai / 13 Faux après ce correctif).
-- ============================================

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Not only... but also\" requires inversion in both clauses."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Not only... but also" requires inversion in the first clause.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Threaten\" is followed by the gerund, like \"enjoy\"."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Threaten" is followed by the infinitive.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"The subjunctive after \"recommend that\" adds \"-s\" for \"he/she\", just like the normal present tense."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'The subjunctive after "recommend that" uses the base form, even for "he/she".';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Remind\" can be used without an object, exactly like \"say\"."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Remind" always needs an object (remind someone).';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Hit the jackpot\" means to lose everything unexpectedly."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Hit the jackpot" means to achieve great unexpected success.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Between a rock and a hard place\" means having two excellent options to choose from."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Between a rock and a hard place" means being stuck with two difficult options.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Save for a rainy day\" means to spend money quickly before it''s too late."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Save for a rainy day" means to save money for future difficulties.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Kids\" and \"children\" have exactly the same register."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Kids" is more informal than "children".';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Wanna\", \"gonna\", and \"gotta\" are standard in formal written English."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Wanna", "gonna", and "gotta" are typical of casual spoken English.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"Words of Germanic origin always sound more formal than Latin-origin words in English."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Words of Latin origin tend to sound more formal in English.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"In the driver''s seat\" means being confused and lost."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"In the driver''s seat" means being in control of a situation.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Insist\" can never be followed by \"that + clause\", only by a gerund."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Insist" can be followed by "that + clause".';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"Business English favors blunt, direct commands without any softening."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Business English favors indirect, softened requests.';
