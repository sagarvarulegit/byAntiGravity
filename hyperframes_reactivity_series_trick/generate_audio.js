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

const scriptText = "CBSE always tests this exact 3-mark displacement reaction! Stop guessing, and use this 5-second Reactivity Ladder! The order: Potassium, Sodium, Calcium, Magnesium, Aluminium, Zinc, Iron, Lead, and Copper at the bottom! The Golden Rule: Elements at the TOP kick out elements BELOW them! Example 1: Zinc plus Copper Sulphate. Zinc is above Copper, so Zinc kicks Copper out to form Zinc Sulphate plus Copper! Full marks! Example 2: Copper plus Iron Sulphate. Copper is below Iron, so it cannot displace it! Result: No Reaction! Score 100% in your Board Exam with our 5 Verified Mock Tests and Tara AI Tutor on ChapterReady.in! Challenge: Will Iron displace Copper in Iron plus Copper Sulphate? Drop Yes or No in the comments below!";

async function run() {
  console.log("Generating 52s audio for Reactivity Series Short...");
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
  const outputPath = path.join(audioDir, 'reactivity_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved tight narration audio to ${outputPath}`);
}

run().catch(console.error);
