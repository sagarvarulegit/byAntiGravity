# Implementation Plan - Study Time Tracking

Track actual study time spent by students while watching video lessons (whiteboard animations).

## 1. LessonsView Timer Logic (`lessons_view.dart`)
- **State variables**:
  - `_currentTime` tracks elapsed seconds in the active video session.
  - Periodic timer `_videoTimer` updates `_currentTime` every second when playing.
- **Save triggers**:
  - When the video completes (`_currentTime >= _totalDuration`), invoke `widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: true)`.
  - When playback is paused, save incremental progress: `widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: false)`.
  - When switching lessons, save progress for the previous lesson if `_currentTime > 0`: `widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: false)`.
  - On widget disposal, save progress for the active lesson if `_currentTime > 0`: `widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: false)`.

## 2. DatabaseService Changes (`database_service.dart`)
- **Method Signature Updates**:
  - Update `recordLessonCompletion` to accept `watchTimeSeconds` and an optional `completed` boolean:
    ```dart
    Future<void> recordLessonCompletion({
      required String lessonId,
      int watchTimeSeconds = 0,
      int masteryScore = 100,
      bool completed = true,
    });
    ```
- **New Methods**:
  - Add `fetchTotalStudyTime()` to retrieve total study time in seconds:
    ```dart
    Future<int> fetchTotalStudyTime();
    ```

## 3. DashboardView Changes (`dashboard_view.dart`)
- **Data Fetching**:
  - Update `_dashboardDataFuture` in `initState()` to fetch total study time alongside completed lessons and quiz attempt history:
    ```dart
    _dashboardDataFuture = Future.wait([
      widget.dbService.fetchCompletedLessonIds(),
      widget.dbService.fetchQuizAttemptHistory(),
      widget.dbService.fetchTotalStudyTime(),
    ]);
    ```
- **Stat Card Display**:
  - Retrieve total study time from `FutureBuilder` snapshot data (`data[2]` as `int`).
  - Convert total seconds to hours: `final double studyTimeHours = totalStudyTimeSecs / 3600.0;`.
  - Update the "Study Time" stat card to display actual study hours using `studyTimeHours.toStringAsFixed(1) + "h"`.

## 4. Main App Logic & Models (`main.dart`, `models.dart`)
- **Callback Signature**:
  - Update `onLessonCompleted` parameter in `LessonsView` definition and instantiation to accept watch time and completion status:
    ```dart
    final Function(String lessonId, int watchTimeSeconds, {bool completed}) onLessonCompleted;
    ```
- **Handler Implementation (`main.dart`)**:
  - Update `_onLessonCompleted(String lessonId, int watchTimeSeconds, {bool completed = true})` in `main.dart`.
  - Call `_dbService.recordLessonCompletion(lessonId: lessonId, watchTimeSeconds: watchTimeSeconds, completed: completed)`.
  - Only increment daily streak and recalculate mastery if `completed` is `true`.

## 5. Verification Plan
- Run `flutter analyze` from `apps/mobile_web_client/` to verify code compiles correctly without errors.
- Test that multiple study sessions across different lessons accumulate time correctly in the `user_progress` table and reflect dynamically on the `DashboardView` Study Time stat card.
