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
            noteContent: lessonJson['note_content'] as String? ?? '',
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
              Lesson(id: "m-1-1", title: "1.1 The Fundamental Theorem of Arithmetic", type: LessonType.video, isFree: true, duration: "16:00", videoType: VideoType.mathGraph),
              Lesson(id: "m-1-2", title: "1.2 Revisiting Irrational Numbers", type: LessonType.video, isFree: true, duration: "19:40", videoType: VideoType.mathGraph),
              Lesson(
                id: "m-1-3", 
                title: "Revision Notes: Real Numbers", 
                type: LessonType.note, 
                isFree: true,
                noteContent: r"""# Chapter 1: Real Numbers

## 1. Introduction & Rationalized Syllabus
In Class X, the syllabus covers the key properties of positive integers:
1. **The Fundamental Theorem of Arithmetic**: Deals with the multiplication of positive integers.
2. **Revisiting Irrational Numbers**: Proving numbers like $\sqrt{2}$, $\sqrt{3}$, $\sqrt{5}$ are irrational.

> [!NOTE]
> **Syllabus Update**: Euclid's Division Lemma (including Euclid's Division Algorithm for HCF) has been **removed** from the latest rationalized CBSE Class 10 Mathematics syllabus.

---

## 2. The Fundamental Theorem of Arithmetic
**Theorem 1.1**: Every composite number can be expressed (factorized) as a product of primes, and this factorization is unique, apart from the order in which the prime factors occur.

The prime factorization of a natural number is unique, except for the order of its factors.

### Expressing Numbers in Ascending Order:
Given a composite number $x$, we write $x = p_1^{a_1} \cdot p_2^{a_2} \cdots p_n^{a_n}$ where $p_1 < p_2 < \dots < p_n$ are prime factors.
- **Example**: $32760 = 2^3 \cdot 3^2 \cdot 5 \cdot 7 \cdot 13$

### Important Relationship:
For any two positive integers $a$ and $b$:
$$\text{HCF}(a, b) \times \text{LCM}(a, b) = a \times b$$

> [!WARNING]
> This property **does not hold** for three or more numbers! For three integers $p, q, r$:
> $$\text{HCF}(p, q, r) \times \text{LCM}(p, q, r) \neq p \times q \times r$$

---

## 3. Finding HCF and LCM (Prime Factorization Method)
- **HCF (Highest Common Factor)**: Product of the **smallest power** of each common prime factor in the numbers.
- **LCM (Lowest Common Multiple)**: Product of the **greatest power** of each prime factor involved in the numbers.

### Worked Example:
Find HCF and LCM of $6$ and $20$.
- $6 = 2^1 \times 3^1$
- $20 = 2^2 \times 5^1$
- **HCF** = $2^1 = 2$
- **LCM** = $2^2 \times 3^1 \times 5^1 = 60$
- **Verification**: $\text{HCF}(6, 20) \times \text{LCM}(6, 20) = 2 \times 60 = 120 = 6 \times 20$.

---

## 4. Revisiting Irrational Numbers
A number $s$ is called **irrational** if it cannot be written in the form $\frac{p}{q}$, where $p$ and $q$ are integers and $q \neq 0$.

**Theorem 1.2**: Let $p$ be a prime number. If $p$ divides $a^2$, then $p$ divides $a$, where $a$ is a positive integer.

**Theorem 1.3**: $\sqrt{2}$ is irrational.

### Proof by Contradiction (Overview):
1. Assume $\sqrt{2}$ is rational, so $\sqrt{2} = \frac{a}{b}$ where $a, b$ are coprime integers ($b \neq 0$).
2. Squaring both sides: $2b^2 = a^2$, meaning $2$ divides $a^2 \implies 2$ divides $a$.
3. Write $a = 2c$, so $2b^2 = 4c^2 \implies b^2 = 2c^2$, meaning $2$ divides $b^2 \implies 2$ divides $b$.
4. Thus $a$ and $b$ share a common factor $2$, contradicting that they are coprime.
5. Hence, our assumption is false; $\sqrt{2}$ is irrational.

---

## 5. Operations on Real Numbers
1. The sum or difference of a rational number and an irrational number is **irrational**. (e.g., $5 - \sqrt{3}$)
2. The product and quotient of a non-zero rational and irrational number is **irrational**. (e.g., $3\sqrt{2}$)""",
              ),
            ],
          ),
          Chapter(
            title: "Chapter 2: Polynomials",
            lessons: [
              Lesson(id: "m-2-1", title: "2.1 Geometrical Meaning of Zeroes", type: LessonType.video, isFree: true, duration: "22:15", videoType: VideoType.mathGraph),
              Lesson(id: "m-2-2", title: "2.2 Relationship of Coefficients", type: LessonType.video, isFree: true, duration: "15:40", videoType: VideoType.mathGraph),
              Lesson(
                id: "m-2-3", 
                title: "Revision Notes: Polynomials", 
                type: LessonType.note, 
                isFree: true,
                noteContent: r"""# Chapter 2: Polynomials

## 1. Introduction & Key Terminology
A polynomial $p(x)$ in $x$ is an algebraic expression where powers of $x$ are non-negative integers.
- **Degree of Polynomial**: The highest power of $x$ in $p(x)$.
- **Linear Polynomial**: A polynomial of degree $1$ (e.g., $2x - 3$, general form $ax + b$).
- **Quadratic Polynomial**: A polynomial of degree $2$ (e.g., $x^2 - 3x - 4$, general form $ax^2 + bx + c$).
- **Cubic Polynomial**: A polynomial of degree $3$ (e.g., $x^3 - 4x$, general form $ax^3 + bx^2 + cx + d$).

A real number $k$ is called a **zero** of a polynomial $p(x)$ if $p(k) = 0$.
- **Linear Polynomial Zero**: For $p(x) = ax + b$, the zero is $k = -\frac{b}{a}$.

---

## 2. Geometrical Meaning of Zeroes
The zeroes of a polynomial $p(x)$ are precisely the **x-coordinates of the points where the graph of $y = p(x)$ intersects the x-axis**.

### Geometrical Shapes:
1. **Linear ($ax + b$)**: Graph is a straight line intersecting the x-axis at exactly one point: $(-\frac{b}{a}, 0)$.
2. **Quadratic ($ax^2 + bx + c$)**: Graph is a U-shaped curve called a **parabola**. It opens **upwards** if $a > 0$ and **downwards** if $a < 0$.
   - **Case 1 (Two Zeroes)**: The parabola intersects the x-axis at two distinct points.
   - **Case 2 (One Zero)**: The parabola touches the x-axis at exactly one point (two coincident points).
   - **Case 3 (No Zero)**: The parabola is completely above or below the x-axis and does not touch it.

> [!NOTE]
> A polynomial of degree $n$ has **at most $n$ zeroes**. Geometrically, the curve intersects the x-axis at at most $n$ points.

---

## 3. Relationship between Zeroes and Coefficients
For a quadratic polynomial $p(x) = ax^2 + bx + c$ with zeroes $\alpha$ and $\beta$:
- **Sum of Zeroes**:
  $$\alpha + \beta = -\frac{b}{a} = -\frac{\text{Coefficient of } x}{\text{Coefficient of } x^2}$$
- **Product of Zeroes**:
  $$\alpha\beta = \frac{c}{a} = \frac{\text{Constant term}}{\text{Coefficient of } x^2}$$

### Constructing a Quadratic Polynomial:
If the sum ($S$) and product ($P$) of zeroes are known, the quadratic polynomial is:
$$x^2 - Sx + P = x^2 - (\alpha + \beta)x + \alpha\beta$$

---

## 4. Cubic Polynomials
For a cubic polynomial $p(x) = ax^3 + bx^2 + cx + d$ with zeroes $\alpha$, $\beta$, and $\gamma$:
- **Sum of Zeroes**: $\alpha + \beta + \gamma = -\frac{b}{a}$
- **Sum of products taken two at a time**: $\alpha\beta + \beta\gamma + \gamma\alpha = \frac{c}{a}$
- **Product of Zeroes**: $\alpha\beta\gamma = -\frac{d}{a}$

---

## 5. Worked Examples
### Example A (Find zeroes and verify):
Find the zeroes of $x^2 + 7x + 10$ and verify the relationship.
- Factorize: $x^2 + 7x + 10 = (x + 2)(x + 5)$
- Zeroes: $x = -2$ and $x = -5$.
- **Sum Verification**: $(-2) + (-5) = -7 = -\frac{7}{1} = -\frac{b}{a}$.
- **Product Verification**: $(-2) \times (-5) = 10 = \frac{10}{1} = \frac{c}{a}$.

### Example B (Construct polynomial):
Find a quadratic polynomial whose sum and product of zeroes are $\frac{1}{4}$ and $-1$ respectively.
- Using $x^2 - Sx + P$:
  $$x^2 - \frac{1}{4}x - 1 = \frac{4x^2 - x - 4}{4}$$
- A fitting polynomial is $4x^2 - x - 4$."""
              ),
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
              Lesson(
                id: "s-1-3", 
                title: "Revision Notes: Chemical Reactions", 
                type: LessonType.note, 
                isFree: true,
                noteContent: r"""# Chapter 1: Chemical Reactions and Equations

## Core Concepts
A chemical reaction is a process in which one or more substances, the reactants, are converted to one or more different substances, the products.

### Daily Life Observations of Chemical Changes:
- **Rusting of Iron**: When iron is exposed to moist air for a long period, it acquires a coating of a brown flaky substance called rust.
- **Souring of Milk**: Milk left at room temperature during summers gets soured due to lactic acid fermentation.
- **Digestion of Food**: Complex food molecules are broken down into simpler substances in our digestive system.
- **Respiration**: Oxygen is used to break down glucose into carbon dioxide, water, and energy.

### Activity 1.1: Magnesium Ribbon Combustion
*Caution: This activity needs the teacher’s assistance. It would be better if students wear eye protection.*
1. Clean a magnesium ribbon about 2 cm long by rubbing it with sandpaper.
2. Hold it with a pair of tongs. Burn it using a spirit lamp or burner and collect the ash so formed in a watch-glass.
3. Burn the magnesium ribbon keeping it as far as possible from your eyes.

**Observation**: You will observe that the magnesium ribbon burns with a dazzling white flame and changes into a white powder. This powder is **magnesium oxide (MgO)**. It is formed due to the reaction between magnesium and oxygen present in the air.

```
2Mg + O2 --> 2MgO
```
""",
              ),
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
