-- ============================================
-- LUMA — Régénération des clés VAPID (mismatch corrigé, erreur "BadJwtToken")
-- Les abonnements existants ont été créés avec l'ancienne clé publique.
-- Comme la nouvelle paire de clés est différente, ces abonnements ne
-- fonctionneront plus jamais — on les supprime pour que les utilisateurs
-- soient invités à se réabonner proprement avec la nouvelle clé.
-- ============================================

delete from push_subscriptions;
