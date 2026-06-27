# Implementation Plan: Add "Electric Potential & Potential Difference" Video Lesson

This plan details the steps to introduce the newly generated "Electric Potential & Potential Difference" video into the learning platform. We will insert a new lesson in the database, adjust sequence numbers, and wire the video path in the Flutter client.

## Proposed Changes

### Database Configurations

#### [MODIFY] [seed.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed.sql)
We will modify the SQL seed file to:
- Rename `12.1 Electric Current & Potential` to `12.1 Electric Current & Circuit` (sequence 1).
- Add the new lesson `12.2 Electric Potential & Potential Difference` (sequence 2) with ID `b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010`.
- Shift and rename `12.2 Ohm's Law & Circuit Elements` to `12.3 Ohm's Law & Circuit Elements` (sequence 3).

### Flutter Client Changes

#### [MODIFY] [lessons_view.dart](file:///home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/views/lessons_view.dart)
We will update `_getVideoUrl` to map:
- `b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006` $\rightarrow$ `videos/01_introduction.mp4?v=2`
- `b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010` $\rightarrow$ `videos/02_potential_difference.mp4?v=2`
- `b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007` $\rightarrow$ `videos/03_ohms_law.mp4?v=2`

---

## DB Update Migration Query (To run via Docker/psql)
```sql
-- 1. Temporarily move sequence 2 to 99 to avoid UNIQUE constraint conflicts
UPDATE lessons SET sequence_number = 99 WHERE chapter_id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222' AND sequence_number = 2;

-- 2. Insert the new potential difference lesson as sequence 2
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, is_free, sequence_number)
VALUES ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '12.2 Electric Potential & Potential Difference', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 1200, TRUE, 2);

-- 3. Move the Ohm's law lesson to sequence 3 and update its title
UPDATE lessons SET sequence_number = 3, title = '12.3 Ohm''s Law & Circuit Elements' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007';

-- 4. Update the title of the first lesson
UPDATE lessons SET title = '12.1 Electric Current & Circuit' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006';
```

---

## Verification Plan

### Automated Tests
- Run `flutter analyze` inside `apps/mobile_web_client/` to verify clean Dart syntax.

### Manual Verification
- Deploy to the local server and verify the new video listing `12.2 Electric Potential & Potential Difference` is visible and playable.
- Ensure `12.3 Ohm's Law & Circuit Elements` is still playable.
