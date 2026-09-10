// ============================================
// LUMA — Test comparatif des 6 voix OpenAI TTS
// Génère 3 phrases d'exemple dans chacune des 6 voix disponibles (18 fichiers
// au total), pour comparer rapidement et choisir la meilleure avant de
// régénérer les 320 phrases complètes.
// ============================================

import OpenAI from "openai";
import fs from "fs";
import path from "path";

const client = new OpenAI();

const OUTPUT_DIR = "./voice_samples";
const VOICES = ["alloy", "echo", "fable", "onyx", "nova", "shimmer"];
const SAMPLE_SENTENCES = [
  "Actually, I think you're wrong.",
  "All that matters now is your recovery.",
  "Anyway, that's pretty much it for today.",
];

async function main() {
  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR);

  for (const voice of VOICES) {
    for (let i = 0; i < SAMPLE_SENTENCES.length; i++) {
      const text = SAMPLE_SENTENCES[i];
      const filename = `${voice}_${i + 1}.mp3`;
      const outPath = path.join(OUTPUT_DIR, filename);

      const response = await client.audio.speech.create({
        model: "tts-1-hd",
        voice,
        input: text,
        speed: 0.95,
      });

      const buffer = Buffer.from(await response.arrayBuffer());
      fs.writeFileSync(outPath, buffer);
      console.log(`✓ ${filename}`);
    }
  }

  console.log(`\nTerminé. 18 fichiers dans ${OUTPUT_DIR} — écoute-les et compare.`);
  console.log("Nom des fichiers : voix_1.mp3, voix_2.mp3, voix_3.mp3 pour chaque voix.");
}

main();
