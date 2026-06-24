# GEMINI.md — CBSE Class 10 Learning Portal

Auto-loaded by agy on startup. Keep this file updated as conventions evolve.

## Project Identity
- CBSE Class 10 Online Learning Portal (Flutter/Dart monorepo)
- Firebase Hosting + Supabase backend + Flutter multi-platform client
- Primary source at: `apps/mobile_web_client/`

## Directory Standards
```
apps/mobile_web_client/lib/
  ├── main.dart          # App entry, auth gate, MainShell
  ├── config.dart        # Supabase env vars (injectable)
  ├── models.dart        # All data models
  ├── theme.dart         # AppColors + AppThemes
  ├── services/          # Abstract interfaces + Supabase implementations
  ├── views/             # One file per screen (auth, dashboard, lessons, quiz, progress, billing)
  ├── widgets/           # Reusable components (whiteboard, gauges, charts)
  └── utils/             # Download stubs
db/
  ├── schema.sql         # PostgreSQL DDL (source of truth)
  ├── seed.sql           # NCERT content seed
  └── seed_*.sql         # Additional seed batches
docs/
  ├── ARCHITECTURE.md    # Full system architecture
  └── implementation-plans/ # Per-task implementation plans
```

## Code Conventions
- Services use abstract interface → Supabase implementation pattern (swap-ready)
- All DB queries go through DatabaseService — never inline Supabase calls in views
- Use FutureBuilder pattern for async data in views (loading/error/success states)
- NCERT theme tokens from theme.dart only — no hardcoded colors in views
- Responsive: sidebar > 800px, bottom nav ≤ 800px (LayoutBuilder in MainShell)

## NCERT Design Tokens
| Token | Hex | Usage |
|---|---|---|
| Scaffold Paper | #FAF9F6 | Light mode background |
| Text Primary | #0F172A | Headings, body |
| NCERT Magenta | #BE185D | Chapter numbers, warnings, bullets |
| NCERT Sky Blue | #0284C7 | Chapter titles, drop caps |
| NCERT Orange | #EA580C | "Do You Know?" callouts |
| Georgia (serif) | — | Reading text, notes, captions |
| Outfit (sans-serif) | — | UI chrome, headings, buttons |

## Verification
- After ANY code change: `cd apps/mobile_web_client && flutter analyze`
- No test suite yet — analyze is the only automated check
- Manual validation: run `flutter build web` before merging

## Tools
- Primary: `agy` CLI (antigravity.google)
- Background: `hermes` (via profile system)
- DB: Supabase SQL Editor for schema/migration application

## Agent Pipeline Rules
1. Implementation plans MUST be saved as project files (docs/implementation-plans/*.md), NOT as agy brain artifacts
2. After code changes: always verify with `flutter analyze`
3. Import debugPrint from `package:flutter/foundation.dart` — never use `sb.debugPrint`
4. Plans are written by Opus, executed by Gemini Flash — do not skip the plan phase
5. Each task must have an implementation plan before execution starts

## Payment Rule
- Payment integration is PHASE 5 (LAST). Ship free MVP first.
- Mock subscription (createUserMockSubscription) remains until real Razorpay is integrated
- No payment code ships before free MVP is stable and on custom domain

## RLS Policy Rule
- Content tables (subjects, chapters, lessons, quizzes, quiz_questions) must allow SELECT for ALL roles (anon + authenticated)
- Only user-private tables (user_progress, user_streaks, quiz_attempts, subscriptions) restrict to own rows
- If the app shows blank data, test with curl to Supabase API: the RLS policy might be blocking anon users
