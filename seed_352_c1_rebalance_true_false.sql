-- ============================================
-- LUMA — Fix CRITIQUE : les 48 Vrai/Faux du niveau C1 étaient TOUS marqués
-- "Vrai" (0 "Faux" au total) — un utilisateur pouvait obtenir 100% sans
-- lire une seule question. Rééquilibre 14 énoncés en versions "Faux"
-- plausibles, testant le même point grammatical à l'envers.
-- ============================================

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Not only... but also\" requires inversion in the second clause, not the first."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Not only... but also" requires inversion in the first clause.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Hardly... when\" and \"no sooner... than\" have completely unrelated meanings with no connection to sequence of events."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Hardly... when" and "no sooner... than" both describe two events happening in quick succession.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"This inversion structure is used to soften or downplay a statement, not to emphasize it."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'This inversion adds dramatic emphasis to a sentence.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"Inversion structures are more common in casual everyday speech than in literature."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Inversion structures are more common in written literature than casual speech.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Threaten\" is always followed by the gerund form, never the infinitive."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Threaten" is followed by the infinitive.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Remind\" can be used without an object, just like \"suggest\"."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Remind" always needs an object (remind someone).';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"This emphatic \"do\" is exclusively used in formal written academic English, never in speech."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'This emphatic "do" is mainly used in spoken or persuasive English.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Between a rock and a hard place\" means having many easy choices to pick from."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Between a rock and a hard place" means being stuck with two difficult options.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Best regards\" is considered too casual and inappropriate for a professional email."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Best regards" is an appropriate formal email closing.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"Business English favors blunt, direct commands without any softening."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Business English favors indirect, softened requests.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"Words of Latin origin tend to sound more casual and informal than Germanic-root words."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Words of Latin origin tend to sound more formal in English.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"Slang is encouraged in professional and formal writing to sound more relatable."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Slang should be avoided in professional or formal writing.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"The more idioms you pack into a sentence, the more fluent and impressive you sound."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = 'Idioms should be used naturally in context, not overused.';

update exercises
set content = jsonb_set(
  jsonb_set(content, '{statement}', '"\"Advise\" can never be followed by an infinitive, unlike \"tell\"."'::jsonb),
  '{correct_answer}', 'false'::jsonb
)
where type = 'true_false'
and content->>'statement' = '"Advise" follows the same structure as "tell" in reported speech.';
