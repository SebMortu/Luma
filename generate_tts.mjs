// ============================================
// LUMA — Génération audio via OpenAI TTS
// Lit tts_manifest.json (320 phrases) et génère un fichier .mp3 par phrase
// dans le dossier ./audio_output/. Reprend automatiquement là où il s'était
// arrêté si le script est relancé (ignore les fichiers déjà générés) —
// pratique en cas de coupure internet ou d'interruption.
// ============================================

import OpenAI from "openai";
import fs from "fs";
import path from "path";

const client = new OpenAI(); // Lit automatiquement OPENAI_API_KEY depuis l'environnement

const OUTPUT_DIR = "./audio_output";
const MANIFEST_PATH = "./tts_manifest.json";

// Voix disponibles chez OpenAI : alloy, echo, fable, onyx, nova, shimmer
// "nova" est une voix féminine claire et naturelle, un bon choix par défaut
// pour de l'apprentissage de langue. Change ici si tu préfères une autre voix.
const VOICE = "nova";
const MODEL = "tts-1-hd"; // "tts-1" est moins cher mais légèrement moins naturel

async function main() {
  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR);

  const manifest = JSON.parse(fs.readFileSync(MANIFEST_PATH, "utf-8"));
  console.log(`${manifest.length} phrases à traiter.\n`);

  let done = 0;
  let skipped = 0;

  for (const entry of manifest) {
    const outPath = path.join(OUTPUT_DIR, entry.filename);

    if (fs.existsSync(outPath)) {
      skipped++;
      continue;
    }

    try {
      const response = await client.audio.speech.create({
        model: MODEL,
        voice: VOICE,
        input: entry.text,
        speed: 0.95, // légèrement ralenti, adapté à l'apprentissage
      });

      const buffer = Buffer.from(await response.arrayBuffer());
      fs.writeFileSync(outPath, buffer);
      done++;
      console.log(`✓ [${done}/${manifest.length - skipped}] ${entry.text.slice(0, 50)}...`);
    } catch (err) {
      console.error(`✗ Échec pour "${entry.text.slice(0, 40)}..." : ${err.message}`);
    }
  }

  console.log(`\nTerminé. ${done} fichiers générés, ${skipped} déjà présents (ignorés).`);
  console.log(`Les fichiers sont dans le dossier : ${OUTPUT_DIR}`);
}

main();
