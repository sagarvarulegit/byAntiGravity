# Video Generator Rules

## Learning Capture

- Record reusable Remotion and video-pipeline learnings in this file after
  fixing code under `apps/video_generator/`.

## Rendering and Timing

- For long renders over roughly 1,000 frames, pass
  `--concurrency=<number>` to `remotion render`, normally matching the target
  CPU thread capacity.
- When a scene supports narration or music, explicitly render Remotion audio:

  ```tsx
  import { Audio, staticFile } from "remotion";

  {audio && <Audio src={staticFile(audio)} />}
  ```

- For `TransitionSeries`, subtract overlaps from the composition duration:
  `actualDuration = sumOfSceneDurations - ((numberOfScenes - 1) * overlapFrames)`.
- Keep sequential on-screen elements in the same chronological order as the
  `teacherScript`, even when a different logical grouping seems cleaner.

## React and Data Propagation

- When adding a TypeScript prop, verify that it is declared and destructured in
  the component parameter list.
- Trace every new prop through all parent and wrapper components to the source
  data.
- **Parity across Formats**: When introducing a new scene type (like `activity` or `conversation`), you must implement its rendering logic and `<Audio />` tags in *both* `Composition.tsx` (16:9) and `ReelComposition.tsx` (9:16). Never leave a scene type unsupported in the Reel variant.
- **Schema Strictness**: `activity` scenes strictly expect the `"animationType"` property (e.g. `"animationType": "zinc_acid"`), not an `"activityId"`. Verify property names against `src/data/schema.ts` when crafting new JSON scripts.

## Educational and Visual Standards

