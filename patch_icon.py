with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'r') as f:
    content = f.read()

content = content.replace(
    'isSelected ? Icons.play_arrow_rounded : statusIcon',
    'isSelected ? (lesson.type == LessonType.video ? Icons.play_arrow_rounded : (lesson.type == LessonType.studyGuide ? Icons.menu_book_rounded : Icons.article_rounded)) : statusIcon'
)

with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'w') as f:
    f.write(content)
