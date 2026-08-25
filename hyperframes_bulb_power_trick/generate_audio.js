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

// 54-second optimal script for Bulb Voltage & Power Short
const scriptText = "80 percent of students lose marks on this exact Board question! When a 220 volt, 100 watt bulb runs on 110 volts, power does NOT become 50 watts! Here is the 3-second physics shortcut. Inside the bulb, filament resistance R is constant. Since P equals V squared over R, Power is proportional to the SQUARE of voltage! Step 1: Voltage became half, from 220 to 110 volts. Step 2: Square that half to get one fourth! Step 3: Multiply 100 watts by one fourth to get 25 watts! Done in 3 seconds without calculating resistance! Level up your speed on ChapterReady.in with Fun and Games and our Store for Cheat Sheets! Quick challenge: What is the power if voltage is doubled to 440 volts? Drop your answer below, because...";

async function run() {
  console.log("Generating 54s audio for Bulb Voltage & Power Short...");
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
  const outputPath = path.join(audioDir, 'bulb_power_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved 54s narration audio to ${outputPath}`);
}

run().catch(console.error);
