import '../models.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

/// Interface for loading course catalog details (subjects, chapters, lessons).
abstract class DatabaseService {
  Future<List<Subject>> fetchSyllabus();
}

/// Supabase production database loader.
class SupabaseDatabaseService implements DatabaseService {
  final sb.SupabaseClient _client = sb.Supabase.instance.client;

  @override
  Future<List<Subject>> fetchSyllabus() async {
    // Relational select: fetch subjects, nested chapters, and nested lessons in one query.
    final List<dynamic> response = await _client
        .from('subjects')
        .select('id, name, code, description, thumbnail_url, chapters(id, title, sequence_number, description, lessons(id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number))');

    return fromJsonList(response);
  }

  /// Maps Supabase PostgREST JSON response to Flutter strongly typed Models.
  static List<Subject> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((subjectJson) {
      final List<dynamic> chaptersJson = subjectJson['chapters'] as List<dynamic>? ?? [];
      
      // Map chapters
      final List<Chapter> chapters = chaptersJson.map((chapterJson) {
        final List<dynamic> lessonsJson = chapterJson['lessons'] as List<dynamic>? ?? [];
        
        // Map lessons
        final List<Lesson> lessons = lessonsJson.map((lessonJson) {
          final typeStr = lessonJson['type'] as String? ?? 'video';
          final type = typeStr == 'note' ? LessonType.note : LessonType.video;
          
          final durationSecs = lessonJson['video_duration_seconds'] as int?;
          final String durationText = durationSecs != null 
              ? _formatDuration(durationSecs) 
              : '';

          return Lesson(
            id: lessonJson['id'] as String,
            title: lessonJson['title'] as String? ?? '',
            type: type,
            isFree: lessonJson['is_free'] as bool? ?? false,
            duration: durationText,
            videoType: _mapVideoType(lessonJson['title'] as String? ?? ''),
          );
        }).toList();

        // Sort lessons by sequence number
        lessons.sort((a, b) {
          final aSeq = lessonsJson.firstWhere((x) => x['id'] == a.id)['sequence_number'] as int? ?? 0;
          final bSeq = lessonsJson.firstWhere((x) => x['id'] == b.id)['sequence_number'] as int? ?? 0;
          return aSeq.compareTo(bSeq);
        });

        return Chapter(
          title: chapterJson['title'] as String? ?? '',
          lessons: lessons,
        );
      }).toList();

      // Sort chapters by sequence number
      chapters.sort((a, b) {
        final aSeq = chaptersJson.firstWhere((x) => x['title'] == a.title)['sequence_number'] as int? ?? 0;
        final bSeq = chaptersJson.firstWhere((x) => x['title'] == b.title)['sequence_number'] as int? ?? 0;
        return aSeq.compareTo(bSeq);
      });

      return Subject(
        id: subjectJson['id'] as String,
        name: subjectJson['name'] as String? ?? '',
        description: subjectJson['description'] as String? ?? '',
        chaptersCount: chapters.length,
        initialMastery: 0.0,
        chapters: chapters,
      );
    }).toList();
  }

  /// Maps lesson duration in seconds to MM:SS string.
  static String _formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    final String secPad = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$secPad';
  }

  /// Assigns vector whiteboards diagrams based on title context keywords.
  static VideoType _mapVideoType(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('ohm') || lower.contains('elect')) {
      return VideoType.scienceCircuit;
    }
    if (lower.contains('reaction') || lower.contains('chemical') || lower.contains('equation')) {
      return VideoType.scienceAtom;
    }
    if (lower.contains('satyagraha') || lower.contains('india') || lower.contains('movement')) {
      return VideoType.socialMap;
    }
    return VideoType.mathGraph;
  }
}

/// Offline mock database loader for local preview/development.
class MockDatabaseService implements DatabaseService {
  @override
  Future<List<Subject>> fetchSyllabus() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      Subject(
        id: "maths",
        name: "Mathematics",
        description: "Algebra, Quadratic Equations, Trigonometry & Geometry.",
        chaptersCount: 15,
        initialMastery: 72.0,
        chapters: [
          Chapter(
            title: "Chapter 1: Real Numbers",
            lessons: [
              Lesson(id: "m-1-1", title: "1.1 Euclid's Division Lemma", type: LessonType.video, isFree: true, duration: "12:45", videoType: VideoType.mathGraph),
              Lesson(id: "m-1-2", title: "1.2 Fundamental Theorem of Arithmetic", type: LessonType.video, isFree: true, duration: "18:20", videoType: VideoType.mathGraph),
              Lesson(id: "m-1-3", title: "Revision Notes: Real Numbers", type: LessonType.note, isFree: true),
            ],
          ),
          Chapter(
            title: "Chapter 2: Polynomials & Equations",
            lessons: [
              Lesson(id: "m-2-1", title: "2.1 Geometrical Meaning of Zeroes", type: LessonType.video, isFree: false, duration: "22:15", videoType: VideoType.mathGraph),
              Lesson(id: "m-2-2", title: "2.2 Relationship of Coefficients", type: LessonType.video, isFree: false, duration: "15:40", videoType: VideoType.mathGraph),
            ],
          ),
        ],
      ),
      Subject(
        id: "science",
        name: "Science",
        description: "Chemical Reactions, Electricity, Light & Life Processes.",
        chaptersCount: 16,
        initialMastery: 58.0,
        chapters: [
          Chapter(
            title: "Chapter 1: Chemical Reactions",
            lessons: [
              Lesson(id: "s-1-1", title: "1.1 Writing Chemical Equations", type: LessonType.video, isFree: true, duration: "14:10", videoType: VideoType.scienceAtom),
              Lesson(id: "s-1-2", title: "1.2 Types of Chemical Reactions", type: LessonType.video, isFree: false, duration: "24:30", videoType: VideoType.scienceAtom),
              Lesson(id: "s-1-3", title: "Revision Notes: Chemical Reactions", type: LessonType.note, isFree: true),
            ],
          ),
          Chapter(
            title: "Chapter 12: Electricity",
            lessons: [
              Lesson(id: "s-12-1", title: "12.1 Electric Current & Potential", type: LessonType.video, isFree: true, duration: "16:50", videoType: VideoType.scienceCircuit),
              Lesson(id: "s-12-2", title: "12.2 Ohm's Law & Circuit Elements", type: LessonType.video, isFree: false, duration: "28:15", videoType: VideoType.scienceCircuit),
            ],
          ),
        ],
      ),
      Subject(
        id: "social",
        name: "Social Science",
        description: "History, Democratic Politics, Geography & Economics.",
        chaptersCount: 21,
        initialMastery: 81.0,
        chapters: [
          Chapter(
            title: "Chapter 1: Nationalism in India",
            lessons: [
              Lesson(id: "ss-1-1", title: "1.1 First World War & Satyagraha", type: LessonType.video, isFree: true, duration: "18:40", videoType: VideoType.socialMap),
              Lesson(id: "ss-1-2", title: "1.2 Differing Strands within Movement", type: LessonType.video, isFree: false, duration: "22:50", videoType: VideoType.socialMap),
            ],
          ),
        ],
      ),
    ];
  }
}
