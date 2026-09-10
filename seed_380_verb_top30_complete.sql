-- ============================================
-- LUMA — Complète le "Top 30" à 30 verbes (il n'y en avait que 21)
-- 9 verbes très fréquents à l'oral, choisis parmi ceux non encore marqués
-- prioritaires : eat, speak, write, fall, wear, buy, bring, sit, pay.
-- ============================================

update irregular_verbs set is_priority = true
where base_form in ('eat', 'speak', 'write', 'fall', 'wear', 'buy', 'bring', 'sit', 'pay')
  and language_id = (select id from languages where code = 'en');
