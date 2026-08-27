const fs = require('fs');
const path = require('path');

// Load .env from apps/video_generator/.env
const envPath = path.join(__dirname, '..', 'apps', 'video_generator', '.env');
if (fs.existsSync(envPath)) {
  const envContent = fs.readFileSync(envPath, 'utf8');
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

const apiKey = process.env.ELEVEN_LABS_API_KEY || process.env.ELEVENLABS_API_KEY;
const VOICE_ID = 'g14YnDYCsy3k7XLlcKlO';
const TTS_URL = `https://api.elevenlabs.io/v1/text-to-speech/${VOICE_ID}/with-timestamps`;

const audioDir = path.join(__dirname, 'audio');
if (!fs.existsSync(audioDir)) {
  fs.mkdirSync(audioDir, { recursive: true });
}

// Unhurried pedagogical script following the 4-phase framework
const scriptText = "In Coordinate Geometry, using the textbook formula for the dividing point is messy, and students constantly swap subscripts. Here is the 2-step Criss-Cross Trick! Find point P dividing A(1, 2) and B(4, 8) in ratio 2 is to 1. Setup: write ratio 2 and 1 right above the points! For X: cross-multiply into X-values! 2 times 4 is 8, plus 1 times 1 is 9. Divide by the ratio sum, 2 plus 1, which is 3. 9 divided by 3 gives X equals 3! For Y: 2 times 8 is 16, plus 1 times 2 is 18. Divide 18 by 3, and Y equals 6! Your point is (3, 6)! Practice on ChapterReady.in with Fun and Games, smart Tools, and Mock Tests! Challenge: Find point P for A(2, 3) and B(6, 7) in ratio 1 is to 1! Drop your answer below, because...";

async function run() {
  console.log("Generating unhurried pedagogical audio for Section Formula Short...");
  const response = await fetch(TTS_URL, {
    method: 'POST',
    headers: {
      'xi-api-key': apiKey,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      text: scriptText,
      model_id: 'eleven_multilingual_v2',
      voice_settings: {
        stability: 0.65,
        similarity_boost: 0.75,
        style: 0.0,
        use_speaker_boost: true
      }
    })
  });

  if (!response.ok) {
    const errText = await response.text();
    throw new Error(`ElevenLabs returned ${response.status}: ${errText}`);
  }

  const resJson = await response.json();
  const buffer = Buffer.from(resJson.audio_base64, 'base64');
  const outputPath = path.join(audioDir, 'section_formula_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved narration audio to ${outputPath}`);
}

run().catch(console.error);
