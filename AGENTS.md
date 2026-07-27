
# CBSE Class 10 Learning Portal — Custom Rules

## General

- Whenever you fix code add the learnings in here in this AGENTS.md file
- **Windows UTF-8 Coding Standard:** Always open text files using `encoding="utf-8"` in Python scripts (such as `concat_seeds.py`) to avoid Windows-specific system default CP1252 parsing crashes (e.g. `UnicodeDecodeError` on mathematical symbols like Ω).
- **Binary File Reads/Writes for Surrogates:** When editing databases or seed SQL scripts containing complex unicode strings (like emojis or math symbols), read/write files in binary mode (`"rb"`/`"wb"`) and decode/encode using `.decode('utf-8', errors='replace')` to prevent surrogate errors like `surrogates not allowed`.
- **Markdown Alert Box & Badge Parsing:** 
  - Support `[!IMPORTANT]` as an alert type alongside `[!NOTE]`, `[!WARNING]`, and `[!CAUTION]`, giving it a deep purple alert container.
  - Check for metadata lines (such as `Board Exam Hot Topic`) *before* stripping blockquote `>` characters, or search for the content regardless of whether the prefix was already stripped.
  - Dynamically reformat database strings containing exam repetition data (e.g., `Repeated 4x (2026)`) into user-friendly badge layouts like `[2026] Board PYQ` for the front-end layout.
- **NCERT Textbook-Completeness Standard:** To ensure 100% textbook-complete coverage, notes and study guides for any NCERT chapter must systematically contain:
  1. All conceptual lessons and chronological activities/experiments.
  2. Every in-text question and solution.
  3. Every end-of-chapter exercise question and solution.
  4. The official end-of-chapter Group Activity.
  5. Chronologically numbered and captioned figure placeholders (e.g., `[FIGURE: ...]`) matching the exact textbook figures and their corresponding assets in the client code.
  6. A "🧪 NCERT Activities Cheat Sheet" that summarizes the observations of every chronological activity must be appended to the end of the Revision Notes.
- **CBSE Board Exam Readiness Standard:** To ensure 100% board exam readiness, covering the textbook is insufficient on its own. When adding or auditing content:
  1. Systematically cross-reference official CBSE Board Exam Papers and Marking Schemes.
  2. Explicitly include any non-NCERT examples, edge-case reasoning questions, and complex case-based cross-classification formats that have appeared in past exams.
  3. Every Past Year Question (PYQ) added to the database (`seed_pyq_questions.sql`) MUST include the exact `model_answer` and `marking_scheme` value points to ensure students learn how the board evaluates their answers.
- **Emoji & Character Encoding Validation:** When editing or refactoring database seed files, actively scan for and replace legacy encoding corruptions (e.g., double question marks `??` created from corrupted emojis like `🔥` or other symbols) to ensure that all data is correctly stored and parsed as UTF-8.
- **Database Seed Registration:** Whenever a new SQL seed file is created in the `db/` directory, it MUST be explicitly added to the `seed_files` array inside `concat_seeds.py`. If this registration step is skipped, the new content will be silently excluded when running `./refresh_db.sh` or `python concat_seeds.py`.
- **Avoid Hardcoded Text-Matching for UI Components:** Never use hardcoded English string matches (e.g., `line.contains('Gas bubbles')`) inside the Dart parser to inject widgets or figures. Always rely on explicit database token tags (e.g., `[FIGURE: zinc_acid]`) to trigger UI elements, and remove any legacy text-matching fallback logic when explicit tokens are introduced to prevent duplicate widget rendering.
- **Figure Illustration Fallbacks:** When adding missing `[FIGURE: ...]` assets in `lessons_view.dart`, the client now supports both `.svg` (`svgPath`) and `.jpg`/`.png` (`imagePath`). You should preferentially generate highly realistic photorealistic `.jpg` images for real-world experiments. If AI image generation hits rate limits, fallback to either generating a `.svg` vector programmatic animation or a "nano banana" vibrant vector style image, and map the correct path format in the rendering logic.

## Supabase / Local Development Rules
- **Windows NAT Port Conflicts:** If `supabase start` fails with `listen tcp 0.0.0.0:54322: bind` or Flutter cannot connect to Supabase locally (e.g. `statusCode: null`), it is often because Windows Hyper-V/NAT has reserved the Supabase ports (54321, 54322). Fix this by having the user run `net stop winnat; net start winnat` in an Administrator PowerShell to clear the dynamic port exclusions, then restart Supabase.
- **Missing Edge Functions:** If `supabase start` crashes with `failed to load import map` referencing a missing `deno.json` for an edge function, check if the function directory is empty. If it is, edit `supabase/config.toml` and set `enabled = false` for that specific function block (e.g. `[functions.generate_pdf]`) to allow the backend to start.

## Remotion Development Rules
- **Remotion Render Parallelization**: For long-running or full-chapter video renders (compositions with large frame counts, e.g., > 1000 frames), always recommend or apply Remotion's parallel rendering options. When invoking `remotion render` via CLI, explicitly pass or suggest the `--concurrency=<number>` flag (e.g., matching target CPU core/thread count) to reduce render times.
- **Explicit Audio Rendering**: In Remotion, when rendering a scene component that supports voiceover or background music, you must explicitly import and render the `<Audio>` component:
  ```tsx
  import { Audio, staticFile } from "remotion";
  // Inside the component return statement:
  {audio && <Audio src={staticFile(audio)} />}
  ```
