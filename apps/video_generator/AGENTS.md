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

## Educational and Visual Standards

- **Storytelling Blueprint (KodeKloud, Science Simplified 4 All & Dr. Ben Miles Benchmark)**:
  1. **Narrative / Mystery Hook**: Start with a discovery story, a "What If?" thought experiment, or contrasting Classical Expectation vs Real-World Twist.
  2. **Everyday Relatable Analogies & Energy Landscapes**: Use age-appropriate physical analogies (e.g. bicycle on grass for refraction, ball rolling over a hill for potential difference).
  3. **Progressive Synchronized Visual Building**: Build SVG diagrams piece-by-piece in exact multi-phase sync with spoken narration (e.g. as teacher says "passes through Focus F2", the ray refracts through F2 while F2 pulses with a glowing highlight halo). Use glowing vector elements on dark backgrounds.
  4. **Thought Experiment Scenarios**: Ask "What happens if...?" to build student intuition before giving the answer.
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

## Voiceover & Thumbnail Generation

- After adding scenes or changing `teacherScript` or other narrated text, run
  `node generate-voiceovers.js <subject_folder>` from this directory.
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


