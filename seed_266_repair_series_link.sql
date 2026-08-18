-- ============================================
-- LUMA — Diagnostic + réparation : rattachement Tome 1 ↔ série Oz
-- ============================================

-- 1) DIAGNOSTIC : exécute d'abord cette requête seule et regarde le résultat
select id, title, is_series, series_id, volume_number
from books
where title ilike '%Wizard of Oz%' or title ilike '%Tome 1%';

-- Tu dois voir 2 lignes :
--   - "The Wonderful Wizard of Oz"   | is_series = true  | series_id = null
--   - "Tome 1 : Le Cyclone"          | is_series = false | series_id = <l'id de la ligne au-dessus>
--
-- Si la 2e ligne a series_id = null (ou différent), c'est le bug : le tome
-- n'est pas rattaché. La commande ci-dessous corrige ça automatiquement,
-- qu'importe la cause d'origine.

-- 2) RÉPARATION : rattache tout tome orphelin à la bonne série, par titre
update books
set series_id = (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true)
where title = 'Tome 1 : Le Cyclone'
  and series_id is distinct from (select id from books where title = 'The Wonderful Wizard of Oz' and is_series = true);

-- 3) VÉRIFICATION : relance la requête du diagnostic (étape 1), les deux
-- lignes doivent maintenant avoir le même series_id sur la 2e ligne.
