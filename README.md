# Luma — Guide de déploiement

## Ce que tu vas faire
Mettre le squelette de l'app en ligne, avec un lien partageable, en 3 étapes. Pas besoin de Node.js en local — juste Git.

---

## Étape 1 — Créer ton fichier de clé Supabase

Dans le dossier `luma`, crée un fichier nommé exactement `.env` (avec le point devant) et colle-y :

```
VITE_SUPABASE_URL=https://TON-PROJET.supabase.co
VITE_SUPABASE_ANON_KEY=TA_CLE_ANON_PUBLIC
```

Remplace par les vraies valeurs que tu as notées dans Supabase (Project Settings → API).

> ⚠️ Ce fichier ne sera JAMAIS envoyé sur GitHub (il est dans `.gitignore`). Tu le configureras directement sur Vercel à l'étape 3.

---

## Étape 2 — Envoyer le code sur GitHub

1. Va sur **github.com** → clique sur le **"+"** en haut à droite → **"New repository"**
2. Nomme-le `luma`, laisse tout par défaut, clique **"Create repository"**
3. Ouvre un Terminal (Mac) ou PowerShell (Windows) dans le dossier `luma` et exécute :

```bash
git init
git add .
git commit -m "Premier commit Luma"
git branch -M main
git remote add origin https://github.com/TON_USERNAME/luma.git
git push -u origin main
```

Remplace `TON_USERNAME` par ton nom d'utilisateur GitHub.

> Si Git n'est pas installé, télécharge-le sur [git-scm.com](https://git-scm.com) — contrairement à Node.js, il est indispensable pour cette étape.

---

## Étape 3 — Déployer sur Vercel

1. Va sur **vercel.com** → clique **"Add New Project"**
2. Sélectionne ton repository `luma`
3. Vercel détecte automatiquement que c'est un projet Vite — ne change rien aux réglages de build
4. Avant de cliquer "Deploy", clique sur **"Environment Variables"** et ajoute les deux :
   - **Name** : `VITE_SUPABASE_URL` → **Value** : ton URL Supabase
   - **Name** : `VITE_SUPABASE_ANON_KEY` → **Value** : ta clé anon
5. Clique **"Deploy"**
6. Une fois terminé (1-2 minutes), Vercel te donne un lien du type `luma-xxxx.vercel.app` — c'est ton app en ligne !

---

## Prochaine fois qu'on modifie le code

Je te fournirai les nouveaux fichiers à chaque étape. Il te suffira de les remplacer dans ton dossier local, puis de refaire :

```bash
git add .
git commit -m "description de ce qui a changé"
git push
```

Vercel redéploie automatiquement à chaque `push` — rien d'autre à faire.
