with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'r') as f:
    content = f.read()

# 1. Update _fetchNoteContent check
content = content.replace(
    'if (lesson.type == LessonType.note) {',
    'if (lesson.type == LessonType.note || lesson.type == LessonType.studyGuide) {'
)

# 2. Update subtitle text
content = content.replace(
    'lesson.type == LessonType.video ? "🎥 Video • ${lesson.duration}" : "📄 Notes"',
    'lesson.type == LessonType.video ? "🎥 Video • ${lesson.duration}" : (lesson.type == LessonType.studyGuide ? "📚 Study Guide" : "📄 Notes")'
)

# 3. Update statusIcon
content = content.replace(
    'final statusIcon = isLocked ? Icons.lock_rounded : (lesson.type == LessonType.video ? Icons.play_arrow_rounded : Icons.article_rounded);',
    'final statusIcon = isLocked ? Icons.lock_rounded : (lesson.type == LessonType.video ? Icons.play_arrow_rounded : (lesson.type == LessonType.studyGuide ? Icons.menu_book_rounded : Icons.article_rounded));'
)

with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'w') as f:
    f.write(content)
