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

// 52-second concise script for Parallel Resistance Shortcut
const scriptText = "Stop wasting 2 minutes on LCM fractions in your Physics Board Exam! Calculate parallel resistance in 3 seconds flat with the Product-Over-Sum cheat code! Look at this Board Question: Two resistors of 6 ohms and 3 ohms in parallel. Instead of solving 1 over Rp, use the shortcut: Multiply on top, Add on bottom! 6 times 3 is 18. 6 plus 3 is 9. 18 divided by 9 gives 2 ohms! Instant 3 marks! Bonus Hack: For identical resistors, just divide by the count! Three 9 ohm resistors in parallel equals 9 divided by 3, which is 3 ohms! Score 100% in your Science Board Exam with our 5 Verified Mock Tests and Tara AI Tutor on ChapterReady.in! Challenge: What is the equivalent resistance of 12 ohms and 4 ohms in parallel? Drop your answer in the comments below, because...";

async function run() {
  console.log("Generating fast-paced 52s audio for Parallel Resistance Short...");
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
  const outputPath = path.join(audioDir, 'resistance_narration.mp3');
  fs.writeFileSync(outputPath, buffer);
  console.log(`✅ Saved tight narration audio to ${outputPath}`);
}

run().catch(console.error);
