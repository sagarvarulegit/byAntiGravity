# Project Understanding: CBSE 10th Learning Portal

This file acts as the persistent memory for AI agents working on the CBSE 10th Online Learning Portal. It outlines high-level context, architecture, key discoveries, and styling conventions.

## Core Purpose
An interactive, highly performant Online Learning Portal designed for CBSE Class 10 students. The app runs across Web, Android, and iOS, supporting subscription-based access, offline downloads, streak-based gamification, and rich interactive animations to make complex subjects intuitive.

---

## Architecture & Tech Stack

### 1. Monorepo Directory Layout
- `/apps`
  - `/mobile_web_client` - Responsive **Flutter (Dart)** application.
  - `/backend_api` - Proposed NestJS / Node.js API service layer.
- `/db`
  - `schema.sql` - Primary **PostgreSQL** schema configuration (users, subscriptions, streak counters, quizzes, and mastery logs).
- `/prototype`
  - `index.html`, `styles.css`, `app.js` - High-fidelity interactive **HTML5/CSS/JS mockup** showcasing design systems, checkout paywalls, and canvas graphs.
- `UNDERSTAND.md` - Persistent workspace memory.
- `.antigravity/` - Antigravity AI agent rules and context.

### 2. Client Platform (Flutter)
- **State Management**: Set up ready for Riverpod/Bloc.
- **Theme**: Unified dark and light themes declared in `lib/theme.dart`.
- **Custom Canvas Elements**: Programmatic vector whiteboards drawn on GPU canvases rather than traditional raster video files.
- **Charts**: Custom painted spline line charts (`WeeklyConsistencyChart`) and mastery meters (`MasteryRadialGauge`).

---

## Core Conventions & Rules

### 1. CBSE "Textbook" Styling Guidelines (NCERT Specs)
All views must strictly align with the print textbook visual system:
- **Cream Background**: `#FAF9F6` (light mode scaffold background).
- **Dark Slate Text**: `#0F172A` (primary text).
- **Accent Magenta (`#BE185D`)**: Used for chapter index numbering, warning CAUTION text, and list bullets.
- **Accent Sky Blue (`#0284C7`)**: Used for chapter main titles and drop-caps.
- **Accent Orange (`#EA580C`)**: Used for the "Do You Know?" callout blocks.
- **Textbook Typography**: Notes, figure captions, and warn callouts use the `Georgia` serif font family. UI headings and cards use `Outfit`.

### 2. Video Lecturing Pipeline
Do not use heavy, pre-recorded video media files for math and science diagrams.
- Use programmatic canvas animation loops powered by `AnimationController` and `CustomPainter` to draw lines, circles, and curves interactively.
- This results in zero bandwidth usage, infinite resolution scaling, and native dark mode adaptability.

---

## Ongoing Decisions & Discoveries
- **2026-06-03** - CBSE Textbook Theme implemented. Science Chapter 1 revision notes re-designed to mirror page 1 of the printed textbook (quote at top, title row with custom-drawn QR code, drop-cap first letter, pink square bullets, and custom vector drawing of Magnesium burning over watch-glass).
- **2026-06-03** - Playwright tests need a configured npm project with `@playwright/test` to run; avoid direct execution of playwright tasks outside configured node packages.
