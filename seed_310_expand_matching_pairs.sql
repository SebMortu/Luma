-- ============================================
-- LUMA — Étoffement des exercices "matching" à 2 paires -> 3 paires
-- Recommandation issue de l'audit complet des 36 unités
-- ============================================

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Yesterday, I went...", "right": "past simple"}, {"left": "I have never been to...", "right": "present perfect"}, {"left": "I visited Rome last summer.", "right": "past simple"}]'::jsonb)
where content->>'instruction' = 'Relie l''usage au bon temps.'
  and content->'pairs' @> '[{"left": "Yesterday, I went...", "right": "past simple"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "How long have you lived here?", "right": "For five years."}, {"left": "Since when?", "right": "Since 2018."}, {"left": "How long have you worked here?", "right": "For two years."}]'::jsonb)
where content->>'instruction' = 'Relie la question à sa réponse logique.'
  and content->'pairs' @> '[{"left": "How long have you lived here?", "right": "For five years."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I have never been to India.", "right": "present perfect"}, {"left": "I went to India in 2020.", "right": "past simple"}, {"left": "She has already finished her homework.", "right": "present perfect"}]'::jsonb)
where content->>'instruction' = 'Bilan : relie la phrase à son temps correct.'
  and content->'pairs' @> '[{"left": "I have never been to India.", "right": "present perfect"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "She sings good.", "right": "She sings well."}, {"left": "He runs fastly.", "right": "He runs fast."}, {"left": "She drive to work every day.", "right": "She drives to work every day."}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à sa correction.'
  and content->'pairs' @> '[{"left": "She sings good.", "right": "She sings well."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Shall we dance?", "right": "On danse ?"}, {"left": "What about tomorrow?", "right": "Et demain ?"}, {"left": "How about grabbing lunch?", "right": "Ça te dit de déjeuner ensemble ?"}]'::jsonb)
where content->>'instruction' = 'Relie la proposition à sa traduction.'
  and content->'pairs' @> '[{"left": "Shall we dance?", "right": "On danse ?"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Do it now!", "right": "brusque"}, {"left": "Could you do it, please?", "right": "poli"}, {"left": "Would you mind closing the door?", "right": "très poli"}]'::jsonb)
where content->>'instruction' = 'Relie la formule à son niveau de politesse.'
  and content->'pairs' @> '[{"left": "Do it now!", "right": "brusque"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I have painted the wall.", "right": "résultat visible"}, {"left": "I have been painting all day.", "right": "durée de l''action"}, {"left": "I have been waiting for an hour.", "right": "durée persistante"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à sa nuance.'
  and content->'pairs' @> '[{"left": "I have painted the wall.", "right": "résultat visible"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I have read the book.", "right": "résultat"}, {"left": "I have been reading all night.", "right": "processus"}, {"left": "She has been writing all day.", "right": "processus"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à son accent (résultat/processus).'
  and content->'pairs' @> '[{"left": "I have read the book.", "right": "résultat"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I was sleeping...", "right": "past continuous"}, {"left": "...when the alarm rang.", "right": "past simple"}, {"left": "Suddenly, the phone rang.", "right": "past simple"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase au bon temps.'
  and content->'pairs' @> '[{"left": "I was sleeping...", "right": "past continuous"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I was cooking", "right": "when the smoke alarm rang"}, {"left": "She was driving", "right": "when she saw the accident"}, {"left": "They were talking", "right": "when the teacher walked in"}]'::jsonb)
where content->>'instruction' = 'Relie l''action en cours à son interruption.'
  and content->'pairs' @> '[{"left": "I was cooking", "right": "when the smoke alarm rang"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "If I win (réaliste)", "right": "first"}, {"left": "If I were a millionaire (hypothétique)", "right": "second"}, {"left": "If I had studied harder (regret passé)", "right": "third"}]'::jsonb)
where content->>'instruction' = 'Relie la situation au bon conditionnel.'
  and content->'pairs' @> '[{"left": "If I win (réaliste)", "right": "first"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Take an umbrella", "right": "in case it rains"}, {"left": "Bring your ID", "right": "in case they ask"}, {"left": "Save your work", "right": "in case the computer crashes"}]'::jsonb)
