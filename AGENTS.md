# CBSE Class 10 Learning Portal — Custom Rules

CBSE Class 10 online learning portal: Flutter client + Supabase backend,
Remotion-generated explainer videos, PostgreSQL curriculum content.

## Project

- **Client:** Flutter app in `apps/mobile_web_client/` (entry: `lib/main.dart`;
  Supabase via `supabase_flutter`, Supabase URL/anon key in `lib/config.dart`).
- **Video:** Remotion (React/TS) generator in `apps/video_generator/`
  (16:9 `Composition.tsx` + 9:16 `ReelComposition.tsx`, scene JSON under
  `src/data/`, rendered output in `out/`).
- **Backend:** local Supabase (`supabase/`) — Postgres schema + RLS in
  `supabase/migrations/`, one big seed `supabase/seed.sql`.
- **Content:** NCERT chapter notes, quizzes, PYQs, study guides as SQL seeds in
  `db/` (concat order defined in `concat_seeds.py`).
- `prototype/` is a legacy HTML dashboard; `README.md` is stale (claims
  NestJS/AWS — the real backend is Supabase).

## Commands

- Flutter: `flutter pub get`, `flutter analyze`, `flutter test`,
  `flutter run -d chrome` (run from `apps/mobile_web_client/`).
- Video: `npm run dev` (Remotion studio), `npm run lint` (= `eslint src && tsc`),
  `npm run build`, `npm run generate-voiceovers`, `npm run generate-thumbnails`;
  render with `npx remotion render <composition-id> out/<file>.mp4`
  (add `--concurrency=<n>` for >~1000 frames).
- Database: `bash refresh_db.sh` (concatenates `db/seed*.sql` via
  `concat_seeds.py` into `supabase/seed.sql`, then `npx supabase db reset`);
  manage local stack with `npx supabase start|stop|status|db reset`.
- Graphify: see contract below.

## Architecture

- `apps/mobile_web_client/lib/views/` — screens: `auth_view`, `dashboard_view`,
  `lessons_view` (large; markdown/notes rendering), `quiz_view`, `progress_view`,
  `billing_view`. `lib/services/` — `auth_service.dart`, `database_service.dart`;
  `lib/models.dart` — data models.
- `apps/video_generator/src/` — Remotion compositions and scene components;
  `src/data/schema.ts` is the source of truth for scene JSON shape.
- `db/` — `schema.sql` + `seed_*.sql` files (auth, chapters, notes, quizzes,
  study guides, PYQs). Every new seed file must be registered in
  `concat_seeds.py`.
- `supabase/` — `config.toml`, `migrations/` (schema + RLS + grants),
  `seed.sql` (generated, do not hand-edit).
- `scripts/` — graphify-content.ps1 and content-harvest helpers; root-level
  `patch_*.py` scripts are one-off seed/content fixers.

## Conventions

- Whenever you fix code, append the reusable learning to the nearest applicable
  `AGENTS.md`. Use this root file only for repository-wide learnings.
- **Windows UTF-8 Coding Standard:** Always open text files with
  `encoding="utf-8"` in Python scripts to avoid Windows CP1252 parsing crashes
  on symbols such as `Ω`.
- **Content Cohesion:** Always ensure that Visualization and Narration tightly
  match across all mediums (Video, Notes, and the Platform). Placeholders or
  unrelated assets should never be used if they contradict the script.
- **HyperFrames Default for Video Creation:** When video creation is requested, default to authoring native HyperFrames HTML/GSAP compositions in the ChapterReady warm paper theme (`#f4ede2` background + `#f3883b` orange accents) unless Remotion is explicitly requested.
- **Graphic Assets over AI Body Parts:** Avoid using AI-generated human hands or complex anatomical body graphics in video assets due to AI left/right inversion errors. Prefer clean typography, bento box cards, vector diagrams, and icon graphics.
- **YouTube Comment Formatting:** Never use LaTeX math delimiters (`$...$`) in YouTube comment copy. Always format pinned comments and YouTube metadata in plain text using UTF-8 math symbols (`√3/2`, `cos(30°)`) and YouTube markdown (`*bold*`).
- **SEO File Naming Standard:** Always export and name final `.mp4` video files using long-tail, hyphenated SEO search terms (e.g. `cbse-class-10-maths-butterfly-method-fraction-trick-shorts.mp4`).
- **First 1.5-Second Hook Rule:** Open Shorts within the first 1.5 seconds using high-stakes visual pattern interrupts or loss-aversion questions ("Stop memorizing...", "Don't lose 5 marks...") to boost "Stayed to Watch" rates above 65%.
- **24-Hour Upload Spacing:** Space Shorts uploads by at least 24 hours (target peak student hours: 5:00 PM – 7:30 PM IST) to prevent YouTube's seed testing algorithm from splitting impressions across competing videos.

