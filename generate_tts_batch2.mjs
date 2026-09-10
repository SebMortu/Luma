// ============================================
// LUMA — Génération audio, lot 2 (4 voix alternées : Onyx, Nova, Shimmer, Echo)
// Lit tts_manifest_batch2.json (2065 phrases) et génère un .mp3 par phrase,
// dans la voix qui lui est assignée. Reprend automatiquement là où il s'était
// arrêté si relancé (ignore les fichiers déjà générés).
// ============================================

import OpenAI from "openai";
import fs from "fs";
import path from "path";

const client = new OpenAI();

const OUTPUT_DIR = "./audio_output_batch2";
const MANIFEST_PATH = "./tts_manifest_batch2.json";
const MODEL = "tts-1-hd";

async function main() {
  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR);

  const manifest = JSON.parse(fs.readFileSync(MANIFEST_PATH, "utf-8"));
  console.log(`${manifest.length} phrases à traiter (4 voix alternées).\n`);

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
        voice: entry.voice,
        input: entry.text,
        speed: 0.95,
      });

      const buffer = Buffer.from(await response.arrayBuffer());
      fs.writeFileSync(outPath, buffer);
      done++;
      console.log(`✓ [${done}] (${entry.voice}) ${entry.text.slice(0, 45)}...`);
    } catch (err) {
      console.error(`✗ Échec pour "${entry.text.slice(0, 40)}..." : ${err.message}`);
    }
  }

  console.log(`\nTerminé. ${done} fichiers générés, ${skipped} déjà présents (ignorés).`);
  console.log(`Les fichiers sont dans le dossier : ${OUTPUT_DIR}`);
}

main();
