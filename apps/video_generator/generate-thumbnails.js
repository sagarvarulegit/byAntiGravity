const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Simple regex .env loader
const envPath = path.join(__dirname, '.env');
const rootEnvPath = path.join(__dirname, '..', '..', '.env');

function loadEnv(filePath) {
  if (fs.existsSync(filePath)) {
    const envContent = fs.readFileSync(filePath, 'utf8');
    envContent.split('\n').forEach(line => {
      const match = line.match(/^\s*([\w.-]+)\s*=\s*(.*)?\s*$/);
      if (match) {
        const key = match[1];
        let value = match[2] || '';
        if (value.startsWith('"') && value.endsWith('"')) value = value.slice(1, -1);
        process.env[key] = value;
      }
    });
  }
}

loadEnv(envPath);
loadEnv(rootEnvPath);

const apiKey = process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error("❌ ERROR: No GOOGLE_API_KEY or GEMINI_API_KEY found in .env file.");
  console.error("Please add GOOGLE_API_KEY=your_key_here to apps/video_generator/.env");
  process.exit(1);
}

const topic = process.argv[2] || 'ohms_law';
const PUBLIC_IMAGES_DIR = path.join(__dirname, 'public', 'images');

if (!fs.existsSync(PUBLIC_IMAGES_DIR)) {
  fs.mkdirSync(PUBLIC_IMAGES_DIR, { recursive: true });
}

// Preset prompts for key CBSE video topics
const PROMPT_PRESETS = {
  ohms_law: "A high-impact, vibrant YouTube thumbnail for CBSE Class 10 Physics: Ohm's Law. Features bold glowing text 'OHM'S LAW EXPLAINED!' and 'V = I × R', glowing blue electric circuit diagram with glowing electron flow, sleek digital ammeter and voltmeter, dark sleek background with neon blue and yellow light accents, highly engaging for students.",
  light_ray_diagram: "A high-impact, vibrant YouTube thumbnail for CBSE Class 10 Physics: Light Ray Diagrams & Lens Formula. Features bold glowing text 'RAY DIAGRAM TRICK!' and '1/f = 1/v - 1/u', glowing red and yellow laser light rays refracting through a convex glass lens forming a real image, glowing focal points F1 F2, sleek dark background with neon optics light accents, highly engaging for students.",
  parallel_trap: "A high-impact YouTube thumbnail for CBSE Class 10 Physics: The Parallel Resistance Reciprocal Trap. Features bold warning text 'DON'T LOSE 5 MARKS!' and '1/Rp = 1/R1 + 1/R2', glowing electric circuit with warning badge, highly engaging for students.",
  light_ray_diagram_masterclass: "A high-impact, vibrant YouTube thumbnail for CBSE Class 10 Physics: Convex Lens Ray Diagrams. Features bold glowing text 'SCORE 5 MARKS!' and 'RAY DIAGRAM TRICK', a glowing convex lens in the center with red and yellow laser light rays bending through the focal points F1 and F2, an orange arrow (object) on the left and a smaller inverted green arrow (real image) on the right, glowing focal point dots on a dashed principal axis, sleek dark background with neon blue and orange optics light accents, highly engaging for students.",
  magnetic_effects_masterclass: "A high-impact, vibrant YouTube thumbnail for CBSE Class 10 Physics: Magnetic Effects of Electric Current. Features bold glowing text 'MAGNETIC EFFECTS!' and 'ELECTRICITY + MAGNETISM', a glowing bar magnet with blue magnetic field lines, a current-carrying wire with concentric circular field lines around it, a small compass needle, sleek dark background with neon blue, red and amber accents, highly engaging for students.",
  acids_zinc_test: "A high-impact, vibrant YouTube thumbnail for CBSE Class 10 Chemistry: Acids & Zinc Pop Test. Features bold glowing text 'SCORE 5 MARKS!' and 'HYDROGEN POP TEST', a photorealistic clear glass test tube with zinc granules and bubbling acid, a glowing burning matchstick with a small 'POP!' explosion at the mouth of the tube, a 5/5 exam paper floating in the background, sleek dark background with neon terracotta (#EC8366) and blue accents, highly engaging for students.",
  maths_lighthouse_masterclass: "A high-impact, Gen-Z gaming style YouTube thumbnail for CBSE Class 10 Maths: Trigonometry. Features bold glowing Electric Cyan (#06B6D4) text 'LEVEL UP!' and 'THE Z-TRICK CHEAT CODE', a glowing neon cyan 'Z' shape connecting a futuristic lighthouse to a ship on a dark obsidian sea. Includes an RPG-style 'Boss Health Bar' floating above the lighthouse, sleek dark cyberpunk background with glowing cyan and green accents, highly engaging for teenagers.",
  biology_heart_masterclass: "A high-impact, vibrant YouTube thumbnail for CBSE Class 10 Biology: Human Heart Double Circulation. Features bold glowing text 'DON'T LOSE 5 MARKS!' and 'THE V-A TRICK', a realistic glowing red human heart with glowing blue and red blood cell pathways pulsing through it, high-tech neon blue and red arrows showing blood flow, sleek dark background with crimson and cyan light accents, highly engaging for students.",
};

const prompt = PROMPT_PRESETS[topic] || process.argv.slice(2).join(' ') || PROMPT_PRESETS['ohms_law'];
const outputFile = path.join(PUBLIC_IMAGES_DIR, `${topic}_thumbnail.jpg`);

console.log(`🚀 Generating YouTube Thumbnail for topic: "${topic}"...`);
console.log(`🎨 Prompt: "${prompt}"`);

async function generateThumbnail() {
  try {
    // Gemini image model endpoint (the Imagen 3.0/4.0 :predict models are
    // retired or restricted for new accounts; gemini-2.5-flash-image works)
    const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent?key=${apiKey}`;

    const requestBody = {
      contents: [{ parts: [{ text: prompt }] }],
      generationConfig: {
        responseModalities: ["IMAGE"],
        imageConfig: { aspectRatio: "16:9" }
      }
    };

    const response = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(requestBody)
    });

    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(`Google API request failed [${response.status}]: ${errorText}`);
    }

    const data = await response.json();
    const parts = data?.candidates?.[0]?.content?.parts || [];
    const imagePart = parts.find((p) => p.inlineData?.data);

    if (!imagePart) {
      throw new Error("No image returned in API response.");
    }

    const buffer = Buffer.from(imagePart.inlineData.data, 'base64');
    fs.writeFileSync(outputFile, buffer);

    // The Gemini image model returns PNG; keep the .jpg extension truthful.
    if (imagePart.inlineData.mimeType && imagePart.inlineData.mimeType !== 'image/jpeg') {
      const tmpFile = `${outputFile}.tmp.jpg`;
      execSync(`ffmpeg -y -loglevel error -i "${outputFile}" -q:v 2 "${tmpFile}"`);
      fs.renameSync(tmpFile, outputFile);
    }

    console.log(`✅ Success! Thumbnail generated and saved to: ${outputFile}`);
  } catch (error) {
    console.error(`❌ Failed to generate thumbnail:`, error.message);
    process.exit(1);
  }
}

generateThumbnail();