## Scoped Instructions

- Before modifying Flutter UI or parser code under `apps/mobile_web_client/`,
  read `apps/mobile_web_client/AGENTS.md`.
- Before modifying Remotion/video code or scene data under
  `apps/video_generator/`, read `apps/video_generator/AGENTS.md`.
- Before modifying database seeds, curriculum notes, PYQs, or board-exam
  content anywhere in the repository, read `db/AGENTS.md`.
- Before modifying Supabase configuration or local backend behavior, read
  `supabase/AGENTS.md`.

## Graphify Retrieval Contract

- Graphify is the primary index for architecture, dependencies, and codebase
  context. Prefer bounded Graphify queries before source searches.
- Never load all of `graphify-out/graph.json` or the complete
  `graphify-out/GRAPH_REPORT.md` into model context.
- Before architecture analysis, run `graphify check-update .`.
- Use these bounded commands:
  - Broad context: `graphify query "<specific question>" --budget 600`
  - Focused flow: `graphify query "<question>" --dfs --context call --budget 800`
  - Impact analysis: `graphify affected "<symbol>" --depth 2`
  - Relationship trace: `graphify path "<source>" "<target>"`
- Open only the source files and relevant line ranges returned by Graphify.
- If the graph has insufficient evidence, fall back to targeted `rg` searches.
  Read `GRAPH_REPORT.md` only if bounded queries cannot provide the necessary
  overview.
- Base claims on graph evidence. Prefer `EXTRACTED` edges over `INFERRED`
  edges, and label uncertainty when evidence is `AMBIGUOUS`.
- After changes to imports, modules, classes, functions, signatures, or routing,
  run `$graphify . --update --directed`. Copy, styling, media, and data-only
  changes do not require a code-graph rebuild.
- Do not use the bare `graphify update .` command for this repository with
  Graphify 0.9.30: it rewrites the saved graph as undirected. Always verify
  `graphify-out/graph.json` has `"directed": true` after maintenance.
- After semantic documents or images in the active corpus change, run
  `$graphify . --update`.
- After a significant structural reorganization, rebuild with
  `$graphify . --directed --no-viz`.
- The default graph is architecture-only. Curriculum PDFs are intentionally
  isolated; build their opt-in graph with
  `powershell -File scripts/graphify-content.ps1` and enable the
  `graphify_content` MCP server only for content-research sessions.

## Notes

- **ChapterReady Platform — Warm Paper & Ink Color Scheme:**
  - Page Background (`--background`): `#f4ede2` (warm cream)
  - Text/Ink (`--foreground`): `#181612` (near-black charcoal)
  - Muted Text (`--muted`): `#6f665c` (warm taupe)
  - Card Surface (`--card` / `--surface`): `#fffdf8` (warm white)
  - Soft Card Fill (`--card-soft`): `#fff3df` (cream-orange tint)
  - Borders/Lines (`--border`): `#d9c7b4` (light tan)
  - Primary/Brand (`--primary`): `#f3883b` (ChapterReady Orange)
  - Primary Strong/Hover (`--primary-strong`): `#bd4f10` (burnt orange)
  - Primary Light (`--remix-orange-light`): `#ffb06c`
  - Supporting Warm Accents: `--cyan` `#ffad68`, `--pink` `#c9512c`, `--yellow` `#f6a24f`
  - Shape & Elevation: `--remix-radius: 24px`, warm brown-tinted shadows (`rgba(67, 45, 24, 0.08)` / `0.12`).
  - **Constraint:** Deliberately avoids generic blue/green "study app" looks. Always use light warm paper & ink palette (`#f4ede2` + `#f3883b`).
