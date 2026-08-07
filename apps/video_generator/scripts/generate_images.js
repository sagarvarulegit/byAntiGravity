const fs = require('fs');
const path = require('path');

const API_KEY = process.env.GEMINI_API_KEY;

if (!API_KEY) {
  console.error("Error: GEMINI_API_KEY environment variable is not set.");
  process.exit(1);
}

const imagesToGenerate = [
  {
    filename: "chlor_alkali_plant.jpg",
    prompt: "Industrial chlor-alkali electrolysis plant setup with warm golden, terracotta, and copper lighting. Clear pipes, bubbling liquids. Photorealistic, zero blue colors. Warm tones only."
  },
  {
    filename: "naoh_crystals.jpg",
    prompt: "Ultra close-up of pure Sodium Hydroxide pellets on a dark copper slate surface. Photorealistic, sharp focus, warm lighting, zero blue colors. Terracotta accent lighting."
  },
  {
    filename: "antacid_stomach.jpg",
    prompt: "Realistic medical visualization of antacid neutralizing acid. Warm glowing colors, terracotta and amber hues. Cinematic lighting, no blue colors."
  }
];

const outputDir = path.join(__dirname, "..", "public", "generated");
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

async function generateImage(image) {
  console.log(`Generating image for: ${image.filename}...`);
  try {
    const url = `https://generativelanguage.googleapis.com/v1beta/models/imagen-3.0-generate-001:predict?key=${API_KEY}`;
    const payload = {
      instances: [{ prompt: image.prompt }],
      parameters: { sampleCount: 1, aspectRatio: "16:9" }
    };

    const response = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });

    if (!response.ok) {
      const err = await response.text();
      throw new Error(`API returned ${response.status}: ${err}`);
    }

    const data = await response.json();
    if (data.predictions && data.predictions.length > 0) {
      const base64Str = data.predictions[0].bytesBase64Encoded;
      const buffer = Buffer.from(base64Str, 'base64');
      const outPath = path.join(outputDir, image.filename);
      fs.writeFileSync(outPath, buffer);
      console.log(`Saved: ${outPath}`);
    } else {
      throw new Error("No predictions returned from API.");
    }
  } catch (err) {
    console.error(`Failed to generate ${image.filename}:`, err.message);
  }
}

async function run() {
  for (const img of imagesToGenerate) {
    await generateImage(img);
  }
  console.log("Image generation complete.");
}

run();
