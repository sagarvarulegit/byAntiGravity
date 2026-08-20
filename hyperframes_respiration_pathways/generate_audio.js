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

// 52-54s high-energy, engaging educational narration without overclaiming "guaranteed"
const scriptText = "One glucose molecule, three possible endings! First, in the cytoplasm, glucose breaks down into pyruvate. Where does it go next? Pathway 1: In yeast with no oxygen, it ferments into ethanol and carbon dioxide! Pathway 2: During a fast sprint with not enough oxygen, your muscle cells produce lactic acid, which causes painful cramps! Pathway 3: With plenty of oxygen in your mitochondria, it breaks down completely into carbon dioxide, water, and massive energy! Level up your board exam prep on ChapterReady.in! Play interactive Fun and Games, and grab printable Cheat Sheets and Formula Packs from our Store! Challenge: What builds up in your muscles during heavy exercise? Drop your answer in the comments below, because...";

async function run() {
  console.log("Generating voiceover for 3 Respiration Pathways Short...");
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
  const outputPath = path.join(audioDir, 'respiration_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved narration audio to ${outputPath}`);
}

run().catch(console.error);
