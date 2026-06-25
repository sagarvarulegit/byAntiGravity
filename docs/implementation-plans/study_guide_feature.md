# Implementation Plan: Study Guide Feature

## Goal
Introduce a new "Self-Study Guide" content type that serves as a complete textbook replacement, with in-depth theory, solved numericals, and PYQs.

## Steps
1. **Database Schema Update**:
   - Run `ALTER TYPE lesson_type ADD VALUE 'study_guide';` on the local database container.
   - Update `db/schema.sql` to include `'study_guide'` in the `lesson_type` ENUM definition.

2. **Flutter App Updates**:
   - `lib/models.dart`: Add `studyGuide` to `LessonType` enum. Update `fromJson` mapping to handle `'study_guide'`.
   - `lib/views/lessons_view.dart`:
     - Update the icon logic: If `lesson.type == LessonType.studyGuide`, show a book icon (e.g., `Icons.menu_book_rounded`) and label it "📚 Study Guide".
     - Ensure the playback/content viewer handles `studyGuide` exactly like `note` (fetching content and rendering markdown).

3. **Content Generation for Electricity**:
   - Create a new file `db/seed_study_guides.sql`.
   - Write an extremely detailed markdown content for Science Chapter 12: Electricity. It will include:
     - Detailed theoretical explanations (analogies, steps).
     - Solved NCERT-style numerical examples.
     - Previous Year Questions (PYQs).
     - Multiple `[FIGURE: ...]` tags where applicable.
   - Insert this new lesson into the `lessons` table for Chapter 12.

4. **Validation**:
   - Run `flutter analyze` to ensure no errors.
   - Run the SQL script on the database.
   - Verify that the app displays the new "Study Guide" lesson.