- **Storytelling Blueprint (KodeKloud, Science Simplified 4 All & Dr. Ben Miles Benchmark)**:
  1. **Narrative / Mystery Hook**: Start with a discovery story, a "What If?" thought experiment, or contrasting Classical Expectation vs Real-World Twist.
  2. **Everyday Relatable Analogies & Energy Landscapes**: Use age-appropriate physical analogies (e.g. bicycle on grass for refraction, ball rolling over a hill for potential difference).
  3. **Progressive Synchronized Visual Building**: Build SVG diagrams piece-by-piece in exact multi-phase sync with spoken narration (e.g. as teacher says "passes through Focus F2", the ray refracts through F2 while F2 pulses with a glowing highlight halo). Use glowing vector elements on dark backgrounds.
  4. **Thought Experiment Scenarios**: Ask "What happens if...?" to build student intuition before giving the answer.
  5. **The "Inventor's Journey" (Progressive Problem-Solving)**: When explaining a device or invention, do not just present the final working version. Walk the viewer through the *failed iterations* (e.g., "Why not use a motor? Too noisy.") so the final design choices feel intuitive rather than arbitrary.
  6. **Intuition First, Jargon Last**: Establish a rock-solid mental model using simple phrasing (e.g., "a magnet that moves without going anywhere") before introducing formal textbook jargon, laws, or formulas (e.g., Faraday's Law).
- Mandatory Script Approval Workflow: ALWAYS present the full scene-by-scene script to the user and receive explicit "Go ahead" approval BEFORE generating audio, images, or video.
- Always explain the physical intuition behind formal mathematical laws (e.g. "push vs flow" for Ohm's Law $V = IR$) before introducing formulas.
- When narration describes a process, reaction, or experiment, generate and
  attach a relevant educational illustration through `imageUrl`.
- `ConversationScene.content` supports `imageUrl`; use it for comic recaps and
  dialogue-heavy scenes that benefit from a side-by-side illustration.

- Always import and use `<Img />` from `"remotion"` instead of raw `<img>` tags to ensure asset preloading during renders and eliminate frame flicker.
- Avoid CSS transition styles (e.g. `transition: "opacity 0.3s"`); drive all property transitions deterministically using `useCurrentFrame()`, `interpolate()`, or `spring()`.
- In diagram scenes, conditionally check `(components.length > 0 || wires.length > 0)` before rendering the SVG card container; if empty, collapse the grid layout to full-width text to prevent rendering blank white boxes.
- Avoid hardcoding chapter numbers (e.g. "Chapter 12") in title scenes or script subtitles, as NCERT chapter numbers vary across editions. Use domain titles like `"CBSE Class 10 Physics • Electricity"`.
- **Thumbnail Promise Fulfillment**: If a thumbnail promises a specific outcome or hook (e.g., "SCORE 5 MARKS"), the video script JSON *must* explicitly contain a scene delivering that exact strategy or outcome. Do not generate a hook without fulfilling it in the content.
- **AI Image Realism vs Global UI Theme**: If a global UI color theme (e.g., `#EC8366`) is requested for the video composition, do *not* apply this as a filter or tint in AI image generation prompts for educational assets. AI-generated diagrams, anatomy, and industrial photos must use photorealistic, natural, and true-to-life colors (no artificial tints) to preserve educational accuracy. **Exception:** When illustrating a metaphorical example, analogy, or thought experiment (e.g., a "tug-of-war" between elements), generate fun, highly memorable 2D cartoon/character illustrations instead of photorealism to aid student memory.
- When rendering images in Vertical/Reel layouts (9:16), always use `objectFit: "contain"` instead of `cover`. Using `cover` indiscriminately crops educational illustrations (like characters or diagrams), destroying visual context.

## Trigonometry chapter (TrigonometryScene)

- Scene type `trigonometry` + `TrigonometryScene` with variant-per-concept:
  `intro` (roadmap), `quest` (problem statement), `angle_definition` (what is
  angle of depression: horizon line → boat → named arc → golden rule with
  crossed-out vertical-wall arc), `lighthouse_real` (setup),
  `lighthouse_abstract` (Z-trick — MUST be grounded in the real diagram:
  lighthouse, ships, line of sight ∥ sea floor as the Z parallels, laser =
  beacon→ship-2 diagonal; never a bare abstract triangle, or narration
  mentioning ships has nothing to show),
  `lighthouse_proximity` (closer = bigger), `lighthouse_solve` (worked answer),
  `boss_end` (recap). Data lives in `src/data/maths/01_trigonometry_lighthouse.json`,
  composition `MathsLighthouseMasterclass` →
  `out/cbse-class-10-applications-of-trigonometry-angle-of-depression-lighthouse-masterclass.mp4`.
- **Two-panel canvas layout**: text/explanation/formulas live in a LEFT panel
  (560px, phrase-locked `PanelLine`/`GameStamp`/`ChipCard` rows), the
  animation/diagram lives in a RIGHT panel (SVG 800x600 viewBox,
  `preserveAspectRatio="xMidYMid meet"`). Portrait reels stack the panels
  vertically (`portrait = vh > vw`). Only geometric annotations (degree
  labels, θ, measurement lines) stay INSIDE the SVG; everything else moves to
  the text panel so nothing overlaps the figure. Helpers (`PanelLine`,
  `GameStamp`, `ChipCard`) must be defined at top level, NOT inside the
  component (inline component definitions remount every frame).
- **State the actual exam question up front**: a masterclass must open
  hook → `quest` scene (the real board question, phrased exactly like the exam:
  "From the top of a 75 m high lighthouse... find the distance between the
  ships", with a mini diagram and a `QUEST ACCEPTED!` stamp) → roadmap → setup
  → tools → solve → recap. Never let the solve scene answer a question the
  video never posed (Zeigarnik: pose it early, answer it late).
- **Physics correctness**: the FARTHER ship has the SMALLER angle of depression
  (30° far vs 60° near). "Look further down" is wrong — the far ship is looked
  at LESS down. The diagram must also LABEL the angles (60° near, 30° far) or
  the swap-error the script warns about stays unfixable visually.
- **Honest geometry**: ships and arcs must actually sit at the narrated angles.
  For the 800x600 canvas the working layout is: lighthouse image (20,140,200,200)
  → lantern/beacon at (77,153); sea at y=470; near ship (60°) at x=260, far ship
  (30°) at x=625, laser endpoints at the waterline y=470 (drop 317px:
  317/tan60 = 183, 317/tan30 = 549). Arc helper: `arc(cx,cy,r,a0,a1,sweep)`
  emits an SVG A path (sweep 1 = clockwise in y-down); the bottom elevation arc
  at the ship corner sweeps 180°→149° with sweep 0.
- **Origin-anchored pops**: `transform="scale(s)"` alone scales about the SVG
  origin and slides elements toward the top-left. Always use
  `translate(cx cy) scale(s) translate(-cx -cy)` (and
  `translate(cx cy) rotate(deg) scale(s) translate(-cx -cy)` for rotated
  stamps) so pops stay centered.
- **Ships referenced by narration early must be visible early**: in
  `lighthouse_real` the ships render from frame 0; only the lasers, arcs,
  labels, and measurement lines are phrase-locked to the narration.
- **The 5-mark promise needs the actual answer**: scene `lighthouse_solve`
  walks tan60 → x = 25√3 ≈ 43.3 m, tan30 → x+y = 75√3 ≈ 129.9 m, then
  y = 50√3 ≈ 86.6 m with segment highlights on the diagram and a final answer
  banner — never stop at "use tan theta".
- `ReelComposition.tsx` MUST have a `scene.type === "trigonometry"` branch
  (scale(1.2) + `TrigonometryScene` with NO audio prop — the reel's generic
  `<Audio>` at the Sequence level already plays it; passing audio twice
  double-plays). It was missing, so the short rendered blank.
- Phrase anchors verified for all 7 scenes against regenerated alignments via
  a node script (44/44 found, chronological); anchor words chosen to be
  unique per scene (e.g. "25"/"129"/"50" match numeric tokens, "129" matches
  the "129.9" token via `includes`).
- Note: `npm run lint` and `npx tsc --noEmit` currently fail on PRE-EXISTING
  errors in other components (Duplicate `AppColors` in Composition.tsx, missing
  theme color keys). Check that your own files are clean and don't chase the
  baseline.

## Voiceover & Thumbnail Generation

- **MANDATORY**: Whenever you create or modify video JSON data files (especially adding scenes or changing `teacherScript`), you MUST immediately run `node generate-voiceovers.js <subject_folder>` to generate MP3s, alignments, and accurately compute `durationInFrames`. Never leave scenes silent or with guessed placeholder durations.
- To generate high-impact AI YouTube thumbnails, run
  `node generate-thumbnails.js <topic_name>` (e.g. `node generate-thumbnails.js
  light_ray_diagram_masterclass`). The script calls the `gemini-2.5-flash-image`
  model via `:generateContent` (the old Imagen 3.0/4.0 `:predict` models are
  retired/restricted on new accounts) and converts the returned PNG to a real
  JPEG. It reads `GOOGLE_API_KEY`/`GEMINI_API_KEY` from the OS environment or
  the `.env` files; on Windows, user-scope env vars are invisible to shells
  started before the var was set — read them explicitly in PowerShell:
  `$env:GEMINI_API_KEY = [Environment]::GetEnvironmentVariable('GEMINI_API_KEY','User')`.
- Thumbnail prompt recipe that works well: hook text (e.g. "SCORE 5 MARKS!"),
  the video's actual visual elements (convex lens, red/yellow rays through
  F1/F2, object arrow left → inverted image right), and the video's color
  language (dark background, neon blue/orange accents) so the thumbnail
  matches the video's look.

## Magnetic Effects chapter (MagneticScene)

- New scene type `magnetic` + `MagneticScene` component with narration-driven
  variants, one per concept: `intro`, `oersted`, `bar_magnet`,
  `straight_conductor`, `solenoid`, `electromagnet`, `fleming`, `induction`,
  `motor_generator`. Data lives in `src/data/magnetic/01_magnetic_effects.json`,
  composition `MagneticEffectsMasterclass` →
  `out/magnetic_effects_masterclass.mp4`.
- Every masterclass needs a topic-introduction scene (`intro` variant): a
  roadmap board with numbered chips that pop one-by-one as the narration lists
  the topics ("IN THIS VIDEO"), so students know what the video covers before
  the first concept scene. Keep the roadmap narration short (~6 numbered
  topics).
- Reuse patterns from RayDiagramScene: phrase-matched word alignments drive
  every phase; the `pathLength=1` + `strokeDashoffset` trick draws field lines
  progressively; needle/rod rotations use `transform="rotate(deg cx cy)"`;
  the induction magnet position is a nested lerp
  (`lerp(lerp(90,265,inP), lerp(265,90,outP), outP)`) so it moves in during
  "Push the magnet INTO the coil" and back out during "deflects the OTHER way".
- When a new chapter needs bespoke visuals (magnets, coils, compasses,
  galvanometers), build a dedicated scene component instead of stretching
  DiagramScene's component enum — the variant-per-concept pattern keeps each
  animation testable and phrase-locked.
- For anatomical figures, reuse real SVG artwork instead of hand-drawn
  shapes: `public/left-thumb-up-svgrepo-com.svg` is a proper left thumbs-up;
  mirror it with `<g transform="translate(512 0) scale(-1 1)">` to get the
  RIGHT hand, fill with a skin tone (#E8B48C) plus a darker stroke outline,
  and rotate 180° around the hand's center for the thumb-down pose.
- Teach the right-hand thumb rule in the pedagogically correct order and
  SLOWLY: (1) check the CURRENT direction first, (2) thumb follows the
  current, (3) curled fingers show the FIELD direction. Scene-03's narration
  was rewritten to this order and grew 24s → 58s; each step (arrow appears →
  hand pops → circles draw → anti-clockwise arrows → recap chip → flip → 
  clockwise → recap → rule) is phrase-locked.
- Frame probes for pixel verification must exclude the LEFT text column: the
  blue title's anti-aliased edges match light-sky color tolerances and
  pollute whole-frame color counts (count only the canvas region, or filter
  by x >= canvas left edge).
- Circle-direction arrows: the tangent for anti-clockwise motion in screen
  coordinates (y down) is `angle - 90`; `angle + 90` is clockwise. The arrow
  apex shows travel direction while the triangle body lands on the opposite
  side — verify direction via the apex side or the body side consistently.
- TTS quirk: double-letter words like "ADDS" can be read letter-by-letter
  ("A-D-D-S"). Reword scripts to avoid such words (use "COMBINE into one"
  instead of "ADDS UP") and regenerate that scene's voiceover.
- Captions that succeed each other at the same position must cross-fade:
  `opacity={currentP * (1 - nextP)}` — otherwise they overlap (found at
  scene-04 ADDS/INSIDE and scene-05 ON/OFF).
- Use-case examples should show icons, not just text: inline paths from
  `public/assets/crane-truck.svg` (recolor black fills for the dark canvas)
  and `door-bell.svg` when the narration names them.
- Use the whole right column for the animation canvas: `width="100%"`
  `height="100%"` + `preserveAspectRatio="xMidYMid meet"` on the SVG scales
  every object ~1.9x larger (480x340 viewBox letterboxed into a 916x920 cell)
  — never leave the diagram at its intrinsic 480x340 size in a much bigger
  column.
- Fleming's left-hand rule must be physically right: field N->S (index), the
  conductor's current direction (middle finger, shown with ANIMATED moving
  dashes on the rod), and the force = thumb, which for field-right +
  current-up is INTO the page — draw it as the ⊗ circle-cross symbol on the
  rod. Draw the schematic hand with three mutually PERPENDICULAR rectangular
  fingers (index right, middle up, thumb ⊗) plus right-angle markers, and
  label the fingers explicitly ("INDEX = FIELD", "MIDDLE = CURRENT",
  "THUMB = FORCE").
- Captions that succeed each other at the same position must cross-fade
  (`opacity={currentP * (1 - nextP)}`) — also applied to the induction
  scene's DEFLECTS / still / pull-OUT captions. When a caption chain has more
  than two links, EVERY link needs its own cross-fade factor (a forgotten
  link makes two captions overlap — found and fixed in the Fleming scene's
  force/OUT captions).
- Fleming's left-hand rule must follow the NCERT textbook (Section 12.3,
  Activity 12.7): a conductor between horse-shoe magnet poles with the field
  UPWARD (N below, S above), current INTO the page (⊗) / OUT (⊙), and the
  conductor displaced LEFT / RIGHT as the current reverses — force strongest
  when current ⊥ field. Draw the rod as a cross-section circle that slides,
  and the hand with INDEX finger UP (field), MIDDLE finger ⊗ INTO the page
  (current), THUMB LEFT (force), all mutually perpendicular with labels and
  right-angle markers.
- Emoji in SVG captions is risky in headless Chrome (font fallback); use plain
  text. Verify every phrase against regenerated alignments before rendering.
  It loads `GOOGLE_API_KEY` or `GEMINI_API_KEY` from `.env` and saves 16:9 images directly to `public/images/`.
- The voiceover script must regenerate MP3 files, word-level alignments, and
  accurate `durationInFrames`. Do not leave new scenes silent.
- Run all raw math formulas through a phonetic sanitizer (`cleanMathTextForSpeech`) in `generate-voiceovers.js` (e.g. converting `1/Rp` ➔ `"one over R P"`, `+` ➔ `"plus"`, `=` ➔ `"equals"`) before sending to TTS to avoid garbled speech.

## Narration–Animation Sync (RayDiagramScene)

- **Every ray the narration mentions must exist on screen.** Scenes 04–08 of
  `01_ray_diagrams.json` previously narrated rays (bottom ray bending UP, ray
  through F₁ exiting parallel, candle-base ray) that `RayDiagramScene` never
  drew. Rule: if `teacherScript` names a ray, the animation must draw it.
- Drive animation phases from the word-level `alignments`, not fixed frame
  ranges. `RayDiagramScene` now matches spoken phrases (e.g. `"Top rays get
  bent"`) against `teacherScript` word tokens and uses the alignment
  `start`/`end` as phase boundaries. `alignments` are in SECONDS relative to
  scene start; multiply by `fps` to get frames.
- When a scene narrates a specific shortcut/construction, draw ONLY that ray —
  do not let rays belonging to other shortcuts (or the real image) appear
  mid-scene. Use the content `variant` field
  (`full | focus_convergence | shortcut1 | shortcut2 | shortcut3 | inversion`)
  to select the animation program; keep `full` as the default so reel
  compositions without a variant are unchanged.
- Never let an `interpolate` input range be degenerate. `p(frame, start, end)`
  must guard `end <= start` (e.g. `fCross9` had both fallbacks at 130 → crash
  `inputRange must be strictly monotonically increasing but got [3900,3900]`).
  Fallback values passed to the `t()`/`te()` helpers must be in SECONDS, not
  frames, or a no-alignment composition gets a 3900-frame phase.
- If a scene's narration describes a visual (rays crossing, candle flame) but
  its `type` is text-only (e.g. `kinetic_typography`), convert the scene to
  `ray_diagram` instead of leaving narration without matching visuals.
- **Refracted rays must pass EXACTLY through the focal point.** Compute the
  post-lens endpoint from F2, not from the lens point:
  `redOutY = OY + (OY - objTopY) * ((rayEndX - OX - F) / F)` — measuring the
  drop from the lens point (`* (rayEndX - OX) / F`) makes the ray miss F2 by
  tens of pixels (found via user feedback; verified by sampling the F2 box in
  rendered frames).
- Animate narrated lens properties too: when the narration describes the lens
  shape ("fat in the middle, thin at the edges"), morph the lens path
  (quadratic control-point offset `lensK`) from thin to fat over the
  corresponding alignment window, and glow the middle while "fat in the
  middle" is spoken.
- Opening/title scenes that narrate a physical idea ("converging lens brings
  scattered rays to one spot") should show it: convert the title scene to
  `ray_diagram` with the `converging` variant (rays at 5 heights draw in,
  bend inward, and meet at a glowing spot at F2).
- **Spoon-feeding beats speed.** For concepts students struggle with (e.g.
  "why is the real image upside down"), the narration must go one cause-effect
  step per sentence — "A ray from the top of the flame travels parallel. The
  lens bends it DOWN, through the focus F 2. ... So the flame's light lands at
  the BOTTOM of the image." — and the animation must pace one labelled visual
  per sentence (STEP badges, ray-path chips like "FLAME ray → BELOW axis",
  swap arrows, an "UPSIDE DOWN!" stamp). Scene-08 grew from 21.9s to 59.1s of
  narration and that is the right trade-off.
- Regenerating ONE scene's voiceover: `generate-voiceovers.js` skips any scene
  whose MP3 already exists — delete `public/audio/<folder>/<id>_<scene>.mp3`
  first, then run `node generate-voiceovers.js <folder>`. It rewrites that
  scene's `alignments`, `durationInFrames` (audio + 15-frame padding) and the
  top-level `durationInFrames`. Always re-run the phrase-marker check against
  the NEW alignments afterwards (words can merge/split in TTS output).
- **Live-draw narrated guides instead of a static image.** Scenes that explain
  setup elements (Principal Axis, Optical Center, Focal Points) must DRAW each
  element at the moment the narration names it: the axis line grows
  left-to-right during "Draw a straight horizontal line through the middle",
  the lens pops in at "Mark the exact bullseye center of the lens", the O
  bullseye appears at "called the Optical Center O", and F1/F2 pop in labelled
  after the narration ends. Use the `guides` variant; hide the common
  axis/focal-labels/lens for it (conditionally render them for
  `variant !== "guides"`), and extend the scene duration past the narration
  tail so post-narration pops (F1/F2) are visible for ~2s before the next
  scene.
- Note: TTS word alignments can merge words across punctuation
  ("middle—that" becomes one token `middlethat`, "lens—called" becomes
  `lenscalled`). Match such phrases using the cleaned merged token exactly;
  verify every phrase against the real alignments with the node simulation
  before rendering.
- Focal points etc. must be NARRATED, not just drawn: if a scene's bullet
  list mentions elements (F₁/F₂) that the narration never says, extend the
  teacherScript with a slow sentence ("Mark two more points on the axis, one
  on the left of O and one on the right... These two points are called F 1
  and F 2. Remember: the Focal Points sit right on the Principal Axis."),
  regenerate that scene's voiceover (delete its MP3 first), and animate the
  elements at their spoken moments (dots appear one-by-one during "one on the
  left / one on the right", labels at "called F 1 and F 2", axis pulse at
  "sit right on the Principal Axis").

## Visual & Branding Guidelines

- **Primary Color Schemes by Subject**:
  - **Physics & Chemistry**: Use **#EC8366** (Terracotta/Coral) as the primary base color for highlights, accents, and glowing effects.
  - **Biology**: Use **#F26A6C** (Soft Crimson/Pink) as the primary base color.
  - **Mathematics**: Use **#06B6D4** (Electric Cyan) to give math formulas and logic a high-tech, coding/gaming aesthetic.
  *(Always use these brand colors across all components unless an explicit alternative is required for semantic reasons, like drawing blue deoxygenated blood).*

### Gen-Z Aesthetic Rulebook

To maximize engagement for the teenage demographic, all visual components MUST adhere to these modern design trends:

1. **Dark Mode Gradients (NO AI Blue)**: Video backgrounds must use rich, deep dark gradients (e.g., deep charcoal `#121212`, dark aubergine `#1A0B2E`, or deep obsidian). **Strictly AVOID standard Navy Blue or AI-default Blue backgrounds.** Ensure the gradients are subtle radial or linear fades to give depth.
2. **Bento Box Grids**: When displaying bullet points, formulas, or steps, do not use basic text lists. Organize information into distinct, rounded, floating "Bento Boxes" (translucent cards with rounded corners and subtle glowing borders) to make complex info feel bite-sized and premium.
3. **Kinetic Typography**: Important keywords should not just statically fade in. They should aggressively scale up, highlight in the subject's brand color exactly when spoken, and utilize movement (like a slight shake for warnings or errors) to match modern short-form editing styles.
4. **Modern Typography (Ban Serifs)**: Never use serif fonts (like Georgia) in video components. Standardize entirely on the **Outfit** sans-serif font family. Use extreme contrasts in weight: use `fontWeight: 900` (Black) for high-impact titles and keywords, and `fontWeight: 300` (Light) for secondary descriptions.
5. **Anime/RPG Gamification Theme**: Frame the hardest 5-mark board exam questions as "Anime Boss Battles". Use gamified visual motifs (e.g., "Level Up!" badges, HP/Health bars for the problem, animated speed lines for high-intensity calculations). Script the narration to treat learning like unlocking a video game "Cheat Code" or "Hacking the Matrix".
6. **SVG Assets Repo**: Always check `C:\Sagar\Projects\CBSE\sagarv-svg-repo` for available pre-downloaded SVGs (like ships, lighthouses, boats) before attempting to draw shapes manually with HTML/SVG primitives.
7. **Simple & Clear English**: Avoid obscure or confusing slang (e.g., avoid terms like "glitch it"). Always use simple, clear, and direct English so students of all language backgrounds understand mathematical and scientific concepts effortlessly.

## YouTube Growth & SEO Workflow

- **Optimized MP4 Naming (Search Intent)**: Never render videos to generic filenames like `out/video.mp4` or `out/acids_01.mp4`. YouTube reads the raw filename for initial search ranking. Always use long-tail, SEO-optimized, hyphen-separated filenames that students search for (e.g., `out/cbse-class-10-hydrogen-pop-test-acids-bases-salts.mp4`).
- **No Long Intros (AVD)**: Never generate a script with a long channel intro or slow logo animation. The first 10-30 seconds must instantly hook the viewer with the core question or visual experiment.
- **Mandatory Companion Shorts (Traffic Funnel)**: Whenever you create a 16:9 Masterclass video, always propose and generate a condensed 20-30 second 9:16 companion Short (using `ReelComposition.tsx`) featuring the most highly visual or explosive moment. This acts as a funnel for the main video.
- **Engagement Priming**: When delivering the final Title and Description for a video, always include an engaging "Pinned Comment Challenge" (a question designed to spark comments) and a "Community Tab Poll" suggestion.

## Psychological Scriptwriting Frameworks

When generating JSON `teacherScript` narration or `content` text, you MUST utilize the following psychological hooks:

1. **Loss Aversion (Fear of Losing Marks)**: Students are motivated by fear of loss. Instead of framing lessons as "How to gain 5 marks", frame them as "The #1 mistake that will cost you 5 marks." 
2. **The Zeigarnik Effect (Curiosity Gaps)**: The brain hates unfinished loops. Open the video with a bizarre or high-stakes question/visual (e.g., "Why did this test tube explode?") and withhold the answer until the middle of the video to force retention.
3. **The Insider Secret Bias**: Rebrand standard, boring textbook theorems as exclusive "cheat codes", "hacks", or "tricks" (e.g., *The Z-Trick*, *The Root-3 Cheat Code*). It makes students feel like they are learning a forbidden shortcut.
4. **Pattern Interrupts**: Never let the script or animation dwell on one static visual for more than 4-5 seconds. Write scripts that trigger visual changes frequently (zooms, pop-up text, color changes) to repeatedly reset the viewer's attention span.



- **Start Scenes Clean (Progressive Disclosure)**: Never carry over clutter from previous scenes if it is not actively being discussed. In animation, start the scene empty with just the essential base background (e.g., sea, lighthouse, ships). Gradually introduce and fill up the lines, angles, and measurements exactly when the narration starts talking about them.