where content->>'instruction' = 'Relie la précaution à sa raison.'
  and content->'pairs' @> '[{"left": "Take an umbrella", "right": "in case it rains"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Someone stole my bike.", "right": "My bike was stolen."}, {"left": "They built this in 1990.", "right": "This was built in 1990."}, {"left": "They will announce the results.", "right": "The results will be announced."}]'::jsonb)
where content->>'instruction' = 'Relie la phrase active à sa version passive.'
  and content->'pairs' @> '[{"left": "Someone stole my bike.", "right": "My bike was stolen."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Law Passed", "right": "Une loi a été adoptée"}, {"left": "Building Destroyed", "right": "Un bâtiment a été détruit"}, {"left": "New Rules Announced", "right": "De nouvelles règles ont été annoncées"}]'::jsonb)
where content->>'instruction' = 'Relie le titre à sa signification.'
  and content->'pairs' @> '[{"left": "Law Passed", "right": "Une loi a été adoptée"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "\"Wait here.\"", "right": "He told me to wait there."}, {"left": "\"Don''t be late.\"", "right": "She told me not to be late."}, {"left": "\"Please help me.\"", "right": "She asked me to help her."}]'::jsonb)
where content->>'instruction' = 'Relie l''ordre direct à sa version rapportée.'
  and content->'pairs' @> '[{"left": "\"Wait here.\"", "right": "He told me to wait there."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "The book that I read...", "right": "déterminative"}, {"left": "My car, which is red,...", "right": "non déterminative"}, {"left": "The man who called you...", "right": "déterminative"}]'::jsonb)
where content->>'instruction' = 'Classe : déterminative ou non déterminative ?'
  and content->'pairs' @> '[{"left": "The book that I read...", "right": "déterminative"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "He arrived late,", "right": "which annoyed the teacher."}, {"left": "She got the job,", "right": "which made her very happy."}, {"left": "It rained all day,", "right": "which ruined our picnic."}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à son commentaire logique.'
  and content->'pairs' @> '[{"left": "He arrived late,", "right": "which annoyed the teacher."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "remember to call", "right": "ne pas oublier d''appeler (futur)"}, {"left": "remember calling", "right": "se souvenir d''avoir appelé (passé)"}, {"left": "stop to smoke", "right": "s''arrêter pour fumer (but)"}]'::jsonb)
where content->>'instruction' = 'Relie la construction à son sens.'
  and content->'pairs' @> '[{"left": "remember to call", "right": "ne pas oublier d''appeler (futur)"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "look forward to", "right": "+ -ing"}, {"left": "want", "right": "+ to + base"}, {"left": "avoid", "right": "+ -ing"}]'::jsonb)
where content->>'instruction' = 'Relie l''expression à sa construction correcte.'
  and content->'pairs' @> '[{"left": "look forward to", "right": "+ -ing"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I should have called.", "right": "regret de ne pas avoir fait"}, {"left": "I shouldn''t have called.", "right": "regret d''avoir fait"}, {"left": "He must have left already.", "right": "déduction forte"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à son sens.'
  and content->'pairs' @> '[{"left": "I should have called.", "right": "regret de ne pas avoir fait"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "How could you have forgotten?!", "right": "surprise/colère"}, {"left": "She might not have known.", "right": "doute"}, {"left": "You could have told me!", "right": "reproche"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à son émotion.'
  and content->'pairs' @> '[{"left": "How could you have forgotten?!", "right": "surprise/colère"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Fait scientifique", "right": "zero conditional"}, {"left": "Situation future réaliste", "right": "first conditional"}, {"left": "Situation passée impossible", "right": "third conditional"}]'::jsonb)
where content->>'instruction' = 'Relie la situation au bon conditionnel.'
  and content->'pairs' @> '[{"left": "Fait scientifique", "right": "zero conditional"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I''d rather you left.", "right": "je préférerais que tu partes"}, {"left": "It''s time you left.", "right": "il est temps que tu partes"}, {"left": "If only I had known.", "right": "si seulement j''avais su (regret)"}]'::jsonb)
where content->>'instruction' = 'Relie la structure à son sens.'
  and content->'pairs' @> '[{"left": "I''d rather you left.", "right": "je préférerais que tu partes"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "When I arrived, the film...", "right": "had already started"}, {"left": "She was tired because she...", "right": "had been working all day"}, {"left": "By the time we got home,", "right": "it had stopped raining"}]'::jsonb)
