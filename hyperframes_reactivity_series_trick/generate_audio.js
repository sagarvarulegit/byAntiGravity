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

// 52-second tight script explicitly teaching the mnemonic sentence
const scriptText = "CBSE always tests this 3-mark displacement reaction! Remember the order with this 5-second sentence: Please Stop Calling Me A Careless Zebra, Instead Try Learning How Copper Saves Gold! K, Na, Ca, Mg, Al, C, Zn, Fe, Pb, H, Cu, Ag, Au! Elements at the top kick out elements below them! Example 1: Zinc plus Copper Sulphate. Zinc is above Copper, so it kicks Copper out to form Zinc Sulphate plus Copper! Example 2: Copper plus Iron Sulphate. Copper is below Iron, so it cannot displace it! Result: No Reaction! Score 100% in your Board Exam with 5 Verified Mock Tests and Tara AI Tutor on ChapterReady.in! Will Iron displace Copper in Fe plus CuSO4? Drop Yes or No below!";

async function run() {
  console.log("Generating fast-paced 52s audio with mnemonic sentence...");
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
  console.log(`✅ Saved fast-paced narration audio to ${outputPath}`);
}

run().catch(console.error);
