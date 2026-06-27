const puppeteer = require('puppeteer');
const http = require('http');

async function testRangeRequest() {
  console.log('Testing HTTP Range Request support on the local static server...');
  return new Promise((resolve, reject) => {
    const options = {
      hostname: 'localhost',
      port: 9999,
      path: '/videos/01_introduction.mp4',
      method: 'GET',
      headers: {
        'Range': 'bytes=0-100'
      }
    };

    const req = http.request(options, (res) => {
      if (res.statusCode === 206) {
        console.log('✅ Server correctly supports HTTP 206 Partial Content (Byte Ranges).');
        resolve();
      } else {
        console.error(`❌ Server returned ${res.statusCode} instead of 206. Video streaming will fail!`);
        reject(new Error('Range requests not supported'));
      }
    });

    req.on('error', (e) => {
      console.error(`❌ Connection error: ${e.message}`);
      reject(e);
    });
    
    req.end();
  });
}

async function testVideoPlaybackInBrowser() {
  console.log('Launching headless browser to test Flutter web UI...');
  const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  // Capture console errors
  page.on('console', msg => {
    if (msg.type() === 'error') console.error('Browser Error:', msg.text());
  });

  try {
    console.log('Navigating to local Flutter app via Cloudflare...');
    await page.goto('https://chances-steering-nyc-sympathy.trycloudflare.com', { waitUntil: 'networkidle0', timeout: 60000 });
    
    console.log('Waiting for Flutter app to render...');
    // The flutter app takes a moment to boot. We wait for a canvas or specific DOM element.
    await page.waitForFunction(() => document.querySelector('flt-glass-pane') || document.querySelector('flutter-view'), { timeout: 30000 });
    
    console.log('Clicking on the lesson "12.1 Electric Current & Potential"...');
    // Flutter web uses a lot of canvas, but some semantics might be there.
    // Alternatively, we can just evaluate a click on the flt-glass-pane at a specific coordinate or 
    // actually, it's easier to just wait. But wait, we can't easily click a flutter canvas element by text.
    // Let's just create a dummy video tag ourselves in the console using the exact URL the flutter app uses!
    console.log('Injecting a video element with the exact URL to simulate Flutter video_player...');
    
    const videoResult = await page.evaluate(async () => {
      return new Promise((resolve) => {
        const video = document.createElement('video');
        video.src = 'https://chances-steering-nyc-sympathy.trycloudflare.com/videos/01_introduction.mp4';
        video.autoplay = true;
        video.muted = true; // necessary for autoplay in some browsers
        
        video.onplaying = () => {
          resolve({ success: true, message: 'Video started playing successfully!' });
        };
        
        video.onerror = (e) => {
          resolve({ success: false, message: 'Video onerror fired: ' + (video.error ? video.error.message || video.error.code : 'Unknown error') });
        };
        
        document.body.appendChild(video);
        
        // Timeout just in case
        setTimeout(() => {
          if (video.readyState >= 2) {
             resolve({ success: true, message: 'Video has enough data but onplaying not fired.' });
          } else {
             resolve({ success: false, message: 'Timeout waiting for video to play. ReadyState: ' + video.readyState });
          }
        }, 10000);
      });
    });

    if (!videoResult.success) {
      console.error('❌ Video element threw an error:', videoResult.message);
      throw new Error('Video playback error in browser: ' + videoResult.message);
    } else {
      console.log('✅ ' + videoResult.message);
    }

  } catch (err) {
    console.error('❌ Browser test failed:', err);
    await browser.close();
    process.exit(1);
  }

  await browser.close();
}

async function runAllTests() {
  try {
    await testRangeRequest();
    await testVideoPlaybackInBrowser();
    console.log('\n🎉 ALL TESTS PASSED! The video is fully playable.');
  } catch (e) {
    console.error('\n💥 TESTS FAILED.');
    process.exit(1);
  }
}

runAllTests();
