const fs = require('fs');
const path = require('path');

// Load .env
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

const scriptText = "Stop wasting time finding LCM to add fractions! Use the 5-second Butterfly Trick instead! Let's add 3 over 4 plus 2 over 5! Draw wing number one around 3 and 5. Multiply 3 times 5 to get 15! Draw wing number two around 2 and 4. Multiply 2 times 4 to get 8! Now form the body at the bottom! Multiply denominators 4 times 5 to get 20! Add the two antennas: 15 plus 8 equals 23! Put that over 20, and your answer is 23 over 20! Boom! What is 1 over 3 plus 2 over 7? Drop your answer in the comments below!";

async function run() {
  console.log("Generating audio for Butterfly Method...");
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
  const outputPath = path.join(audioDir, 'butterfly_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved audio to ${outputPath}`);
}

run().catch(console.error);
