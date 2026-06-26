# Implementation Plan: Verification and Web Build for Badge Removal

We verified that `showBadge` is set to `false` (default value) in `interactive_example.dart` and `question_card.dart`, and it is no longer passed as `true` in `lessons_view.dart`.

To resolve the user seeing the outdated badges, we need to rebuild the Flutter web build so that the live/preview version of the web app compiles the latest code.

## Proposed Steps

1. **Build Web Client**: Run `flutter build web` inside `apps/mobile_web_client/`.
2. **Commit and Push**: Commit the built assets (if tracked) or deploy if applicable, and verify everything builds clean.
