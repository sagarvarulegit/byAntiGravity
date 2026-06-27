const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Simple regex .env loader
const envPath = path.join(__dirname, '.env');
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

const DATA_DIR = path.join(__dirname, 'src', 'data', 'electricity');
const PUBLIC_AUDIO_DIR = path.join(__dirname, 'public', 'audio', 'electricity');

// Ensure public audio directory exists
if (!fs.existsSync(PUBLIC_AUDIO_DIR)) {
  fs.mkdirSync(PUBLIC_AUDIO_DIR, { recursive: true });
}

// Voice ID (Provided by user)
const VOICE_ID = 'g14YnDYCsy3k7XLlcKlO';
const TTS_URL = `https://api.elevenlabs.io/v1/text-to-speech/${VOICE_ID}/with-timestamps`;

// Helper to get duration of audio file in seconds using ffprobe
function getAudioDuration(filePath) {
  try {
    const output = execSync(`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "${filePath}"`);
    return parseFloat(output.toString().trim());
  } catch (error) {
    console.error(`ffprobe failed for ${filePath}:`, error.message);
    return 5.0; // fallback to 5 seconds if ffprobe fails
  }
}

// Helper to mock alignments if we already have the audio
function mockAlignments(text, durationSecs) {
  const words = text.split(/\s+/).filter(w => w.length > 0);
  const totalChars = words.join('').length;
  const timePerChar = durationSecs / totalChars;
  
  const alignments = [];
  let currentTime = 0;
  
  for (const word of words) {
    const wordDuration = word.length * timePerChar;
    alignments.push({
      word: word,
      start: currentTime,
      end: currentTime + wordDuration
    });
    // add a small pause between words
    currentTime += wordDuration + (timePerChar * 0.5); 
  }
  
  return alignments;
}

// Helper to make API request to ElevenLabs using fetch
async function generateSpeechWithTimestamps(text, outputPath) {
  if (!apiKey) {
    console.error('Error: Eleven Labs API key not found in process.env or .env file, and audio file needs to be generated!');
    process.exit(1);
  }

  console.log(`Generating speech with timestamps for: "${text.substring(0, 60)}..."`);
  
  const response = await fetch(TTS_URL, {
    method: 'POST',
    headers: {
      'xi-api-key': apiKey,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      text: text,
      model_id: 'eleven_multilingual_v2', // v2 has much better natural pacing than v1
      voice_settings: {
        stability: 0.65, // slightly higher stability helps prevent rushing
        similarity_boost: 0.75,
        style: 0.0,
        use_speaker_boost: true
      }
    })
  });

  if (!response.ok) {
    const errorText = await response.text();
    throw new Error(`ElevenLabs API returned ${response.status}: ${errorText}`);
  }

  const responseJson = await response.json();
  const audioBase64 = responseJson.audio_base64;
  const alignment = responseJson.alignment;

  const buffer = Buffer.from(audioBase64, 'base64');
  fs.writeFileSync(outputPath, buffer);

  // Parse character alignments into word alignments
  const wordAlignments = [];
  if (alignment && alignment.characters) {
    let currentWord = "";
    let currentWordStart = null;
    let currentWordEnd = null;

    for (let i = 0; i < alignment.characters.length; i++) {
      const char = alignment.characters[i];
      const start = alignment.character_start_times_seconds[i];
      const end = alignment.character_end_times_seconds[i];

      if (char.match(/\s/)) {
        if (currentWord.length > 0) {
          wordAlignments.push({ word: currentWord, start: currentWordStart, end: currentWordEnd });
          currentWord = "";
          currentWordStart = null;
        }
      } else {
        if (currentWord.length === 0) {
          currentWordStart = start;
        }
        currentWord += char;
        currentWordEnd = end;
      }
    }
    if (currentWord.length > 0) {
      wordAlignments.push({ word: currentWord, start: currentWordStart, end: currentWordEnd });
    }
  }

  return wordAlignments;
}

// Get script text based on scene type
function getSpeechTextForScene(scene) {
  const content = scene.content;
  switch (scene.type) {
    case 'title':
      return `${content.text}. ${content.subtitle || ''}`;
    case 'kinetic_typography':
      return content.text;
    case 'text':
      return `${content.heading}. ${content.bullets.join('. ')}`;
    case 'diagram':
      return `${content.title}. ${content.subtitle || ''}`;
    default:
      return '';
  }
}

async function run() {
  const files = fs.readdirSync(DATA_DIR).filter(file => file.endsWith('.json'));
  console.log(`Found ${files.length} script files to process for audio.`);

  for (const file of files) {
    const jsonPath = path.join(DATA_DIR, file);
    const videoData = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    console.log(`\nProcessing ${file} (${videoData.title})...`);

    let totalDurationInFrames = 0;
    const fps = videoData.fps || 30;

    for (const scene of videoData.scenes) {
      const text = getSpeechTextForScene(scene);
      if (!text) continue;

      const audioFileName = `${videoData.id}_${scene.id}.mp3`;
      const audioPath = path.join(PUBLIC_AUDIO_DIR, audioFileName);

      try {
        let alignments = scene.alignments;

        // Regenerate if we don't have alignments saved yet
        if (!fs.existsSync(audioPath)) {
          alignments = await generateSpeechWithTimestamps(text, audioPath);
        } else if (!scene.alignments) {
          console.log(`Audio exists for ${scene.id} but missing alignments. Mocking alignments based on duration.`);
          const durationSecs = getAudioDuration(audioPath);
          alignments = mockAlignments(text, durationSecs);
        } else {
          console.log(`Audio and alignments already exist for ${scene.id}, skipping generation.`);
        }

        scene.alignments = alignments;

        // Get duration and update JSON values
        const durationSecs = getAudioDuration(audioPath);
        // Add a padding of 15 frames (0.5s) to the end of each scene so it doesn't cut off abruptly
        const paddingFrames = 15;
        const durationInFrames = Math.ceil(durationSecs * fps) + paddingFrames;

        scene.durationInFrames = durationInFrames;
        scene.audio = `/audio/electricity/${audioFileName}`;
        totalDurationInFrames += durationInFrames;

        console.log(`Scene ${scene.id}: ${durationSecs.toFixed(2)}s (${durationInFrames} frames including padding)`);
      } catch (error) {
        console.error(`Error processing scene ${scene.id}:`, error.message);
        process.exit(1);
      }
    }

    // Update root duration
    videoData.durationInFrames = totalDurationInFrames;
    fs.writeFileSync(jsonPath, JSON.stringify(videoData, null, 2));
    console.log(`Updated JSON for ${file}. Total duration: ${totalDurationInFrames} frames.`);
  }

  console.log('\nAll voiceover generation and JSON updates complete!');
}

run();