where content->>'instruction' = 'Relie la situation à l''action antérieure.'
  and content->'pairs' @> '[{"left": "When I arrived, the film...", "right": "had already started"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I painted my room.", "right": "je l''ai fait moi-même"}, {"left": "I had my room painted.", "right": "quelqu''un l''a fait pour moi"}, {"left": "I cut my hair.", "right": "je l''ai fait moi-même"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à son sens.'
  and content->'pairs' @> '[{"left": "I painted my room.", "right": "je l''ai fait moi-même"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "It is reported that", "right": "il est rapporté que"}, {"left": "It is expected that", "right": "on s''attend à ce que"}, {"left": "It is believed that", "right": "on pense que"}]'::jsonb)
where content->>'instruction' = 'Relie la structure impersonnelle à sa traduction.'
  and content->'pairs' @> '[{"left": "It is reported that", "right": "il est rapporté que"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "___ it was expensive, I bought it. (fait réel)", "right": "Even though"}, {"left": "I''ll go ___ it rains. (hypothèse)", "right": "even if"}, {"left": "___ the traffic, we arrived on time. (fait réel)", "right": "Despite"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase au bon connecteur.'
  and content->'pairs' @> '[{"left": "___ it was expensive, I bought it. (fait réel)", "right": "Even though"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Regret sur soi (présent)", "right": "wish + past simple"}, {"left": "Irritation envers autrui", "right": "wish + would"}, {"left": "Souhait pour l''avenir", "right": "wish + would"}]'::jsonb)
where content->>'instruction' = 'Relie l''usage à la bonne structure wish.'
  and content->'pairs' @> '[{"left": "Regret sur soi (présent)", "right": "wish + past simple"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I''d rather stay (moi-même)", "right": "base verbale"}, {"left": "I''d rather you stayed (autrui)", "right": "past simple"}, {"left": "It''s high time we left (urgence)", "right": "past simple"}]'::jsonb)
where content->>'instruction' = 'Relie la structure au bon contexte.'
  and content->'pairs' @> '[{"left": "I''d rather stay (moi-même)", "right": "base verbale"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Suppose you won...", "right": "If you won..."}, {"left": "Supposing it''s true...", "right": "If it''s true..."}, {"left": "Imagine you had more time...", "right": "If you had more time..."}]'::jsonb)
where content->>'instruction' = 'Relie la structure hypothétique à son équivalent avec "if".'
  and content->'pairs' @> '[{"left": "Suppose you won...", "right": "If you won..."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "So loud was the music", "right": "that we couldn''t talk"}, {"left": "Such was the silence", "right": "that I could hear my heartbeat"}, {"left": "So tired was she", "right": "that she fell asleep instantly"}]'::jsonb)
where content->>'instruction' = 'Relie la structure d''intensité à son inversion.'
  and content->'pairs' @> '[{"left": "So loud was the music", "right": "that we couldn''t talk"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Were I rich...", "right": "If I were rich..."}, {"left": "Had she known...", "right": "If she had known..."}, {"left": "Should you need help...", "right": "If you should need help..."}]'::jsonb)
where content->>'instruction' = 'Relie la structure inversée à sa version avec "if".'
  and content->'pairs' @> '[{"left": "Were I rich...", "right": "If I were rich..."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Never had I seen...", "right": "emphase sur l''unicité"}, {"left": "Little did she know...", "right": "suspense/ironie dramatique"}, {"left": "Not only did she win...", "right": "insistance sur le double exploit"}]'::jsonb)
where content->>'instruction' = 'Relie la structure inversée à son effet narratif.'
  and content->'pairs' @> '[{"left": "Never had I seen...", "right": "emphase sur l''unicité"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "recommend", "right": "+ -ing ou that + subjonctif"}, {"left": "urge", "right": "+ to + base"}, {"left": "deny", "right": "+ -ing"}]'::jsonb)
where content->>'instruction' = 'Relie le verbe à sa construction.'
  and content->'pairs' @> '[{"left": "recommend", "right": "+ -ing ou that + subjonctif"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "C''est lui qui a fait ça", "right": "It''s him who did that"}, {"left": "Ce qu''il faut, c''est du temps", "right": "What''s needed is time"}, {"left": "C''est demain que ça se passe", "right": "It''s tomorrow that it happens"}]'::jsonb)
