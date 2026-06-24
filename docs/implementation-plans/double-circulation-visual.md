# Implementation Plan: Double Circulation Diagram for Chapter 5

This plan details the changes required to implement a high-fidelity vector diagram of **Double Circulation** via a `CustomPainter` and integrate it into **Science Chapter 5 (Life Processes)** revision notes.

---

## 1. Objectives

1. **Refactor Note Figure Parsing:**
   - Generalize the `[FIGURE]` parser in `lessons_view.dart` to support arguments (e.g., `[FIGURE: double_circulation]`).
   - Dynamically load different painters, heights, and captions based on the parsed figure type.

2. **Implement Double Circulation Vector Diagram:**
   - Create a `DoubleCirculationPainter` class in `lessons_view.dart`.
   - The diagram will feature:
     - **Lungs** (Top block) with "Lungs (Oxygenation of blood)".
     - **Heart** (Middle block) divided into 4 chambers: **Right Atrium (RA)**, **Right Ventricle (RV)**, **Left Atrium (LA)**, and **Left Ventricle (LV)**.
     - **Body Organs** (Bottom block) with "Body Organs (Systemic capillaries)".
     - **Deoxygenated Path (Blue)**: Vena Cava (Body $\rightarrow$ RA) and Pulmonary Artery (RV $\rightarrow$ Lungs).
     - **Oxygenated Path (Red)**: Pulmonary Vein (Lungs $\rightarrow$ LA) and Aorta (LV $\rightarrow$ Body).
     - Text labels and directional flow arrows along each path.

3. **Update Database Seed & Runtime Content:**
   - Modify the note markdown for Chapter 5 in `db/seed_batch3_math_science.sql` to include `[FIGURE: double_circulation]` right after the Double Circulation jargon block in Section 5.
   - Run a PostgreSQL update query on the local database container to apply this change to the running instance.

---

## 2. Technical Specification & Design

### A. Refactoring `_buildFigureBox` and parsing in `lessons_view.dart`
- In `_parseMarkdownNotes`:
  ```dart
  final figRegex = RegExp(r'\[FIGURE(?::\s*([a-zA-Z0-9_-]+))?\]');
  final figMatch = figRegex.firstMatch(cleanLine);
  if (figMatch != null) {
    hasFigure = true;
    figType = figMatch.group(1) ?? 'magnesium_burner';
    cleanLine = cleanLine.replaceAll(figRegex, '');
  }
  ```
- Change `_buildFigureBox(bool isDark)` to `_buildFigureBox(String figType, bool isDark)`.
- Use a switch/if-else map to load the corresponding painter, height, and caption.

### B. Double Circulation Painter Design
- **Dimensions**: height of $280$, width of double.infinity.
- **Palettes**:
  - Oxygenated lines/arrows: Hex `#E11D48` (Crimson Red).
  - Deoxygenated lines/arrows: Hex `#0284C7` (Sky Blue).
  - Borders/containers: theme-aware borders using `isDark`.
- **Text Labels**: Rendered via helper method using `TextPainter` and `Outfit` font.
- **Directional Arrows**: Small filled triangles positioned at calculated curve coordinates pointing in the flow directions.

---

## 3. Implementation Steps

### Step 1: Update `lessons_view.dart`
- Modify the parser in `_parseMarkdownNotes` to capture the dynamic figure type.
- Implement the `DoubleCirculationPainter` class.
- Update `_buildFigureBox` to support `double_circulation` type.

### Step 2: Update Database Seed and Running DB
- Add `[FIGURE: double_circulation]` to `db/seed_batch3_math_science.sql`.
- Run database update query via `docker exec -i supabase_db_byAntiGravity psql` to insert the tag in the live database lesson body.

### Step 3: Verification
- Execute `flutter analyze` in `apps/mobile_web_client` to confirm no static analysis errors.
- Test the hot-reload or rebuild the web client and check `http://localhost:8085` to ensure the double circulation diagram renders beautifully in Chapter 5.

---

## 4. Verification Plan

1. **Compilation Check**: `cd apps/mobile_web_client && flutter analyze`
2. **Visual Verification**: Navigate to Chapter 5: Life Processes notes in local browser and confirm:
   - Diagram fits neatly within the scrollable content.
   - Light and dark themes render borders, cards, and labels with appropriate contrast.
   - Curves and arrows align correctly without clipping.
