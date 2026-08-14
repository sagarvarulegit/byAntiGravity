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

const scriptText = "90% of Class 10 students lose 5 marks in Trigonometry because they try to memorize this entire table! What if you could recreate sine, cosine, AND tangent in just 5 seconds? Step 1: Write numbers 0, 1, 2, 3, and 4. Step 2: Divide by 4. Step 3: Take the square root! That gives you sine: 0, 1 over 2, 1 over square root 2, square root 3 over 2, and 1! For cosine, just reverse the order! And for tangent? Simple! Divide sine by cosine! 0 over 1 is 0, 1 over square root 3, 1, square root 3, and 1 over 0 is undefined! Boom! What is tan 60 degrees using this trick? Drop your answer in the comments below, because...";

async function run() {
  console.log("Generating updated audio including Tan trick...");
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
  const outputPath = path.join(audioDir, 'trig_table_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved updated narration audio to ${outputPath}`);
}

run().catch(console.error);
