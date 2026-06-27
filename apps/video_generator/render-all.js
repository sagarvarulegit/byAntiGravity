const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const DATA_DIR = path.join(__dirname, 'src', 'data', 'electricity');
// Set output to the root Video-Out directory
const OUT_DIR = path.join(__dirname, '..', '..', 'Video-Out', 'electricity');
// Web client video assets path
const FLUTTER_WEB_VIDEOS_DIR = path.join(__dirname, '..', 'mobile_web_client', 'web', 'videos');

// Ensure output directories exist
if (!fs.existsSync(OUT_DIR)) {
  fs.mkdirSync(OUT_DIR, { recursive: true });
}
if (!fs.existsSync(FLUTTER_WEB_VIDEOS_DIR)) {
  fs.mkdirSync(FLUTTER_WEB_VIDEOS_DIR, { recursive: true });
}

// Get all JSON files in the data directory
const files = fs.readdirSync(DATA_DIR).filter(file => file.endsWith('.json'));

console.log(`Found ${files.length} video configuration files to render.`);

files.forEach(file => {
  const jsonPath = path.join(DATA_DIR, file);
  // Remove numeric prefix if needed, or just keep it
  const outFileName = file.replace('.json', '.mp4');
  const outPath = path.join(OUT_DIR, outFileName);
  const flutterPath = path.join(FLUTTER_WEB_VIDEOS_DIR, outFileName);

  console.log(`\n========================================`);
  console.log(`Rendering ${file} -> ${outPath}`);
  console.log(`========================================`);

  const command = `npx remotion render src/index.ts ElectricityIntro "${outPath}" --props="${jsonPath}"`;
  
  try {
    // Render the video
    execSync(command, { stdio: 'inherit', cwd: __dirname });
    console.log(`Successfully rendered ${outFileName} to Video-Out.`);

    // Copy to flutter web directory
    fs.copyFileSync(outPath, flutterPath);
    console.log(`Copied ${outFileName} to Flutter web/videos directory.`);
  } catch (error) {
    console.error(`Failed to render ${file}:`, error.message);
  }
});

console.log('\nAll renders complete!');