where content->>'instruction' = 'Relie la structure française à sa traduction anglaise.'
  and content->'pairs' @> '[{"left": "C''est lui qui a fait ça", "right": "It''s him who did that"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "All I need is time.", "right": "What I need is time."}, {"left": "The thing that matters is honesty.", "right": "What matters is honesty."}, {"left": "It was her honesty that impressed me.", "right": "What impressed me was her honesty."}]'::jsonb)
where content->>'instruction' = 'Relie la structure à son équivalent what-cleft.'
  and content->'pairs' @> '[{"left": "All I need is time.", "right": "What I need is time."}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I like it.", "right": "I do like it!"}, {"left": "She understands.", "right": "She does understand."}, {"left": "He apologized.", "right": "He did apologize!"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase neutre à sa version emphatique.'
  and content->'pairs' @> '[{"left": "I like it.", "right": "I do like it!"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "a tough nut to crack", "right": "un problème difficile à résoudre"}, {"left": "hit a wall", "right": "se heurter à un obstacle"}, {"left": "an uphill battle", "right": "une lutte difficile"}]'::jsonb)
where content->>'instruction' = 'Relie l''idiome de difficulté à sa traduction.'
  and content->'pairs' @> '[{"left": "a tough nut to crack", "right": "un problème difficile à résoudre"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "on a tight budget", "right": "avec un budget serré"}, {"left": "break the bank", "right": "coûter une fortune"}, {"left": "save for a rainy day", "right": "économiser pour les coups durs"}]'::jsonb)
where content->>'instruction' = 'Relie l''idiome à sa traduction.'
  and content->'pairs' @> '[{"left": "on a tight budget", "right": "avec un budget serré"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "hit the jackpot", "right": "réussite inattendue"}, {"left": "cost an arm and a leg", "right": "prix très élevé"}, {"left": "back to square one", "right": "retour au point de départ"}]'::jsonb)
where content->>'instruction' = 'Relie l''idiome au contexte approprié.'
  and content->'pairs' @> '[{"left": "hit the jackpot", "right": "réussite inattendue"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "a lesson learned", "right": "une leçon apprise"}, {"left": "fail forward", "right": "échouer pour progresser"}, {"left": "a blessing in disguise", "right": "un mal pour un bien"}]'::jsonb)
where content->>'instruction' = 'Relie l''idiome d''échec à sa traduction.'
  and content->'pairs' @> '[{"left": "a lesson learned", "right": "une leçon apprise"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "call the shots", "right": "prendre les décisions"}, {"left": "get ahead", "right": "progresser/prendre de l''avance"}, {"left": "climb the ladder", "right": "gravir les échelons"}]'::jsonb)
where content->>'instruction' = 'Relie l''idiome professionnel à sa traduction.'
  and content->'pairs' @> '[{"left": "call the shots", "right": "prendre les décisions"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Email au PDG", "right": "très formel"}, {"left": "Message à un ami", "right": "informel"}, {"left": "CV professionnel", "right": "formel"}]'::jsonb)
where content->>'instruction' = 'Relie le contexte au registre approprié.'
  and content->'pairs' @> '[{"left": "Email au PDG", "right": "très formel"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "Every day, I work.", "right": "present simple"}, {"left": "Right now, I am working.", "right": "present continuous"}, {"left": "We are meeting friends tonight (prévu).", "right": "present continuous (futur proche)"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase au bon temps.'
  and content->'pairs' @> '[{"left": "Every day, I work.", "right": "present simple"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "can", "right": "présent"}, {"left": "could", "right": "passé"}, {"left": "will be able to", "right": "futur"}]'::jsonb)
where content->>'instruction' = 'Relie can et could à leur temps.'
  and content->'pairs' @> '[{"left": "can", "right": "présent"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I play tennis on Mondays.", "right": "present simple"}, {"left": "I am playing tennis now.", "right": "present continuous"}, {"left": "She works every day.", "right": "present simple"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase au bon temps.'
  and content->'pairs' @> '[{"left": "I play tennis on Mondays.", "right": "present simple"}]'::jsonb;

update exercises
set content = jsonb_set(content, '{pairs}', '[{"left": "I am eating now.", "right": "présent en cours"}, {"left": "I am eating with him Friday.", "right": "futur planifié"}, {"left": "I will probably be late.", "right": "prédiction incertaine"}]'::jsonb)
where content->>'instruction' = 'Relie la phrase à son usage.'
  and content->'pairs' @> '[{"left": "I am eating now.", "right": "présent en cours"}]'::jsonb;
