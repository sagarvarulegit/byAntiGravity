import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';
import '../widgets/interactive_whiteboard_canvas.dart';
import '../utils/download.dart';

class LessonsView extends StatefulWidget {
  final UserState userState;
  final List<Subject> subjects;
  final String activeSubjectId;
  final Function(String) onSubjectChanged;
  final Function(String) onLessonCompleted;
  final Function(String) onDownloadToggled;
  final VoidCallback onUpgradeClicked;

  const LessonsView({
    super.key,
    required this.userState,
    required this.subjects,
    required this.activeSubjectId,
    required this.onSubjectChanged,
    required this.onLessonCompleted,
    required this.onDownloadToggled,
    required this.onUpgradeClicked,
  });

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  Lesson? _selectedLesson;
  bool _isPlaying = false;
  double _videoProgress = 0.0;
  int _currentTime = 0;
  int _totalDuration = 180; // 3 mins mock duration
  Timer? _videoTimer;
  String _selectedQuality = "720p";
  bool _isDownloading = false;
  double _downloadPct = 0.0;
  String _downloadStatusText = "";

  @override
  void initState() {
    super.initState();
    _loadFirstLesson();
  }

  @override
  void didUpdateWidget(covariant LessonsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeSubjectId != widget.activeSubjectId) {
      _loadFirstLesson();
    }
  }

  @override
  void dispose() {
    _videoTimer?.cancel();
    super.dispose();
  }

  void _loadFirstLesson() {
    final activeSub = widget.subjects.firstWhere((s) => s.id == widget.activeSubjectId);
    if (activeSub.chapters.isNotEmpty && activeSub.chapters[0].lessons.isNotEmpty) {
      _selectLesson(activeSub.chapters[0].lessons[0]);
    }
  }

  void _selectLesson(Lesson lesson) {
    setState(() {
      _selectedLesson = lesson;
      _isPlaying = false;
      _videoProgress = 0.0;
      _currentTime = 0;
      _videoTimer?.cancel();
    });
  }

  void _togglePlayback() {
    if (_selectedLesson == null) return;
    final isUnlocked = _selectedLesson!.isFree || widget.userState.isPremium;
    if (!isUnlocked) {
      widget.onUpgradeClicked();
      return;
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _videoTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_currentTime < _totalDuration) {
            _currentTime++;
            _videoProgress = _currentTime / _totalDuration;
          } else {
            _isPlaying = false;
            _videoTimer?.cancel();
            widget.onLessonCompleted(_selectedLesson!.id);
          }
        });
      });
    } else {
      _videoTimer?.cancel();
    }
  }

  void _simulateDownload() {
    if (_selectedLesson == null) return;
    if (widget.userState.downloadedLessons.contains(_selectedLesson!.id)) {
      // Remove download
      widget.onDownloadToggled(_selectedLesson!.id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Video file removed from local encrypted storage.")),
      );
      return;
    }

    setState(() {
      _isDownloading = true;
      _downloadPct = 0.0;
      _downloadStatusText = "Connecting to HLS CDN...";
    });

    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        _downloadPct += 0.2;
        if (_downloadPct >= 1.0) {
          timer.cancel();
          _isDownloading = false;
          widget.onDownloadToggled(_selectedLesson!.id);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("HLS Video downloaded successfully for offline study!")),
          );
        } else if (_downloadPct >= 0.8) {
          _downloadStatusText = "Encrypting segments with AES-128 keys...";
        } else if (_downloadPct >= 0.5) {
          _downloadStatusText = "Saving TS segments locally...";
        } else if (_downloadPct >= 0.2) {
          _downloadStatusText = "Caching manifest.m3u8 ladder...";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth > 800;

    final activeSubject = widget.subjects.firstWhere((s) => s.id == widget.activeSubjectId);

    // Responsive panel splits
    Widget bodyContent = isWide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chapters Panel (Left)
              SizedBox(
                width: 300,
                child: _buildChaptersPanel(activeSubject, isDark),
              ),
              const SizedBox(width: 24),
              // Player Panel (Right)
              Expanded(
                child: _buildPlayerPanel(isDark),
              ),
            ],
          )
        : Column(
            children: [
              // Mini Player
              _buildPlayerPanel(isDark),
              const SizedBox(height: 16),
              // Chapters List
              SizedBox(
                height: 350,
                child: _buildChaptersPanel(activeSubject, isDark),
              ),
            ],
          );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject header filter tabs
            Row(
              children: widget.subjects.map((sub) {
                final bool isActive = sub.id == widget.activeSubjectId;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(sub.name),
                    selected: isActive,
                    onSelected: (val) {
                      if (val) widget.onSubjectChanged(sub.id);
                    },
                    selectedColor: AppColors.purple,
                    labelStyle: TextStyle(
                      color: isActive ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Expanded(child: bodyContent),
          ],
        ),
      ),
      // Caching downloads overlay bubble
      floatingActionButton: _isDownloading
          ? Card(
              color: isDark ? AppColors.cardDark : Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Container(
                width: 260,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2.5, valueColor: AlwaysStoppedAnimation(AppColors.green)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Caching Video...",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _downloadStatusText,
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildChaptersPanel(Subject subject, bool isDark) {
    return ListView.builder(
      itemCount: subject.chapters.length,
      itemBuilder: (context, index) {
        final chapter = subject.chapters[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
              child: Text(
                chapter.title.toUpperCase(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            ...chapter.lessons.map((lesson) {
              final bool isSelected = _selectedLesson?.id == lesson.id;
              final bool isDownloaded = widget.userState.downloadedLessons.contains(lesson.id);

              Color cardBg = isDark ? AppColors.cardDark : Colors.white;
              if (isSelected) {
                cardBg = isDark ? AppColors.purpleDark.withOpacity(0.3) : AppColors.purpleLight;
              }

              IconData statusIcon = Icons.lock_rounded;
              Color iconColor = Colors.grey;
              if (lesson.isFree) {
                statusIcon = Icons.play_arrow_rounded;
                iconColor = AppColors.green;
              } else if (widget.userState.isPremium) {
                statusIcon = Icons.play_arrow_rounded;
                iconColor = AppColors.purple;
              }

              return Card(
                elevation: 0,
                color: cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? AppColors.purple : (isDark ? AppColors.borderDark : AppColors.borderLight),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _selectLesson(lesson),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.purple : (isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isSelected ? Icons.play_arrow_rounded : statusIcon,
                            color: isSelected ? Colors.white : iconColor,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lesson.title,
                                style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lesson.type == LessonType.video ? "🎥 Video • ${lesson.duration}" : "📄 Notes",
                                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                                  ),
                                  if (isDownloaded)
                                    const Text(
                                      "✓ Offline",
                                      style: TextStyle(color: AppColors.green, fontSize: 9, fontWeight: FontWeight.bold),
                                    )
                                  else if (lesson.isFree)
                                    const Text(
                                      "FREE",
                                      style: TextStyle(color: AppColors.green, fontSize: 9, fontWeight: FontWeight.bold),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildPlayerPanel(bool isDark) {
    if (_selectedLesson == null) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Text("Select a lesson to start learning"),
          ),
        ),
      );
    }

    final isUnlocked = _selectedLesson!.isFree || widget.userState.isPremium;
    final isDownloaded = widget.userState.downloadedLessons.contains(_selectedLesson!.id);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_selectedLesson!.type == LessonType.video) ...[
            // Interactive Video Player Wrapper
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  alignment: Alignment.center,
                children: [
                  // Vector Canvas graphics loop
                  if (isUnlocked)
                    InteractiveWhiteboardCanvas(
                      videoType: _selectedLesson!.videoType,
                      isPlaying: _isPlaying,
                    ),

                  // Black blur overlay if premium locked
                  if (!isUnlocked)
                    Container(
                      color: Colors.black.withOpacity(0.85),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.lock_rounded, color: AppColors.orange, size: 48),
                          const SizedBox(height: 12),
                          const Text(
                            "Premium Syllabus Video",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Unlock full explanation lectures, interactive animations, and offline downloads.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white60, fontSize: 12),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: widget.onUpgradeClicked,
                            icon: const Icon(Icons.star_rounded),
                            label: const Text("Go Premium"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      ),
                    ),

                  // Centered play overlay button
                  if (isUnlocked && !_isPlaying)
                    GestureDetector(
                      onTap: _togglePlayback,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.purple.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 36),
                      ),
                    ),

                  // Bottom Controls bar
                  if (isUnlocked)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.black.withOpacity(0.6),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: _togglePlayback,
                              icon: Icon(_isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
                              color: Colors.white,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "${_formatTime(_currentTime)} / ${_formatTime(_totalDuration)}",
                              style: const TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 3,
                                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                                ),
                                child: Slider(
                                  value: _videoProgress,
                                  onChanged: (val) {
                                    setState(() {
                                      _videoProgress = val;
                                      _currentTime = (val * _totalDuration).toInt();
                                    });
                                  },
                                  activeColor: AppColors.purple,
                                  inactiveColor: Colors.white30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Quality selection
                            DropdownButton<String>(
                              value: _selectedQuality,
                              dropdownColor: Colors.black,
                              underline: Container(),
                              icon: const Icon(Icons.settings_rounded, color: Colors.white, size: 16),
                              items: ["1080p", "720p", "480p", "360p"].map((q) {
                                return DropdownMenuItem(
                                  value: q,
                                  child: Text(
                                    q,
                                    style: const TextStyle(color: Colors.white, fontSize: 11),
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _selectedQuality = val;
                                  });
                                }
                              },
                            ),
                            const SizedBox(width: 12),
                            // Download button
                             IconButton(
                              onPressed: _simulateDownload,
                              icon: Icon(isDownloaded ? Icons.check_circle_rounded : Icons.arrow_circle_down_rounded),
                              color: isDownloaded ? AppColors.green : Colors.white,
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              tooltip: "Download for Offline Study",
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ),
            const SizedBox(height: 20),
          ],
          
          // Meta details
          Row(
            children: [
              Text(
                _selectedLesson!.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
              ),
              if (_selectedLesson!.isFree) ...[
                const SizedBox(width: 12),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.greenLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "FREE",
                    style: TextStyle(color: AppColors.green, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Designed and aligned specifically with the latest CBSE 10th Board evaluation schemes to ensure thorough concept mastery.",
            style: TextStyle(color: Colors.grey, fontSize: 12.5),
          ),
          
          const SizedBox(height: 24),

          // Notes Revision Transcript Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white.withOpacity(0.02) : AppColors.bgLight,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.notes_rounded, color: AppColors.purple, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Revision Notes Transcript",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {
                          final note = _currentNoteLesson;
                          if (note != null && note.noteContent.isNotEmpty) {
                            downloadFile(note.noteContent, "${note.title.replaceAll(' ', '_')}.txt");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("PDF revision notes downloaded successfully.")),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("No notes available to download.")),
                            );
                          }
                        },
                        icon: const Icon(Icons.download_rounded, size: 14, color: AppColors.purple),
                        label: const Text("PDF Notes", style: TextStyle(color: AppColors.purple, fontSize: 12)),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildTextNotesContent(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Lesson? get _currentNoteLesson {
    return _selectedLesson;
  }

  Widget _buildTextNotesContent() {
    final noteLesson = _currentNoteLesson;
    if (noteLesson == null) return Container();

    // 1. If note content is populated dynamically, parse and render it (excluding s-1-3 mockup)
    if (noteLesson.noteContent.isNotEmpty && noteLesson.id != "s-1-3") {
      return _parseMarkdownNotes(noteLesson.noteContent);
    }
    
    // Clean mock rendering corresponding to selected lesson
    if (noteLesson.id.startsWith("m-1")) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("1. Fundamental Theorem of Arithmetic", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          const Text("Every composite number can be uniquely expressed (factorized) as a product of prime numbers, apart from their order.", style: TextStyle(fontSize: 13)),
          const SizedBox(height: 6),
          const Text("HCF(a, b) × LCM(a, b) = a × b.", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          
          _buildDoYouKnowBox(
            "The word Algorithm comes from the name of the 9th century Persian mathematician al-Khwarizmi. In fact, even the word 'algebra' is derived from his famous book Kitab al-jabr wa’l-muqabala."
          ),

          const Text("2. Rational & Irrational Numbers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          _buildBulletItem("Rational numbers have terminating or non-terminating repeating decimal expansions."),
          _buildBulletItem("Irrational numbers (like √2, √3, π) have non-terminating non-repeating decimal expansions."),
        ],
      );
    } else if (noteLesson.id.startsWith("s-1")) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quote Banner
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "“Facts are not science — as the dictionary is not literature.”",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      "— Martin H. Fischer",
                      style: TextStyle(
                        fontSize: 11,
                        color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Chapter Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CustomPaint(
                        painter: FlaskPainter(color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CHAPTER",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            height: 0.9,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "Chemical Reactions\nand Equations",
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFCBD5E1)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: CustomPaint(
                        painter: QRCodePainter(),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "1064CH01",
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 7,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Divider line
          Container(
            height: 3,
            margin: const EdgeInsets.only(top: 8, bottom: 24),
            color: AppColors.blue,
          ),

          // First paragraph with drop-cap C
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "C",
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  height: 0.85,
                  fontFamily: 'Georgia',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "onsider the following situations of daily life and think what happens when –",
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Bullets of daily situations
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 12),
            child: Column(
              children: [
                _buildBulletItem("milk is left at room temperature during summers."),
                _buildBulletItem("an iron tawa/pan/nail is left exposed to humid atmosphere."),
                _buildBulletItem("grapes get fermented."),
                _buildBulletItem("food is cooked."),
                _buildBulletItem("food gets digested in our body."),
                _buildBulletItem("we respire."),
              ],
            ),
          ),

          Text(
            "In all the above situations, the nature and the identity of the initial substance have somewhat changed. We have already learnt about physical and chemical changes of matter in our previous classes. Whenever a chemical change occurs, we can say that a chemical reaction has taken place.",
            style: TextStyle(fontSize: 13, height: 1.4, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
          ),
          const SizedBox(height: 12),
          Text(
            "You may perhaps be wondering as to what is actually meant by a chemical reaction. How do we come to know that a chemical reaction has taken place? Let us perform some activities to find the answer to these questions.",
            style: TextStyle(fontSize: 13, height: 1.4, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
          ),
          const SizedBox(height: 20),

          // Responsive Columns (Activity Box & Figure Box)
          LayoutBuilder(
            builder: (context, constraints) {
              final useRow = constraints.maxWidth > 650;
              final activityBox = _buildActivityBox(
                "Activity 1.1",
                "This Activity needs the teacher’s assistance. It would be better if students wear suitable eyeglasses.",
                [
                  "Clean a magnesium ribbon about 3-4 cm long by rubbing it with sandpaper.",
                  "Hold it with a pair of tongs. Burn it using a spirit lamp or burner and collect the ash so formed in a watch-glass as shown in Fig. 1.1. Burn the magnesium ribbon keeping it away as far as possible from your eyes.",
                  "What do you observe?"
                ],
              );
              final diagramBox = _buildFigureBox(isDark);

              if (useRow) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 7, child: activityBox),
                    const SizedBox(width: 20),
                    Expanded(flex: 5, child: diagramBox),
                  ],
                );
              } else {
                return Column(
                  children: [
                    activityBox,
                    const SizedBox(height: 16),
                    diagramBox,
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 24),

          Text(
            "2. Law of Conservation of Mass",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
          ),
          const SizedBox(height: 6),
          Text(
            "Matter can neither be created nor destroyed in a chemical reaction. Therefore, the total mass of reactants must equal the total mass of products.",
            style: TextStyle(fontSize: 13, height: 1.4, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
          ),

          _buildDoYouKnowBox(
            "A solution of slaked lime produced by the reaction of Calcium Oxide with water is used for whitewashing walls. Calcium hydroxide reacts slowly with the carbon dioxide in air to form a thin layer of calcium carbonate (CaCO₃) on the walls, giving them a shiny finish."
          ),
        ],
      );
    } else {
      String fallbackDescription = "Use these notes as revision guides to quickly recap terms, formulas, and diagrams tested in board formats.";
      if (_selectedLesson!.title.contains("1.1 The Fundamental Theorem")) {
        fallbackDescription = "This lesson covers the Fundamental Theorem of Arithmetic. Every composite number can be uniquely expressed as a product of primes.";
      } else if (_selectedLesson!.title.contains("1.2 Revisiting Irrational")) {
        fallbackDescription = "Proving numbers like √2, √3, √5 are irrational using the method of contradiction.";
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Syllabus Objective: ${_selectedLesson!.title}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          Text(fallbackDescription, style: const TextStyle(fontSize: 13)),
          if (_selectedLesson!.title.contains("1.1 The Fundamental Theorem")) ...[
            const SizedBox(height: 10),
            Container(padding: const EdgeInsets.all(10), color: Colors.blue.withOpacity(0.05), child: const Text("Formula: HCF(a,b) × LCM(a,b) = a × b", style: TextStyle(fontFamily: 'monospace', color: Colors.blue))),
          ]
        ],
      );
    }
  }

  Widget buildRichTextLine(String text, TextStyle baseStyle) {
    final parts = text.split('**');
    if (parts.length == 1) {
      return Text(text, style: baseStyle);
    }
    
    final List<TextSpan> spans = [];
    for (int i = 0; i < parts.length; i++) {
      final isBold = i % 2 == 1;
      spans.add(
        TextSpan(
          text: parts[i],
          style: baseStyle.copyWith(
            fontWeight: isBold ? FontWeight.bold : baseStyle.fontWeight,
          ),
        ),
      );
    }
    
    return Text.rich(TextSpan(children: spans), style: baseStyle);
  }

  String cleanMathText(String text) {
    return text
        .replaceAll(r'$$\text{HCF}(a, b) \times \text{LCM}(a, b) = a \times b$$', 'HCF(a, b) × LCM(a, b) = a × b')
        .replaceAll(r'$$\text{HCF}(p, q, r) \times \text{LCM}(p, q, r) \neq p \times q \times r$$', 'HCF(p, q, r) × LCM(p, q, r) ≠ p × q × r')
        .replaceAll(r'$\sqrt{2}$', '√2')
        .replaceAll(r'$\sqrt{3}$', '√3')
        .replaceAll(r'$\sqrt{5}$', '√5')
        .replaceAll(r'$x = p_1^{a_1} \cdot p_2^{a_2} \cdots p_n^{a_n}$', 'x = p₁ᵃ¹ · p₂ᵃ² ··· pₙᵃⁿ')
        .replaceAll(r'$p_1 < p_2 < \dots < p_n$', 'p₁ < p₂ < ... < pₙ')
        .replaceAll(r'$32760 = 2^3 \cdot 3^2 \cdot 5 \cdot 7 \cdot 13$', '32760 = 2³ · 3² · 5 · 7 · 13')
        .replaceAll(r'$\frac{p}{q}$', 'p/q')
        .replaceAll(r'$s$', 's')
        .replaceAll(r'$p$', 'p')
        .replaceAll(r'$a$', 'a')
        .replaceAll(r'$b$', 'b')
        .replaceAll(r'$c$', 'c')
        .replaceAll(r'$n$', 'n')
        .replaceAll(r'$q \neq 0$', 'q ≠ 0')
        .replaceAll(r'$b \neq 0$', 'b ≠ 0')
        .replaceAll(r'$a^2$', 'a²')
        .replaceAll(r'$b^2$', 'b²')
        .replaceAll(r'$2c^2$', '2c²')
        .replaceAll(r'$4c^2$', '4c²')
        .replaceAll(r'$2b^2 = a^2$', '2b² = a²')
        .replaceAll(r'$2b^2 = 4c^2 \implies b^2 = 2c^2$', '2b² = 4c² ⟹ b² = 2c²')
        .replaceAll(r'$5 - \sqrt{3}$', '5 - √3')
        .replaceAll(r'$3\sqrt{2}$', '3√2');
  }

  Widget _buildDoYouKnowBoxWithTitle({
    required String title,
    required String text,
    required String type,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color boxColor;
    Color borderColor;
    Color titleColor;
    
    if (type == "warning") {
      boxColor = isDark ? Colors.red.withOpacity(0.1) : const Color(0xFFFEF2F2);
      borderColor = Colors.red;
      titleColor = Colors.red;
    } else if (type == "caution") {
      boxColor = isDark ? Colors.amber.withOpacity(0.1) : const Color(0xFFFFFBEB);
      borderColor = Colors.amber;
      titleColor = Colors.amber[800]!;
    } else { // note
      boxColor = isDark ? AppColors.orangeDark.withOpacity(0.15) : AppColors.orangeLight;
      borderColor = AppColors.orange;
      titleColor = AppColors.orange;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: boxColor,
        border: Border(
          top: BorderSide(color: borderColor, width: 4),
          left: BorderSide(color: borderColor.withOpacity(0.3)),
          right: BorderSide(color: borderColor.withOpacity(0.3)),
          bottom: BorderSide(color: borderColor.withOpacity(0.3)),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              fontFamily: 'Outfit',
            ),
          ),
          const SizedBox(height: 8),
          buildRichTextLine(
            text,
            const TextStyle(fontSize: 12.5, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _parseMarkdownNotes(String content) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lines = content.split('\n');
    final List<Widget> children = [];
    
    String currentAlert = "";
    List<String> currentAlertLines = [];
    
    bool inCodeBlock = false;
    List<String> codeBlockLines = [];

    void flushAlert() {
      if (currentAlertLines.isNotEmpty) {
        final alertText = currentAlertLines.join('\n');
        children.add(_buildDoYouKnowBoxWithTitle(
          title: currentAlert.toUpperCase(),
          text: alertText,
          type: currentAlert,
        ));
        currentAlert = "";
        currentAlertLines.clear();
      }
    }

    void flushCodeBlock() {
      if (codeBlockLines.isNotEmpty) {
        final codeText = codeBlockLines.join('\n');
        children.add(
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.black38 : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isDark ? Colors.white10 : Colors.grey[300]!),
            ),
            child: Text(
              codeText,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
        );
        inCodeBlock = false;
        codeBlockLines.clear();
      }
    }

    for (var rawLine in lines) {
      var line = rawLine.trim();

      if (line.startsWith('```')) {
        if (inCodeBlock) {
          flushCodeBlock();
        } else {
          flushAlert();
          inCodeBlock = true;
        }
        continue;
      }

      if (inCodeBlock) {
        codeBlockLines.add(rawLine);
        continue;
      }

      if (line.startsWith('>')) {
        final alertHeaderMatch = RegExp(r'^>\s*\[!(NOTE|WARNING|CAUTION)\]').firstMatch(line);
        if (alertHeaderMatch != null) {
          flushAlert();
          currentAlert = alertHeaderMatch.group(1)!.toLowerCase();
          continue;
        }
        
        if (currentAlert.isNotEmpty) {
          var alertLine = line.replaceFirst(RegExp(r'^>\s*'), '');
          currentAlertLines.add(cleanMathText(alertLine));
          continue;
        }
      } else if (currentAlert.isNotEmpty) {
        flushAlert();
      }

      if (line.startsWith('# ')) {
        final text = cleanMathText(line.substring(2));
        children.add(Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22, 
              fontWeight: FontWeight.bold, 
              fontFamily: 'Outfit',
              color: AppColors.blue,
            ),
          ),
        ));
      } else if (line.startsWith('## ')) {
        final text = cleanMathText(line.substring(3));
        children.add(Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  fontFamily: 'Outfit',
                  color: AppColors.purple,
                ),
              ),
              Container(
                height: 2,
                margin: const EdgeInsets.only(top: 4, bottom: 8),
                color: isDark ? AppColors.purple.withOpacity(0.4) : AppColors.purple.withOpacity(0.2),
              ),
            ],
          ),
        ));
      } else if (line.startsWith('### ')) {
        final text = cleanMathText(line.substring(4));
        children.add(Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 6),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold, 
              fontFamily: 'Outfit',
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ));
      } else if (line == '---') {
        children.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(color: isDark ? AppColors.borderDark : AppColors.borderLight, height: 1),
        ));
      } else if (line.startsWith('- ') || line.startsWith('* ')) {
        final text = cleanMathText(line.substring(2));
        children.add(Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 5,
                margin: const EdgeInsets.only(right: 8, top: 7),
                decoration: const BoxDecoration(
                  color: AppColors.purple,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: buildRichTextLine(
                  text, 
                  TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
                ),
              ),
            ],
          ),
        ));
      } else if (RegExp(r'^\d+\.\s').hasMatch(line)) {
        final dotIndex = line.indexOf('.');
        final number = line.substring(0, dotIndex + 1);
        final text = cleanMathText(line.substring(dotIndex + 2));
        children.add(Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$number ",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.purple),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: buildRichTextLine(
                  text, 
                  TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
                ),
              ),
            ],
          ),
        ));
      } else if (line.isNotEmpty) {
        final text = cleanMathText(rawLine);
        children.add(Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: buildRichTextLine(
            text, 
            TextStyle(
              fontSize: 13, 
              height: 1.4, 
              color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary,
            ),
          ),
        ));
      }
    }

    flushAlert();
    flushCodeBlock();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildActivityBox(String title, String cautionText, List<String> items) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blueDark.withOpacity(0.2) : AppColors.blueLight,
        border: Border.all(color: AppColors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF08A),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF713F12),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (cautionText.isNotEmpty) ...[
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "CAUTION: ",
                    style: TextStyle(
                      color: AppColors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: cautionText,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.only(right: 10, top: 6),
                      color: AppColors.purple,
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 12.5),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildDoYouKnowBox(String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.orangeDark.withOpacity(0.15) : AppColors.orangeLight,
        border: Border(
          top: const BorderSide(color: AppColors.orange, width: 4),
          left: BorderSide(color: AppColors.orange.withOpacity(0.3)),
          right: BorderSide(color: AppColors.orange.withOpacity(0.3)),
          bottom: BorderSide(color: AppColors.orange.withOpacity(0.3)),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Do You Know?",
            style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              fontFamily: 'Outfit',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 12.5, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 10, top: 6),
            color: AppColors.purple,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12.5),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final int m = seconds ~/ 60;
    final int s = seconds % 60;
    return "$m:${s < 10 ? '0' : ''}$s";
  }

  Widget _buildFigureBox(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            child: CustomPaint(
              painter: MagnesiumBurnerPainter(isDark: isDark),
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Figure 1.1 ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, fontFamily: 'Georgia'),
                ),
                TextSpan(
                  text: "Burning of a magnesium ribbon in air and collection of magnesium oxide in a watch-glass",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 10.5,
                    color: isDark ? Colors.white70 : Colors.black87,
                    fontFamily: 'Georgia',
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FlaskPainter extends CustomPainter {
  final Color color;
  FlaskPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.35, size.height * 0.1)
      ..lineTo(size.width * 0.65, size.height * 0.1)
      ..moveTo(size.width * 0.4, size.height * 0.1)
      ..lineTo(size.width * 0.4, size.height * 0.35)
      ..lineTo(size.width * 0.15, size.height * 0.85)
      ..arcToPoint(
        Offset(size.width * 0.85, size.height * 0.85),
        radius: const Radius.circular(80),
        clockwise: false,
      )
      ..lineTo(size.width * 0.6, size.height * 0.35)
      ..lineTo(size.width * 0.6, size.height * 0.1);

    canvas.drawPath(path, paint);

    final fluidPaint = Paint()
      ..color = color.withOpacity(0.4)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    final fluidPath = Path()
      ..moveTo(size.width * 0.23, size.height * 0.7)
      ..lineTo(size.width * 0.77, size.height * 0.7);
    canvas.drawPath(fluidPath, fluidPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class QRCodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0F172A);
    // top left
    canvas.drawRect(const Rect.fromLTWH(2, 2, 10, 10), paint);
    canvas.drawRect(const Rect.fromLTWH(4, 4, 6, 6), Paint()..color = Colors.white);
    canvas.drawRect(const Rect.fromLTWH(5, 5, 4, 4), paint);

    // top right
    canvas.drawRect(Rect.fromLTWH(size.width - 12, 2, 10, 10), paint);
    canvas.drawRect(Rect.fromLTWH(size.width - 10, 4, 6, 6), Paint()..color = Colors.white);
    canvas.drawRect(Rect.fromLTWH(size.width - 9, 5, 4, 4), paint);

    // bottom left
    canvas.drawRect(Rect.fromLTWH(2, size.height - 12, 10, 10), paint);
    canvas.drawRect(Rect.fromLTWH(4, size.height - 10, 6, 6), Paint()..color = Colors.white);
    canvas.drawRect(Rect.fromLTWH(5, size.height - 9, 4, 4), paint);

    final rand = math.Random(1064);
    for (int y = 2; y < size.height - 2; y += 2) {
      for (int x = 2; x < size.width - 2; x += 2) {
        if (x < 12 && y < 12) continue;
        if (x > size.width - 12 && y < 12) continue;
        if (x < 12 && y > size.height - 12) continue;
        
        if (rand.nextBool()) {
          canvas.drawRect(Rect.fromLTWH(x.toDouble(), y.toDouble(), 2, 2), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MagnesiumBurnerPainter extends CustomPainter {
  final bool isDark;
  MagnesiumBurnerPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = isDark ? Colors.white24 : Colors.black12
      ..strokeWidth = 1.5;
    
    canvas.drawLine(Offset(10, size.height - 20), Offset(size.width - 10, size.height - 20), linePaint);

    final burnerPaint = Paint()..color = const Color(0xFF64748B);
    final burnerBasePaint = Paint()..color = const Color(0xFF475569);
    
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(26, 165, 24, 6), const Radius.circular(1.5)),
      burnerBasePaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(31, 130, 14, 35), const Radius.circular(2)),
      burnerPaint,
    );
    canvas.drawRect(const Rect.fromLTWH(36, 122, 4, 8), burnerBasePaint);
    
    final Path capPath = Path()
      ..moveTo(33, 122)
      ..lineTo(43, 122)
      ..lineTo(38, 116)
      ..close();
    canvas.drawPath(capPath, burnerBasePaint);

    final flamePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0284C7), Color(0xFFF97316), Color(0xFFEAB308)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(const Rect.fromLTWH(34, 80, 8, 36));
    
    final Path flamePath = Path()
      ..moveTo(38, 116)
      ..quadraticBezierTo(30, 100, 38, 80)
      ..quadraticBezierTo(46, 100, 38, 116)
      ..close();
    canvas.drawPath(flamePath, flamePaint);

    final watchGlassPaint = Paint()
      ..color = isDark ? Colors.white24 : Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final watchGlassFill = Paint()
      ..color = (isDark ? Colors.white : Colors.black).withOpacity(0.04)
      ..style = PaintingStyle.fill;
      
    final Rect watchGlassRect = Rect.fromLTRB(85, 145, 165, 168);
    canvas.drawArc(watchGlassRect, 0, math.pi, false, watchGlassPaint);
    canvas.drawArc(watchGlassRect, 0, math.pi, true, watchGlassFill);

    final pilePaint = Paint()..color = const Color(0xFFF8FAFC);
    final pileBorder = Paint()
      ..color = const Color(0xFFCBD5E1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
      
    final Path pilePath = Path()
      ..moveTo(110, 158)
      ..quadraticBezierTo(125, 148, 140, 158)
      ..close();
    canvas.drawPath(pilePath, pilePaint);
    canvas.drawPath(pilePath, pileBorder);
    
    canvas.drawCircle(const Offset(116, 158), 1.5, Paint()..color = const Color(0xFFF1F5F9));
    canvas.drawCircle(const Offset(124, 157), 2, Paint()..color = const Color(0xFFF8FAFC));
    canvas.drawCircle(const Offset(131, 158), 1.5, Paint()..color = const Color(0xFFE2E8F0));

    final tongPaint = Paint()
      ..color = const Color(0xFF475569)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    
    final handPaint = Paint()..color = const Color(0xFFFFEDD5);
    final handBorder = Paint()
      ..color = const Color(0xFFF97316)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
      
    final Path handPath = Path()
      ..moveTo(215, 110)
      ..quadraticBezierTo(219, 102, 230, 110)
      ..lineTo(250, 113)
      ..lineTo(250, 122)
      ..lineTo(228, 122)
      ..close();
    canvas.drawPath(handPath, handPaint);
    canvas.drawPath(handPath, handBorder);

    final pivotPaint = Paint()..color = const Color(0xFF334155);
    
    canvas.drawPath(
      Path()
        ..moveTo(225, 113)
        ..quadraticBezierTo(165, 115, 105, 125)
        ..lineTo(88, 127),
      tongPaint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(227, 117)
        ..quadraticBezierTo(165, 117, 105, 129)
        ..lineTo(88, 127),
      tongPaint,
    );
    canvas.drawCircle(const Offset(160, 116), 2, pivotPaint);

    final ribbonPaint = Paint()
      ..color = const Color(0xFF94A3B8)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(88, 127), const Offset(44, 115), ribbonPaint);

    final glowPaint = Paint()
      ..color = const Color(0xFFFEF08A).withOpacity(0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
    canvas.drawCircle(const Offset(44, 115), 12, glowPaint);

    final sparkPaint = Paint()..color = Colors.white;
    final Path starPath = Path()
      ..moveTo(44, 115)
      ..lineTo(40, 108)
      ..lineTo(44, 100)
      ..lineTo(48, 108)
      ..close()
      ..moveTo(44, 115)
      ..lineTo(50, 111)
      ..lineTo(59, 115)
      ..lineTo(50, 119)
      ..close()
      ..moveTo(44, 115)
      ..lineTo(48, 121)
      ..lineTo(44, 129)
      ..lineTo(40, 121)
      ..close()
      ..moveTo(44, 115)
      ..lineTo(38, 119)
      ..lineTo(29, 115)
      ..lineTo(38, 111)
      ..close();
    canvas.drawPath(starPath, sparkPaint);

    final pointerPaint = Paint()
      ..color = isDark ? Colors.white60 : Colors.black87
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    
    _drawPointer(canvas, const Offset(20, 150), const Offset(31, 150), pointerPaint);
    _drawText(canvas, "Burner", const Offset(2, 144), isDark);

    _drawPointer(canvas, const Offset(175, 90), const Offset(175, 114), pointerPaint);
    _drawText(canvas, "Tong", const Offset(168, 80), isDark);

    _drawPointer(canvas, const Offset(120, 95), const Offset(70, 120), pointerPaint);
    _drawText(canvas, "Magnesium ribbon", const Offset(105, 85), isDark);

    _drawPointer(canvas, const Offset(185, 145), const Offset(148, 157), pointerPaint);
    _drawText(canvas, "Watch-glass", const Offset(190, 140), isDark);

    _drawPointer(canvas, const Offset(170, 172), const Offset(128, 158), pointerPaint);
    _drawText(canvas, "Magnesium oxide", const Offset(175, 166), isDark);
  }

  void _drawPointer(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    final double dx = p2.dx - p1.dx;
    final double dy = p2.dy - p1.dy;
    final double dist = math.sqrt(dx * dx + dy * dy);
    const double dashLen = 2.0;
    const double spaceLen = 2.0;
    final double steps = dist / (dashLen + spaceLen);
    
    for (int i = 0; i < steps; i++) {
      final double t1 = i / steps;
      final double t2 = (i + dashLen / (dashLen + spaceLen)) / steps;
      canvas.drawLine(
        Offset(p1.dx + dx * t1, p1.dy + dy * t1),
        Offset(p1.dx + dx * t2, p1.dy + dy * t2),
        paint,
      );
    }
  }

  void _drawText(Canvas canvas, String text, Offset position, bool isDark) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 8.5,
          color: isDark ? Colors.white60 : Colors.black87,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
