# Implementation Plan: Multichapter Science Diagrams Integration

This plan details the addition of 4 high-fidelity vector diagrams across key Science chapters using Flutter's `CustomPainter` to align with the CBSE Class 10 textbook content.

---

## 1. Objectives

1. **Implement 4 New Vector Diagrams:**
   - **Chapter 6 (Control and Coordination):** Neuron Structure diagram (`neuron`).
   - **Chapter 10 (Human Eye & Colourful World):** Prism Dispersion diagram (`prism_dispersion`).
   - **Chapter 12 (Magnetic Effects):** Bar Magnet Magnetic Field Lines diagram (`bar_magnet_field`).
   - **Chapter 13 (Our Environment):** Trophic Levels Pyramid diagram (`trophic_levels`).

2. **Incorporate Figure Markup in Database Notes:**
   - Chapter 6: Place `[FIGURE: neuron]` in Section 3 (Concept 1: Nervous System).
   - Chapter 10: Place `[FIGURE: prism_dispersion]` in Section 5 (Concept 3: Dispersion).
   - Chapter 12: Place `[FIGURE: bar_magnet_field]` in Section 3 (Concept 1: Magnetic Field).
   - Chapter 13: Place `[FIGURE: trophic_levels]` in Section 4 (Concept 2: Ecosystem/Food chains).

3. **Update active Database rows:**
   - Run SQL scripts to inject the figure tags in the correct lessons.

---

## 2. Technical Specification & Design

### A. Neuron Structure (`neuron`)
- **Layout**: Horizontally oriented.
- **Components**:
  - Cell Body (Soma) on left: Star-shaped or circular nucleus with branching dendrites.
  - Axon in center: Horizontal line covered by rounded myelin sheath blocks (yellow/gold).
  - Nerve Ending on right: Branching terminal buttons.
- **Labels**: "Dendrite", "Cell Body", "Nucleus", "Axon", "Nerve Ending".

### B. Prism Dispersion (`prism_dispersion`)
- **Layout**: Center triangle (glass prism).
- **Light Beam**: White line enters from the left at an angle, refracts at the surface, and exits to the right splitting into a wide multi-colored VIBGYOR band (Red at top, Violet at bottom).
- **Labels**: "White Light", "Glass Prism", "Spectrum (VIBGYOR)".

### C. Bar Magnet Field Lines (`bar_magnet_field`)
- **Layout**: Center horizontal bar magnet split into North (N) and South (S).
- **Field Lines**: Closed, concentric Bezier curves extending from N to S above and below the magnet, plus outward arcs at the poles, carrying directional arrows (pointing N $\rightarrow$ S).
- **Labels**: "N Pole", "S Pole", "Magnetic Field Lines".

### D. Trophic Levels Pyramid (`trophic_levels`)
- **Layout**: Stacked horizontal trapezoids forming a 4-tier pyramid.
  - Tier 1 (Top): Tertiary Consumers (e.g. Eagle) - `10 J` (Red).
  - Tier 2: Secondary Consumers (e.g. Snake) - `100 J` (Orange).
  - Tier 3: Primary Consumers (e.g. Rabbit) - `1,000 J` (Yellow).
  - Tier 4 (Bottom): Producers (Plants) - `10,000 J` (Green).
- **Labels**: "Producers", "Primary Consumers", "Secondary Consumers", "Tertiary Consumers", "10% Energy Transfer Flow".

---

## 3. Implementation Steps

1. **Update `lessons_view.dart`:**
   - Implement `NeuronPainter`, `PrismDispersionPainter`, `BarMagnetFieldPainter`, and `TrophicLevelsPainter`.
   - Update `_buildFigureBox` to support the new types (`neuron`, `prism_dispersion`, `bar_magnet_field`, `trophic_levels`) with custom captions, heights, and painters.

2. **Update SQL Seeds:**
   - Modify the note records in `db/seed_batch3_math_science.sql` and run SQL commands on the container to append the figure placeholders.

3. **Verify:**
   - Run `flutter analyze` and `flutter build web` to ensure clean compilation.
