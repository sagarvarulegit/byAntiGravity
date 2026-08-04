# Mobile/Web Client Rules

## Learning Capture

- Record reusable Flutter or parser learnings in this file after fixing code in
  `apps/mobile_web_client/`.

## Markdown Parsing and Badges

- Support `[!IMPORTANT]` alongside `[!NOTE]`, `[!WARNING]`, and `[!CAUTION]`.
  Render it as a deep-purple alert container.
- Detect metadata such as `Board Exam Hot Topic` before stripping blockquote
  `>` characters, or match the content independently of that prefix.
- Reformat stored repetition strings such as `Repeated 4x (2026)` into
  user-facing badge layouts such as `[2026] Board PYQ`.

## Figure Rendering

- Never hardcode English content matches such as
  `line.contains('Gas bubbles')` to inject widgets or figures.
- Use explicit database tokens such as `[FIGURE: zinc_acid]` and remove legacy
  text-matching fallbacks after tokens are introduced to avoid duplicates.
- `lessons_view.dart` supports both SVG `svgPath` and JPG/PNG `imagePath`
  fallbacks.
- Prefer realistic JPG illustrations for real-world experiments. If image
  generation is unavailable, use an SVG animation or a vibrant vector-style
  fallback and map the correct path type.

