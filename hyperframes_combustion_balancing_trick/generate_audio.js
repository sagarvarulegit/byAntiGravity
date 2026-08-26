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

// 54-second script with explicit Oxygen count explanation (6 + 4 = 10 O)
const scriptText = "Stop guessing when balancing combustion equations! Always follow the 3-step C-H-O rule: Look at Example 1: C3H8 plus O2 gives CO2 plus H2O. Step 1: 3 Carbons gives 3 CO2. Step 2: 8 Hydrogens gives 4 H2O. Step 3: Count total Oxygen from your new products! 3 times 2 is 6, plus 4 from water gives 10 Oxygens! Divide by 2 to get 5 O2! Balanced! Now Example 2: C4H10 plus O2. 4 Carbons gives 4 CO2. 10 Hydrogens gives 5 H2O. Product oxygen is 8 plus 5, which is 13! Divide by 2: 13 over 2 O2. Double all numbers: 2 C4H10 plus 13 O2 gives 8 CO2 plus 10 H2O! Level up on ChapterReady.in with Fun and Games and our Store for Cheat Sheets! Challenge: Balance Ethane: C2H6 plus O2! Drop coefficients below, because...";

async function run() {
  console.log("Generating clear 54s audio with explicit oxygen counting...");
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
  const outputPath = path.join(audioDir, 'combustion_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved updated narration audio to ${outputPath}`);
}

run().catch(console.error);
