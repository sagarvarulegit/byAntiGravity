---
type: Plan
title: Implementation Plan: Video Content Delivery via Remotion (Electricity Chapter)
description: This plan outlines the architecture and implementation steps for integrating video content into the CBSE Class 10 Learning Portal, starting with the "...
tags: [plan]
timestamp: 2026-06-26T14:44:34Z
---
# Implementation Plan: Video Content Delivery via Remotion (Electricity Chapter)

## Overview
This plan outlines the architecture and implementation steps for integrating video content into the CBSE Class 10 Learning Portal, starting with the "Electricity" chapter. Based on user requirements, the videos will be generated programmatically using Remotion.

## Design Decisions
1. **Granularity**: Multiple short videos per chapter (topic-wise), similar to a Udemy course structure.
2. **Visual Style**: Programmatic animations using Remotion. Focus on dynamic text, animated diagrams (e.g., circuits), and motion graphics.
3. **Audio**: AI-generated voiceover (e.g., ElevenLabs, OpenAI TTS) synced perfectly with the Remotion animations.
4. **Delivery Architecture**: Pre-render Remotion videos to `.mp4` format on a backend. Upload to Supabase Storage (or CDN) and stream standard MP4s within the Flutter app.
5. **Codebase Location**: A new independent workspace `apps/video_generator/` inside the monorepo.
6. **Data Source**: Structured JSON files in `apps/video_generator/src/data/` containing script, timing, and visual cues.

## Implementation Steps

### Phase 1: Setup Video Generator Project
1. Initialize a new Remotion project in `apps/video_generator/`.
2. Configure basic Remotion setup (compositions, rendering scripts).
3. Set up the `src/data/` directory for storing JSON scripts.
4. Define the JSON schema for a video (e.g., `id`, `title`, `scenes`: array of text, audio track path, duration, visual component type).

### Phase 2: Design System & Shared Tokens
1. Extract NCERT design tokens from `theme.dart` (colors: `#FAF9F6`, `#0F172A`, `#BE185D`, `#0284C7`, `#EA580C`; fonts: Georgia, Outfit).
2. Implement these tokens as CSS variables or styled-components within the Remotion project to ensure brand consistency with the Flutter app.

### Phase 3: Develop Remotion Components
1. Create core React components for video scenes:
   - Title Slide
   - Bullet Points / Text Slide
   - Kinetic Typography Slide
   - Diagram Slide (e.g., simple circuit representation)
2. Implement an audio-sync wrapper to match the text/animations with the AI voiceover timeline.

### Phase 4: Data Preparation (Electricity Chapter)
1. Convert the existing "Electricity" notes into topic-wise JSON scripts.
2. Generate AI voiceovers (MP3/WAV) for each topic script.
3. Place JSON files and audio tracks in `apps/video_generator/src/data/electricity/`.

### Phase 5: Rendering & Storage
1. Write a Node.js script to loop through the JSON files and programmatically call Remotion's CLI/API to render MP4s.
2. Upload the rendered MP4s to Supabase Storage in an `assets/videos` bucket.

### Phase 6: Flutter App Integration
1. Update Supabase Database schema (e.g., `lessons` table) to include a `video_url` field.
2. Add a `VideoPlayer` widget (using `video_player` package or similar) in the `apps/mobile_web_client/` within the lesson view.
3. Fetch the `video_url` from Supabase and stream it in the app.

## Verification
- Run `npm run build` in `apps/video_generator/` to test MP4 generation.
- Check Supabase Storage for the uploaded MP4s.
- Run `flutter analyze` after updating the Flutter app.
- Run `flutter build web` to manually test the video playback on the client.
