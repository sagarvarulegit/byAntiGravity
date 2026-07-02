# SVG Design & Animation Guide (howsvg.md)

This document serves as the design standard and technical guide for creating, animating, and integrating SVG illustrations within the CBSE Class 10 Learning Portal. These guidelines are compiled from key learnings and bug resolutions during the development of **Figure 1.1 (Magnesium Ribbon Activity)**.

---

## 1. Grid, Coordinates & Responsiveness

### A. Viewbox Aspect Ratio
* Always use a standard widescreen coordinate system: `viewBox="0 0 1280 720"` (16:9 aspect ratio).
* This provides a wide canvas that fits textbook-style horizontal layouts perfectly.

### B. Responsive Containers in Flutter
* Never use a hardcoded height constraint (e.g., `height: 180` without aspect-ratio scaling). Wrap it in an `AspectRatio(16/9)` widget.
* Constrain the maximum size on desktop to prevent the SVG from taking over the entire screen:
  ```dart
  Container(
    constraints: BoxConstraints(maxHeight: figHeight * 1.8), // e.g. 180 * 1.8 = 324px
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: buildAnimatedSvg(...),
    ),
  )
  ```
  * **On Desktop:** Capping the height at 324px scales the width to 576px, doubling the viewing area while maintaining aspect ratio.
  * **On Mobile:** The layout scales down naturally (e.g., 360px wide by 202px tall) without adding any blank space.

---

## 2. Typographic Scale & Scaling Factor

Since SVGs are scaled down dynamically by the browser to fit their screen containers, text elements must be pre-scaled up within the SVG code to remain readable.

### Font Sizes for a `1280 x 720` Canvas:

| Text Type | SVG Font Size | Target Screen Size (Desktop - 0.45x) | Target Screen Size (Mobile - 0.28x) | Style Guidelines |
| :--- | :--- | :--- | :--- | :--- |
| **Diagram Title** | `36px` | `16.2px` | `10.0px` | Georgia, Serif, Bold, `#F8FAFC` |
| **Chemical Equation** | `44px - 48px` | `19.8px - 21.6px` | `12.3px - 13.4px` | Georgia, Serif, Bold, `#F8FAFC` |
| **State Symbols** | `16px` | `7.2px` | `4.5px` | Arial, Sans-serif, Bold, `#94A3B8` (offset below equation) |
| **Observation Notes** | `28px` | `12.6px` | `7.8px` | Arial, Sans-serif, Bold, `#38BDF8` (centered) |
| **Diagram Labels** | `26px - 28px` | `11.7px - 12.6px` | `7.2px - 7.8px` | Arial, Sans-serif, Bold, `#CBD5E1` |
| **Caution Title** | `20px` | `9.0px` | `5.6px` | Arial, Sans-serif, Bold, inside warning box |
| **Caution Description**| `17px` | `7.6px` | `4.7px` | Arial, Sans-serif, Normal, inside warning box |

* **Warning Box Dimensions:** Ensure any caution/warning containers are wide and tall enough (e.g., `480px` wide by `95px` height) to prevent text clipping at these larger font sizes.

---

## 3. Color Palette & High Contrast Rules

### A. Background Selection
* **Rule:** Never use a white or light-grey background (`#FFFFFF` or `#F8FAFC`) if the animation contains light-colored reaction elements (such as white chemical ash, bubbles, light-colored gas fumes, or silver/zinc metal).
* **Premium Standard:** Use a dark slate background (**`#1E293B`**). This creates an immediate "wow" factor, provides excellent contrast for white elements, and makes glowing sparks, flames, and bubbles look highly realistic.

### B. Element Color Standards
* **Apparatus (Tongs, Flasks):** Use light metal gradients (`#CBD5E1` to `#64748B`) to stand out on dark slate.
* **Label Leader Lines:** Use thin, light lines (`stroke="#94A3B8"` with `stroke-width="1.5"`) terminated with a small circle (`r="3.5"`) pointing to the target item.
* **Warning Box:** Use gold/yellow fills (`#FEF08A`) with amber borders (`#F59E0B`) and dark-brown warning text (`#78350F`) for clean high-contrast legibility.

---

## 4. Animation Engineering (SVG Native vs CSS Transforms)

### A. Avoid CSS Transforms for Position Shifts
* **The Bug:** Applying CSS `transform: translateY(...) scale(...)` on SVG elements causes massive horizontal shifting. Browser engines default `transform-origin` to the global SVG viewport `(0, 0)` rather than the element center, causing scaled items to slide sideways.
* **The Solution:** Use native SVG **`<animate>`** and **`<animateTransform>`** elements inside the SVG nodes:
  * **For Vertical Drops (e.g., falling ash, bubbles):** Animate the center coordinate `cy` directly:
    ```xml
    <circle cx="440" cy="355" r="4.5" fill="#FFFFFF">
      <animate attributeName="cy" from="355" to="520" dur="1.2s" repeatCount="indefinite" begin="0s" />
      <animate attributeName="r" from="2.5" to="4.5" dur="1.2s" repeatCount="indefinite" begin="0s" />
      <animate attributeName="opacity" values="0; 1; 1; 0" keyTimes="0; 0.1; 0.9; 1" dur="1.2s" repeatCount="indefinite" begin="0s" />
    </circle>
    ```
  * **For Scale Growth (e.g., powder pile, gas build-up):** Animate the scale natively inside a translated group. Because it scales relative to local `(0, 0)` of the group, the base of the pile remains perfectly anchored:
    ```xml
    <g transform="translate(440, 520)">
      <path d="M -30 0 C -20 -17, 20 -17, 30 0 Z" fill="#FFFFFF">
        <animateTransform 
          attributeName="transform" 
          type="scale" 
          values="0.2 0.1; 1 1; 1 1; 0.2 0.1" 
          keyTimes="0; 0.7; 0.75; 1" 
          dur="10s" 
          repeatCount="indefinite" />
      </path>
    </g>
    ```

---

## 5. Strict XML Parser Compliance

* Chrome's XML parser is extremely strict. A single unescaped ampersand (`&`) in comments, CSS blocks, or text elements will crash rendering with an `xmlParseEntityRef: no name` error.
* **Rule:** Never write `&` inside the SVG. Always replace it with the word `and` or use the XML entity `&amp;`.

---

## 6. Web Platform Delivery & Cache Busting

### A. IFrame View Wrapper
* Chrome disables CSS animations inside SVGs if they are loaded inside a standard `<img>` tag (`ImageElement`).
* Always wrap the SVG in a `html.IFrameElement` platform view. This loads the SVG as an isolated document, enabling full, native browser animation execution.

### B. Bypassing Browser Cache
* Chrome aggressively caches iframe documents, continuing to load old versions of SVGs.
* Always append a unique session buster to the iframe source URL and register the view factory with a session buster:
  ```dart
  final String _sessionBuster = DateTime.now().millisecondsSinceEpoch.toString();
  final String viewId = 'svg-view-$svgPath-$_sessionBuster';
  // ...
  iframe.src = 'assets/$svgPath?v=$_sessionBuster';
  ```
