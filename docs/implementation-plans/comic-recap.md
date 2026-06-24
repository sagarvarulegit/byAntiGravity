# Implementation Plan - Comic-Style Chapter Recap Widget

Create a reusable Flutter widget at `apps/mobile_web_client/lib/widgets/comic_recap.dart` that presents a comic-style recap of chapter concepts with dialogue between Priya and Rahul.

## 1. ComicPanel Model
Define the `ComicPanel` model representing a single panel of dialogue:
```dart
class ComicPanel {
  final String speaker; // Expected to be 'Priya' or 'Rahul' (case-insensitive checking)
  final String text;

  ComicPanel({
    required this.speaker,
    required this.text,
  });
}
```

## 2. UI Layout & Alignment
For each panel, we will lay out:
- **Priya's Dialogue**:
  - Avatar placeholder (circle with initial 'P') on the left.
  - Left-aligned speech bubble.
  - Bubble background: `AppColors.purpleLight` (light mode) or `AppColors.purpleDark` (dark mode) with appropriate contrast text.
- **Rahul's Dialogue**:
  - Right-aligned speech bubble.
  - Avatar placeholder (circle with initial 'R') on the right.
  - Bubble background: `AppColors.blueLight` (light mode) or `AppColors.blueDark` (dark mode) with appropriate contrast text.

We will use a custom speech bubble shape or custom clipping to draw the bubble tail for an authentic comic book feel.

## 3. "Remember This!" Callout
Below the panels, we will draw the "Remember This!" callout:
- Background: `AppColors.orangeLight` (light mode) or `AppColors.orangeDark` (dark mode).
- Border: 2px solid `AppColors.orange` or similar accent.
- Icon/Title: "📌 REMEMBER THIS!" in bold `Outfit` font.
- Content: The `rememberThis` text styled with `Georgia` or `Outfit` text style.

## 4. Theme Compatibility
- Ensure backgrounds, text colors, and borders adjust based on `Theme.of(context).brightness`.
- Text styles will leverage `Theme.of(context).textTheme` fonts (Georgia for conversational text, Outfit for labels and headers).

## 5. Verification Plan
- Run `flutter analyze` inside `apps/mobile_web_client` to verify compilation and static checks.
- Add mock usage of `ComicRecap` inside the notes views (if applicable) or verify in the main shell.
