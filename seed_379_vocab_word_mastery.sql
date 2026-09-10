-- ============================================
-- LUMA — Maîtrise mot par mot (vocabulaire par thème)
-- "Maîtrisé" = 2 bonnes réponses sur ce mot précis, dans les exercices où le
-- mot testé est identifiable sans ambiguïté (QCM, texte à trous). Les
-- exercices d'association et Vrai/Faux ne mettent pas à jour ce suivi (le
-- mot testé y est moins net), donc certains mots resteront "non testés"
-- même après avoir été rencontrés — c'est un suivi partiel mais réel,
-- préférable à une estimation inventée.
-- ============================================

create table user_vocab_word_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  theme_slug text not null,
  word_en text not null,
  correct_count integer not null default 0,
  mastered boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (user_id, theme_slug, word_en)
);

alter table user_vocab_word_progress enable row level security;
create policy "Users manage their own vocab word progress"
  on user_vocab_word_progress for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
