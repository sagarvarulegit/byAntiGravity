# Antigravity AI Agent - Workspace Rules & Conventions

This directory contains workspace-level rules and instructions for Antigravity AI coding agents working on the CBSE Class 10 Learning Portal.

---

## 🎨 Theme & Color Guidelines (CBSE / NCERT Specs)
When creating or modifying styling systems (CSS or Dart UI), strictly follow these color codes:

### Color Tokens:
- **Scaffold Paper Background (Light)**: `#FAF9F6`
- **Scaffold Dark Background**: `#0F172A`
- **Text Color (Light)**: `#0F172A` (Primary), `#334155` (Secondary)
- **Text Color (Dark)**: `#F8FAFC` (Primary), `#CBD5E1` (Secondary)
- **NCERT Magenta (`#BE185D`)**: Used for chapter numbers, warning texts, and bullet points.
- **NCERT Sky Blue (`#0284C7`)**: Used for main chapter titles, section headers, and drop caps.
- **NCERT Orange / Amber (`#EA580C`)**: Used for "Do You Know?" callout blocks.

### Font Mappings:
- **Georgia (Serif)**: Must be applied to all reading text, notes transcript paragraphs, list items, warning boxes, and figure captions to resemble printed textbooks.
- **Outfit (Sans-Serif)**: Applied to app titles, user interface actions, cards, lists, dashboard counters, and sidebar buttons.

---

## ⚙️ Programmatic Vector whiteboarding
To avoid high media storage costs, scalability issues, and streaming lag, video explanation loops use dynamic programmatic rendering:
- **Code is the Video**: An animation controller in Dart (Flutter) updates values between `0.0` and `1.0` and triggers a repaint on a `CustomPainter`.
- **Canvas Math**: Coordinate waveforms are drawn dynamically (e.g. using sine, cosine, and pivot transformations).
- **Interactivity**: Whiteboard diagrams must remain responsive and support dark/light modes automatically.

---

## 📱 Responsive Layout Rules
The application client targets Web (Desktop/Tablet) and Mobile viewports simultaneously:
- **Navigation Shell**: On screen widths $> 900$, render a sidebar drawer. On screens $\le 900$, render a bottom navigation bar.
- **Grid Lists**: Grid items (like chapter catalogs) must dynamically switch column count (e.g. `3` columns for width $> 900$, `2` columns for width $> 600$, `1` column for mobile screens).
- **Side-by-Side Panels**: Textbook contents (like Activity box and SVG figure diagrams) must use layout builders to show side-by-side columns on wide screens, and stack vertically on narrow viewports.
