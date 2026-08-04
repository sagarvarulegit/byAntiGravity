# CBSE Class 10 Learning Portal — AI Memory

Auto-loaded by agy on startup. Keep this file updated as conventions evolve.

## Project
CBSE Class 10 Online Learning Portal — Flutter/Dart monorepo with Firebase Hosting,
Supabase backend, and a Remotion video generator sub-project.

## Directory Map
```
apps/
  mobile_web_client/      ← Flutter multi-platform app (main deliverable)
    lib/
      main.dart           Entry point, auth gate, MainShell shell
      config.dart         Supabase env vars (--dart-define)
      models.dart         All data models (Subject, Chapter, Lesson, Quiz, …)
      theme.dart          AppColors + AppThemes (NCERT tokens)
      services/
        auth_service.dart      Abstract interface + SupabaseAuthService
        database_service.dart  Abstract interface + SupabaseDatabaseService
      views/              One file per screen
      widgets/            Reusable components (whiteboard, gauges, charts)
      utils/              Download stubs
    test/
      widget_test.dart    Flutter widget test
    web/                  Web entry point
    android/ios/macos/linux/windows/  Platform shells
  video_generator/        Remotion 4.0 (React/TS) — programmatic video compositions
    src/
      Root.tsx            Composition registry
      Composition.tsx     Main composition
      components/         Reusable Remotion components
      theme.ts            Video theme tokens
    package.json          npm run dev → Remotion Studio
db/                       PostgreSQL schemas + seed data
  schema.sql              DDL source of truth
  seed.sql                NCERT content seed
  rls_policies.sql        Row-level security policies
supabase/                 Supabase CLI project config
  config.toml             Project settings
  migrations/             3 migrations (schema, RLS, grants)
prototype/                Interactive HTML/CSS/JS dashboard mockup
docs/                     Architecture doc + implementation plans
tests/                    Playwright web tests (node_modules/)
```

## Commands
| Context | Command |
|---|---|
| Flutter analyze | `cd apps/mobile_web_client && flutter analyze` |
| Flutter test | `cd apps/mobile_web_client && flutter test` |
| Flutter build web | `cd apps/mobile_web_client && flutter build web` |
| Flutter run (web) | `cd apps/mobile_web_client && flutter run -d chrome` |
| Firebase deploy | `firebase deploy --only hosting` |
| Remotion Studio | `cd apps/video_generator && npm run dev` |
| Remotion bundle | `cd apps/video_generator && npm run build` |
| Supabase migrate | `supabase db push` (from root) |
| Refresh local DB | `./refresh_db.sh` (concat seeds + db reset) |

No CI workflows present yet.

## Architecture
- **Flutter app** — stateful shell (`CBSEPortalApp`) with dark/light theme toggle;
  auth-gated via `AuthService` abstract interface → `SupabaseAuthService`.
  All DB queries through `DatabaseService` abstract interface →
  `SupabaseDatabaseService`; views never call Supabase directly.
  Async data loading uses `FutureBuilder` pattern (loading/error/success).
  Responsive layout: sidebar ≥ 800px, bottom nav < 800px.
- **Supabase** — BaaS providing Auth (GoTrue/JWT), PostgREST auto-API, RLS.
  Config at `supabase/config.toml`; migrations at `supabase/migrations/`.
- **PostgreSQL** — subjects, chapters, lessons, quizzes, quiz_questions (public RLS),
  plus user_progress, user_streaks, quiz_attempts, subscriptions (user-private RLS).
- **Remotion video generator** — separate Node/React project for programmatic
  animated video exports; no runtime dependency from the Flutter app.
- **Firebase Hosting** — serves the web build at `apps/mobile_web_client/build/web`.

## Conventions
- Services use **abstract interface → Supabase implementation** pattern (swap-ready).
- No inline Supabase calls in views — always use `DatabaseService`.
- `FutureBuilder` for async data (loading / error / success).
- **NCERT colour tokens** from `theme.dart` only — no hardcoded colours in views.
- Fonts: **Georgia** (serif) for reading text/notes/captions; **Outfit** (sans-serif)
  for UI chrome/headings/buttons.
- Debug prints use `debugPrint` from `package:flutter/foundation.dart` — never
  `sb.debugPrint`.
- Programmatic vector whiteboarding via `AnimationController` + `CustomPainter`
  instead of pre-recorded video (zero-bandwidth, infinite-res, dark-mode aware).
- Responsive layout: sidebar drawer > 800px, bottom nav ≤ 800px.
- Implementation plans saved as `docs/implementation-plans/*.md`.
- Payment integration is Phase 5 (last) — ship free MVP first.
- Content tables (subjects, chapters, lessons, quizzes, quiz_questions) must allow
  SELECT for anon + authenticated roles. User-private tables restrict to own rows.
- **Custom Markdown Parsing Conventions**:
  - Keep block parsing state-machines robust. Always flush active containers (e.g. `inActivity`) when encountering new sub-topics (bold text ending in colons), alert callouts, questions, or divider rules.
  - Group multiple questions and answers under a single styled `QuestionsSection` widget using Outfit font for badges and Georgia font for answer text, rather than spawning individual cards.
  - Support markdown tables dynamically, rendering cells through `_buildMathText` to preserve inline math formatting (e.g. chemical formulas like $Cl_2$, $NaOH$).
  - **Avoid Hardcoded Text-Matching for UI Components**: Never use hardcoded English string matches (e.g., `line.contains('Gas bubbles')`) inside the Dart parser to inject widgets or figures. Always rely on explicit database token tags (e.g., `[FIGURE: zinc_acid]`) to trigger UI elements, and remove any legacy text-matching fallback logic when explicit tokens are introduced to prevent duplicate widget rendering.
- **Remotion Video Generator Conventions**:
  - **Storytelling Benchmarks (KodeKloud, Science Simplified 4 All & Dr. Ben Miles)**: Frame videos around narrative mystery hooks, "What If?" thought experiments, progressive SVG diagram builds, and age-appropriate everyday analogies.
  - **Mandatory Script Approval**: Present script proposals to user first and await explicit "Go ahead" before generating TTS audio or rendering videos.
  - **Math Speech Sanitization**: Pass all formulas through `cleanMathTextForSpeech()` in `generate-voiceovers.js` to ensure fractions like `1/Rp` are spoken as "one over R P" rather than literal slashes.
  - **Timeless Title Subtitles**: Omit hardcoded NCERT chapter numbers (e.g. "Chapter 12") in title scenes to prevent stale branding across textbook revisions. Use domain titles like `"CBSE Class 10 Physics • Electricity"`.
  - **Empty Diagram Guard**: Ensure `DiagramScene.tsx` hides empty SVG card backgrounds when diagram components/wires are omitted.

## Notes
- `db/seed_science_ch2_notes.sql` — full NCERT notes & study guide for Science Ch2
  (Acids, Bases & Salts). Two lessons: Revision Notes (UUID b0eebc99…0233,
  seq 3) + NCERT Study Guide (UUID e0eebc99…0223, seq 10). Figure tokens for all
  Ch2 figures are fully wired up in `lessons_view.dart` using a mix of SVG vector graphics and realistic JPG illustrations.
  Run manually: `psql $SUPABASE_DB_URL -f db/seed_science_ch2_notes.sql`