- **Strict Prop Destructuring Verification**: When updating React components in TypeScript, verify that all properties added to the component's Prop interface/type are also successfully destructured and bound in the component's parameter list. Always check this before finishing a change to avoid compile-time ReferenceErrors.
- **TransitionSeries Duration Overlaps**: When nesting a component that uses a `TransitionSeries` inside a parent `<Series>` (or when defining its `<Composition>`), the child component's actual runtime will be shorter than the mathematical sum of its scenes due to transition overlaps. You MUST explicitly subtract the overlapping frames from the `durationInFrames` calculation to prevent a transparent void at the end of the clip.
  - Formula: `actualDuration = sumOfSceneDurations - ((numberOfScenes - 1) * overlapFrames)`
- **Chronological Audio-Visual Alignment**: When defining text scenes with sequentially appearing elements (such as `bullets`), the order of the on-screen text MUST perfectly align with the chronological flow of the `teacherScript` / audio narration. Do not order text elements by "logical" grouping if it contradicts the spoken order. For example, if the script introduces an example before defining the concept, the bullet for the example must appear first.
- **Proactive Educational Illustrations**: When a `TextScene` describes a physical process, chemical reaction, or experiment in the `teacherScript`, do not rely solely on text bullets. Proactively use the `generate_image` tool to create a clean, high-quality educational illustration (e.g. in a "nano banana" or vibrant vector style) that matches the narration. Integrate the generated image into the scene's data using the `imageUrl` property so it appears alongside the text.
- **Component Prop Propagation Check**: When adding a new property to a React component's interface and the underlying data schema, you must systematically trace the component's usage upwards. Verify that all parent and wrapper components that instantiate the updated component are also modified to correctly pass the new prop down from the data source.
- **NCERT Activities Precedence**: Never skip foundational NCERT Activities or Experiments when introducing a new topic. The chronological flow must always introduce the empirical observation (the Activity/Experiment and associated figures) before formalizing the scientific definitions, mirroring the exact pedagogical sequence of the NCERT textbook.
- **Mandatory Voiceover Synchronization**: Whenever you add new scenes or modify text/`teacherScript` in the video JSON files, you MUST run `node generate-voiceovers.js <subject_folder>` (e.g., `node generate-voiceovers.js science`) from inside the `apps/video_generator` directory. This script utilizes the ElevenLabs API to generate the MP3 voiceovers, extract word-level alignments, and accurately update the `durationInFrames` for every scene. Never leave new scenes silent.
- **Visual Conversation Scenes**: The `ConversationScene` component supports an optional `imageUrl` property within its `content` object. When creating "Comic Recaps" or dialogue-heavy scenes, proactively use the `generate_image` tool to create a relevant visual (e.g., a political satire cartoon) and set the `imageUrl` to trigger a side-by-side illustration and chat-bubble layout.

# Graphify Context & Usage Rules

This project uses Graphify (https://github.com/Graphify-Labs/graphify) as the primary knowledge graph for codebase architecture, dependencies, and context. You must prioritize Graphify's outputs to prevent hallucinations and understand system impacts before writing or modifying code.

## 1. Mandatory Context Retrieval
*   **Architecture & Overview:** Before suggesting architectural changes, adding new features, or writing tests, you must read `graphify-out/GRAPH_REPORT.md` to understand domain boundaries, key components, and existing "God nodes".
*   **Impact Analysis:** Before refactoring or modifying core logic, consult `graphify-out/graph.json` to trace dependencies and identify which other files or modules will be impacted by your changes.

## 2. CLI Tool Execution (If Shell Access is Enabled)
When you lack sufficient context to answer a prompt, use the following commands autonomously:
*   **Search Context:** Run `graphify query "<specific_question>"` to query the graph for flows, logic, or structure.
*   **Trace Connections:** Run `graphify path <source_file> <target_file>` to understand how two specific components interact.

## 3. Graph Maintenance
*   **Keep it Updated:** If you make significant structural changes to the codebase (e.g., creating new modules, deleting files, or changing core routing), you must run `/graphify` (or the terminal `graphify` command) to regenerate the graph and ensure the `graphify-out/` directory remains up to date.

## 4. Strict Fact-Checking
*   Base your understanding of the codebase strictly on the relationships mapped in the Graphify outputs. Prioritize connections tagged as `EXTRACTED` over `INFERRED`.

- **Supabase CLI SQL Parser Bug:** The local Supabase CLI seed parser erroneously splits SQL commands on semicolons (;) that are embedded inside single-quoted strings (especially inside PL/pgSQL \DO \ blocks). Never use semicolons inside SQL string literals (e.g., \'100 W; 220 V'\) in seed files; always replace them with commas (e.g., \'100 W, 220 V'\) to prevent \supabase db reset\ from failing with cryptic syntax errors.
- **Strict SQL Quote Escaping:** Always ensure that single quotes (\'\) inside string literals in seed files (such as \'pop'\ or \doesn't\) are properly escaped with two single quotes (\''pop''\, \doesn''t\). A single unescaped quote will cause the Supabase seed parser to prematurely terminate the string and throw a \SQLSTATE 42601 syntax error at or near\ exception during \supabase db reset\, halting the entire database provisioning process and wiping out test users.
