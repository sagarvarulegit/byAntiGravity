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

// 54-second optimal script for Quadratic 3-Step Shortcut
const scriptText = "Stop writing 5 long lines of bracket factoring! For any equation a x squared plus b x plus c equals 0, remember this 3-step cheat code: Step 1: Multiply a and c. Step 2: Find factors that add to b and multiply to a c. Step 3: Divide by a and flip signs! Example 1: x squared minus 7x plus 12 equals 0. a times c is 12. Factors are minus 3 and minus 4. Flip signs: x equals 3 and 4! Example 2: 2x squared minus 7x plus 3 equals 0. Multiply 2 times 3 to get 6. Factors are minus 6 and minus 1. Divide by 2: minus 3 and minus half. Flip signs: x equals 3 and half! Level up on ChapterReady.in with Fun and Games and our Store for Cheat Sheets! Challenge: Solve x squared minus 5x plus 6 equals 0 in 3 seconds! Drop roots below, because...";

async function run() {
  console.log("Generating 54s audio for Quadratic 3-Step Shortcut Short...");
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
  const outputPath = path.join(audioDir, 'quadratic_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved 54s narration audio to ${outputPath}`);
}

run().catch(console.error);
