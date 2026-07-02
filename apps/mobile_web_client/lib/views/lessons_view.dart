import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../models.dart';
import '../theme.dart';
import '../services/database_service.dart';
import '../widgets/interactive_whiteboard_canvas.dart';
import '../widgets/video_player_widget.dart';
import '../widgets/confetti_overlay.dart';
import '../widgets/comic_recap.dart';
import '../utils/download.dart';
import '../widgets/jargon_modal.dart';
import '../widgets/interactive_example.dart';
import '../widgets/question_card.dart';
import '../widgets/animated_svg/animated_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LessonsView extends StatefulWidget {
  final DatabaseService dbService;
  final UserState userState;
  final List<Subject> subjects;
  final String activeSubjectId;
  final Function(String) onSubjectChanged;
  final Function(String lessonId, int watchTimeSeconds, {bool completed}) onLessonCompleted;
  final Function(String) onDownloadToggled;
  final VoidCallback onUpgradeClicked;
  final String? initialLessonId;
  final VoidCallback? onInitialLessonLoaded;

  const LessonsView({
    super.key,
    required this.dbService,
    required this.userState,
    required this.subjects,
    required this.activeSubjectId,
    required this.onSubjectChanged,
    required this.onLessonCompleted,
    required this.onDownloadToggled,
    required this.onUpgradeClicked,
    this.initialLessonId,
    this.onInitialLessonLoaded,
  });

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  Lesson? _selectedLesson;
  bool _isPlaying = false;

  String _getVideoUrl(Lesson lesson) {
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006') {
      return 'videos/01_introduction.mp4?v=2'; // cache-buster for Todd's voice
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010') {
      return 'videos/02_potential_difference.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007') {
      return 'videos/03_ohms_law.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380011') {
      return 'videos/04_conventional_vs_electron_flow.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380012') {
      return 'videos/05_ammeter_voltmeter.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380013') {
      return 'videos/08_ohms_law_verification.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380014') {
      return 'videos/06_resistance_factors.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380015') {
      return 'videos/09_series_parallel_simplification.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380016') {
      return 'videos/10_parallel_resistance_trap.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380017') {
      return 'videos/07_heating_effect_fuse.mp4?v=2';
    }
    if (lesson.id == 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380018') {
      return 'videos/11_commercial_energy_billing.mp4?v=2';
    }
    return lesson.videoHlsUrl ?? '';
  }
  double _videoProgress = 0.0;
  int _currentTime = 0;
  int _totalDuration = 180; // 3 mins mock duration
  Timer? _videoTimer;
  String _selectedQuality = "720p";
  bool _isDownloading = false;
  double _downloadPct = 0.0;
  String _downloadStatusText = "";

  String _currentNoteContent = "";
  bool _isLoadingNote = false;
  bool _isMastered = false;

  @override
  void initState() {
    super.initState();
    _loadInitialLesson();
  }

  @override
  void didUpdateWidget(covariant LessonsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialLessonId != null && widget.initialLessonId != oldWidget.initialLessonId) {
      _loadInitialLesson();
    } else if (oldWidget.activeSubjectId != widget.activeSubjectId) {
      _loadFirstLesson();
    }
  }

  @override
  void dispose() {
    _videoTimer?.cancel();
    if (_selectedLesson != null && _selectedLesson!.type == LessonType.video && _currentTime > 0) {
      widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: false);
    }
    super.dispose();
  }

  void _loadFirstLesson() {
    final activeSub = widget.subjects.firstWhere((s) => s.id == widget.activeSubjectId);
    if (activeSub.chapters.isNotEmpty && activeSub.chapters[0].lessons.isNotEmpty) {
      _selectLesson(activeSub.chapters[0].lessons[0]);
    }
  }

  void _loadInitialLesson() {
    if (widget.initialLessonId != null) {
      Lesson? lesson;
      for (final subject in widget.subjects) {
        for (final chapter in subject.chapters) {
          for (final l in chapter.lessons) {
            if (l.id == widget.initialLessonId) {
              lesson = l;
              break;
            }
          }
          if (lesson != null) break;
        }
        if (lesson != null) break;
      }
      if (lesson != null) {
        _selectLesson(lesson);
        if (widget.onInitialLessonLoaded != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onInitialLessonLoaded?.call();
          });
        }
        return;
      }
    }
    _loadFirstLesson();
  }

  void _selectLesson(Lesson lesson) {
    if (_selectedLesson != null && _selectedLesson!.id != lesson.id && _selectedLesson!.type == LessonType.video && _currentTime > 0) {
      widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: false);
    }

    setState(() {
      _selectedLesson = lesson;
      _isPlaying = false;
      _videoProgress = 0.0;
      _currentTime = 0;
      _videoTimer?.cancel();
      _currentNoteContent = "";
      _isMastered = false;
    });

    if (lesson.type == LessonType.note || lesson.type == LessonType.studyGuide) {
      _fetchNoteContent(lesson.id);
    }
  }

  Future<void> _fetchNoteContent(String lessonId) async {
    setState(() {
      _isLoadingNote = true;
    });
    try {
      final content = await widget.dbService.fetchLessonNoteContent(lessonId);
      if (mounted && _selectedLesson?.id == lessonId) {
        setState(() {
          _currentNoteContent = content;
          _isLoadingNote = false;
        });
      }
    } catch (e) {
      if (mounted && _selectedLesson?.id == lessonId) {
        setState(() {
          _isLoadingNote = false;
        });
      }
    }
  }

  void _togglePlayback() {
    if (_selectedLesson == null) return;
    final isUnlocked = true; // _selectedLesson!.isFree || widget.userState.isPremium;
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
            widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: true);
          }
        });
      });
    } else {
      _videoTimer?.cancel();
      widget.onLessonCompleted(_selectedLesson!.id, _currentTime, completed: false);
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
                            isSelected ? (lesson.type == LessonType.video ? Icons.play_arrow_rounded : (lesson.type == LessonType.studyGuide ? Icons.menu_book_rounded : Icons.article_rounded)) : statusIcon,
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
                                    lesson.type == LessonType.video ? "🎥 Video • ${lesson.duration}" : (lesson.type == LessonType.studyGuide ? "📚 Study Guide" : "📄 Notes"),
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

    final isUnlocked = true; // _selectedLesson!.isFree || widget.userState.isPremium;
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
                  // Vector Canvas graphics loop or Real Video Player
                  if (isUnlocked)
                    _getVideoUrl(_selectedLesson!).isNotEmpty
                        ? VideoPlayerWidget(
                            videoUrl: _getVideoUrl(_selectedLesson!),
                            onVideoCompleted: () {
                              widget.onLessonCompleted(_selectedLesson!.id, 0, completed: true);
                            },
                          )
                        : InteractiveWhiteboardCanvas(
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
                  if (isUnlocked && !_isPlaying && _getVideoUrl(_selectedLesson!).isEmpty)
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
                  if (isUnlocked && _getVideoUrl(_selectedLesson!).isEmpty)
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
                          if (note != null && _currentNoteContent.isNotEmpty) {
                            downloadFile(_currentNoteContent, "${note.title.replaceAll(' ', '_')}.txt");
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
          ),

          // Mark as Mastered button
          const SizedBox(height: 28),
          Center(
            child: SizedBox(
              width: 260,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _isMastered
                    ? null
                    : () {
                        // Record completion
                        widget.onLessonCompleted(
                          _selectedLesson!.id,
                          0,
                          completed: true,
                        );
                        setState(() {
                          _isMastered = true;
                        });
                        // Show confetti overlay dialog
                        showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          barrierDismissible: false,
                          builder: (ctx) {
                            return ConfettiOverlay(
                              onComplete: () {
                                Navigator.of(ctx).pop();
                              },
                            );
                          },
                        );
                      },
                icon: Icon(
                  _isMastered ? Icons.check_circle_rounded : Icons.emoji_events_rounded,
                  size: 22,
                ),
                label: Text(
                  _isMastered ? '✓ Mastered' : 'Mark as Mastered',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Outfit',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isMastered
                      ? AppColors.green
                      : const Color(0xFFBE185D),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: AppColors.green,
                  disabledForegroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: _isMastered ? 0 : 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Lesson? get _currentNoteLesson {
    return _selectedLesson;
  }

  Widget _buildTextNotesContent() {
    if (_isLoadingNote) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
          highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 180,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 280,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final noteLesson = _currentNoteLesson;
    if (noteLesson == null) return Container();

    if (_currentNoteContent.isNotEmpty) {
      return _parseMarkdownNotes(_currentNoteContent);
    }

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

  Widget _buildMathText(String text, [TextStyle? style]) {
    final displayParts = text.split(r'$$');
    if (displayParts.length == 1) {
      return _buildInlineMathText(displayParts[0], style);
    }

    final List<Widget> children = [];
    for (int i = 0; i < displayParts.length; i++) {
      final part = displayParts[i];
      if (i % 2 == 1) {
        // Display math → render inside a Formula Card
        children.add(_buildFormulaCard(part, style));
      } else {
        if (part.isNotEmpty) {
          children.add(_buildInlineMathText(part, style));
        }
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  /// Formula Card: blue gradient container with copy button for display math.
  Widget _buildFormulaCard(String latex, [TextStyle? style]) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: Color(0xFF3B82F6), width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text('📐', style: TextStyle(fontSize: 14)),
                  SizedBox(width: 6),
                  Text(
                    'Formula',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B82F6),
                      fontFamily: 'Outfit',
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 28,
                height: 28,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 16,
                  icon: const Icon(Icons.copy, color: Color(0xFF3B82F6)),
                  tooltip: 'Copy formula',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: latex));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Formula copied to clipboard'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Math.tex(
                latex,
                mathStyle: MathStyle.display,
                textStyle: style,
                onErrorFallback: (err) => Text(latex, style: style),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Info / Tip Box: amber callout for [INFO:...] or [TIP:...] markers.
  Widget _buildInfoTipBox(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: Color(0xFFF59E0B), width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('💡', style: TextStyle(fontSize: 14)),
              SizedBox(width: 6),
              Text(
                'Did You Know?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB45309),
                  fontFamily: 'Outfit',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildMathText(
            text,
            const TextStyle(fontSize: 12.5, height: 1.4, color: Color(0xFF78350F)),
          ),
        ],
      ),
    );
  }

  Widget _buildInlineMathText(String text, [TextStyle? style]) {
    final inlineParts = text.split('\$');
    if (inlineParts.length == 1) {
      return _buildNormalTextWithBold(inlineParts[0], style);
    }

    final List<InlineSpan> spans = [];
    for (int i = 0; i < inlineParts.length; i++) {
      final part = inlineParts[i];
      if (i % 2 == 1) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Math.tex(
              part,
              mathStyle: MathStyle.text,
              textStyle: style,
              onErrorFallback: (err) => Text(part, style: style),
            ),
          ),
        );
      } else {
        if (part.isNotEmpty) {
          final boldParts = part.split('**');
          for (int j = 0; j < boldParts.length; j++) {
            final boldPart = boldParts[j];
            final isBold = j % 2 == 1;
            final boldStyle = (style ?? const TextStyle()).copyWith(
              fontWeight: isBold ? FontWeight.bold : style?.fontWeight,
            );
            spans.addAll(parseJargonMarkers(boldPart, context, boldStyle));
          }
        }
      }
    }

    return Text.rich(TextSpan(children: spans), style: style);
  }

  Widget _buildNormalTextWithBold(String text, [TextStyle? style]) {
    final boldParts = text.split('**');
    if (boldParts.length == 1) {
      return Text.rich(TextSpan(children: parseJargonMarkers(text, context, style)), style: style);
    }

    final List<InlineSpan> spans = [];
    for (int i = 0; i < boldParts.length; i++) {
      final isBold = i % 2 == 1;
      final boldStyle = (style ?? const TextStyle()).copyWith(
        fontWeight: isBold ? FontWeight.bold : style?.fontWeight,
      );
      spans.addAll(parseJargonMarkers(boldParts[i], context, boldStyle));
    }
    return Text.rich(TextSpan(children: spans), style: style);
  }

  String _formatSubscripts(String text) {
    final Map<String, String> subscriptMap = {
      '0': '₀',
      '1': '₁',
      '2': '₂',
      '3': '₃',
      '4': '₄',
      '5': '₅',
      '6': '₆',
      '7': '₇',
      '8': '₈',
      '9': '₉',
      'n': 'ₙ',
      'i': 'ᵢ',
      'j': 'ⱼ',
      'x': 'ₓ',
      'y': 'ᵧ',
    };

    final parts = text.split('\$');
    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        var part = parts[i];
        // 1. Chemical formulas: Element symbol followed by optional underscore and digit(s)
        part = part.replaceAllMapped(RegExp(r'([A-Z][a-z]?)_?(\d+)'), (match) {
          final element = match.group(1)!;
          final digits = match.group(2)!;
          final subscriptDigits = digits.split('').map((d) => subscriptMap[d] ?? d).join('');
          return '$element$subscriptDigits';
        });

        // 2. Math/general subscripts: Variable name followed by underscore and a single subscript character
        part = part.replaceAllMapped(RegExp(r'([a-zA-Z])_([0-9nixy])'), (match) {
          final variable = match.group(1)!;
          final sub = match.group(2)!;
          return '$variable${subscriptMap[sub] ?? sub}';
        });

        parts[i] = part;
      }
    }
    return parts.join('\$');
  }

  Widget _buildJargonCalloutCard(String term, String definition, String example, bool isDark) {
    final bgColor = isDark 
        ? const Color(0xFF0F2E3D) 
        : const Color(0xFFE6F4FA);
    final borderColor = isDark 
        ? const Color(0xFF0284C7).withOpacity(0.4) 
        : const Color(0xFFB3E5FC);
    final termColor = isDark 
        ? const Color(0xFF38BDF8) 
        : const Color(0xFF0284C7);
    final textColor = isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary;
    final subTextColor = isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary;
    final fontStyle = const TextStyle(
      fontFamily: 'Georgia',
      fontSize: 13.5,
      height: 1.45,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.menu_book_rounded,
                color: termColor,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      term,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: termColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildMathText(
                      definition,
                      fontStyle.copyWith(color: textColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (example.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? Colors.black12 : Colors.white70,
                borderRadius: BorderRadius.circular(8),
                border: Border(
                  left: BorderSide(
                    color: termColor.withOpacity(0.6),
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Example",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                      fontSize: 11.5,
                      color: termColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildMathText(
                    example,
                    fontStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      color: subTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChapterOpenerHeader(String fullTitle, bool isDark) {
    final regex = RegExp(r'^(Chapter\s+\d+):\s*(.+)$', caseSensitive: false);
    final match = regex.firstMatch(fullTitle);
    
    String chapterLabel = "Chapter";
    String titleText = fullTitle;
    
    if (match != null) {
      chapterLabel = match.group(1)!;
      titleText = match.group(2)!;
    }

    final accentColor = AppColors.blue; // NCERT Sky Blue
    
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 28),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Flask icon & Chapter Number block
          Column(
            children: [
              // Flask icon
              Container(
                width: 48,
                height: 48,
                child: CustomPaint(
                  painter: FlaskPainter(color: accentColor),
                ),
              ),
              const SizedBox(height: 10),
              // Chapter Number badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.purple, // NCERT Magenta
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  chapterLabel.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Outfit',
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Middle: Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Text(
                  titleText,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Outfit',
                    color: accentColor,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 40,
                  height: 3,
                  color: AppColors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Right: QR Code mimicking textbook
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(2),
                child: CustomPaint(
                  painter: QRCodePainter(),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "NCERT",
                style: TextStyle(
                  fontSize: 7.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Outfit',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String cleanMathText(String text) {
    final cleaned = text
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
    return _formatSubscripts(cleaned);
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
          _buildMathText(
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

    bool inRevision = false;
    bool inComic = false;
    List<String>? revisionLines;
    List<String>? comicLines;

    bool inExample = false;
    bool inSolution = false;
    String exampleTitle = "";
    List<String> exampleQuestionLines = [];
    List<String> exampleSolutionLines = [];
    int exampleCount = 0;

    bool inQuestionsSection = false;
    List<String> questionBlockLines = [];
    int questionCount = 0;

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

    bool inActivity = false;
    String activityTitle = "";
    String activityCaution = "";
    List<String> activitySteps = [];

    void flushActivity() {
      if (inActivity) {
        children.add(_buildActivityBox(activityTitle, activityCaution, activitySteps));
        inActivity = false;
        activityTitle = "";
        activityCaution = "";
        activitySteps.clear();
      }
    }

    void flushExample() {
      if (inExample) {
        final qText = exampleQuestionLines.join('\n');
        final sText = exampleSolutionLines.join('\n');
        children.add(InteractiveExample(
          title: exampleTitle,
          questionWidget: _buildMathText(qText, TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary, height: 1.4)),
          solutionWidget: _buildMathText(sText, TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary, height: 1.4)),
        ));
        inExample = false;
        inSolution = false;
        exampleTitle = "";
        exampleQuestionLines.clear();
        exampleSolutionLines.clear();
      }
    }

    void flushQuestions() {
      if (questionBlockLines.isNotEmpty) {
        List<String> currentQ = [];
        List<String> currentA = [];
        bool inAnswer = false;
        
        void flushSingleQ() {
          if (currentQ.isNotEmpty) {
            children.add(QuestionCard(
              questionWidget: _buildMathText(currentQ.join('\n'), TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary, height: 1.4)),
              answerWidget: _buildMathText(currentA.join('\n'), TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary, height: 1.4)),
            ));
            questionCount++;
            currentQ.clear();
            currentA.clear();
          }
        }

        for (var rawQLine in questionBlockLines) {
          var line = rawQLine.trim();
          if (line.startsWith('* ') && !line.startsWith('*Answer:*')) {
            line = '• ${line.substring(2)}';
          }
          
          if (RegExp(r'^\*\*\d+\.').hasMatch(line)) {
            flushSingleQ();
            inAnswer = false;
            currentQ.add(line);
          } else if (line.startsWith('*Answer:*')) {
            inAnswer = true;
            currentA.add('**Answer:** ${line.replaceFirst('*Answer:*', '').trim()}');
          } else if (inAnswer) {
            currentA.add(line);
          } else {
            currentQ.add(line);
          }
        }
        flushSingleQ();
        questionBlockLines.clear();
        inQuestionsSection = false;
      }
    }

    for (var rawLine in lines) {
      var line = rawLine.trim();

      // Strip blockquote '>' prefix if it is not an alert block header and not inside an active alert
      final bool isAlertHeader = RegExp(r'^>\s*\[!(NOTE|WARNING|CAUTION)\]', caseSensitive: false).hasMatch(line);
      if (line.startsWith('>') && !isAlertHeader && currentAlert.isEmpty) {
        line = line.substring(1).trim();
        rawLine = rawLine.replaceFirst(RegExp(r'^\s*>\s?'), '');
      }

      // Check for figures (explicit tags or fallback auto-injections)
      bool hasFigure = false;
      String? figType;

      final figRegex = RegExp(r'\[FIGURE(?::\s*([a-zA-Z0-9_-]+))?\]');
      final figMatch = figRegex.firstMatch(line);
      if (figMatch != null) {
        hasFigure = true;
        figType = figMatch.group(1) ?? 'magnesium_burner';
        line = line.replaceAll(figRegex, '').trim();
        rawLine = rawLine.replaceAll(figRegex, '');
      }

      if (line.contains('Magnesium burns with a bright white flame')) {
        hasFigure = true;
        figType ??= 'magnesium_burner';
      }

      if (line.contains('Gas bubbles (Hydrogen')) {
        hasFigure = true;
        figType = 'zinc_acid';
      }

      if (line.startsWith('**Example ')) {
        flushActivity();
        flushExample();
        flushQuestions();
        inExample = true;
        inSolution = false;
        exampleCount++;
        exampleTitle = line.replaceAll('**', '').trim();
        continue;
      }

      if (inExample) {
        if (line.startsWith('**Solution:**')) {
          inSolution = true;
          continue;
        }
        if (line.isEmpty) {
          if (inSolution && exampleSolutionLines.isNotEmpty) {
             flushExample();
          }
          continue;
        }
        if (line.startsWith('## ') || line.startsWith('---') || line == '**❓ QUESTIONS**' || line == '**❓ IN-TEXT QUESTIONS**') {
          flushExample();
        } else {
          if (inSolution) {
            exampleSolutionLines.add(cleanMathText(rawLine));
          } else {
            exampleQuestionLines.add(cleanMathText(rawLine));
          }
          continue;
        }
      }

      if (line == '**❓ QUESTIONS**' || line == '**❓ IN-TEXT QUESTIONS**') {
        flushActivity();
        flushExample();
        flushQuestions();
        inQuestionsSection = true;
        continue;
      }

      if (inQuestionsSection) {
        if (line.startsWith('---') || line.startsWith('## ')) {
          flushQuestions();
        } else {
          if (line.isNotEmpty) {
            questionBlockLines.add(cleanMathText(rawLine));
          }
          continue;
        }
      }

      if (line.startsWith('*Caution:') || (line.startsWith('*') && line.toLowerCase().contains('caution'))) {
        var cautionText = line.replaceAll('*', '').trim();
        if (cautionText.toLowerCase().startsWith('caution:')) {
          cautionText = cautionText.substring(8).trim();
        }
        children.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.orange.withValues(alpha: 0.1) : Colors.orange.shade50,
              border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('COMMON PITFALL', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 4),
                      Text(cautionText, style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, height: 1.5, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          )
        );
        continue;
      }

      if (line.startsWith('### Activity')) {
        flushExample();
        flushQuestions();
        if (inRevision && revisionLines != null) {
          children.add(_buildRevisionWidget(revisionLines, isDark));
          revisionLines = null;
          inRevision = false;
        }
        if (inComic && comicLines != null) {
          children.add(_buildComicRecapWidget(comicLines, isDark));
          comicLines = null;
          inComic = false;
        }
        flushActivity();
        inActivity = true;
        activityTitle = line.substring(4).trim();
        continue;
      }

      if (inActivity) {
        if (line.startsWith('*Caution:') || line.startsWith('Caution:') || (line.startsWith('*') && line.toLowerCase().contains('caution'))) {
          var caution = line.replaceAll('*', '').trim();
          if (caution.toLowerCase().startsWith('caution:')) {
            caution = caution.substring(8).trim();
          }
          activityCaution = caution;
          continue;
        } else if (RegExp(r'^\d+\.\s').hasMatch(line)) {
          final dotIndex = line.indexOf('.');
          activitySteps.add(cleanMathText(line.substring(dotIndex + 1).trim()));
          continue;
        } else if (line.isEmpty) {
          continue;
        } else {
          flushActivity();
        }
      }

      if (!inCodeBlock) {
        if (line.startsWith('## ') || line.startsWith('# ')) {
          flushExample();
          flushQuestions();
          if (inRevision && revisionLines != null) {
            children.add(_buildRevisionWidget(revisionLines, isDark));
            revisionLines = null;
            inRevision = false;
          }
          if (inComic && comicLines != null) {
            children.add(_buildComicRecapWidget(comicLines, isDark));
            comicLines = null;
            inComic = false;
          }
          flushActivity();

          if (line.contains('One-Minute Revision')) {
            inRevision = true;
            revisionLines = [];
            continue;
          } else if (line.contains('Comic Recap')) {
            inComic = true;
            comicLines = [];
            continue;
          }
        }
      }

      if (inRevision) {
        revisionLines!.add(rawLine);
        continue;
      }

      if (inComic) {
        comicLines!.add(rawLine);
        continue;
      }

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
        children.add(_buildChapterOpenerHeader(text, isDark));
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
                child: _buildMathText(
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
                child: _buildMathText(
                  text, 
                  TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
                ),
              ),
            ],
          ),
        ));
      } else if (line.isNotEmpty) {
        // Check for [INFO:...] or [TIP:...] markers
        final infoTipMatch = RegExp(r'^\[(INFO|TIP):(.+)\]$').firstMatch(line);
        if (infoTipMatch != null) {
          final infoText = cleanMathText(infoTipMatch.group(2)!.trim());
          children.add(_buildInfoTipBox(infoText));
        } else {
          final text = cleanMathText(line);
          if (text.trim().isNotEmpty) {
            children.add(Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildMathText(
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
      }

      if (hasFigure && figType != null) {
        children.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: _buildFigureBox(figType, isDark),
        ));
      }
    }

    if (inRevision && revisionLines != null) {
      children.add(_buildRevisionWidget(revisionLines, isDark));
    }
    if (inComic && comicLines != null) {
      children.add(_buildComicRecapWidget(comicLines, isDark));
    }
    flushActivity();
    flushExample();
    flushQuestions();

    flushAlert();
    flushCodeBlock();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildRevisionWidget(List<String> lines, bool isDark) {
    final List<Widget> items = [];
    
    for (var rawLine in lines) {
      var line = rawLine.trim();
      if (line.isEmpty) continue;
      
      if (line.startsWith('- ') || line.startsWith('* ')) {
        final text = cleanMathText(line.substring(2));
        items.add(Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 5,
                margin: const EdgeInsets.only(right: 8, top: 7),
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: _buildMathText(
                  text, 
                  TextStyle(fontSize: 13, color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary),
                ),
              ),
            ],
          ),
        ));
      } else {
        final text = cleanMathText(rawLine);
        items.add(Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: _buildMathText(
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
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F291B) : const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: Color(0xFF22C55E), width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🔄', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Text(
                'Quick Revision',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFF4ADE80) : const Color(0xFF15803D),
                  fontFamily: 'Outfit',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _buildComicRecapWidget(List<String> lines, bool isDark) {
    final List<ComicPanel> panels = [];
    String rememberThisText = "";
    bool inRememberThis = false;
    
    String currentSpeaker = "";
    String currentText = "";

    void flushCurrentDialogue() {
      if (currentSpeaker.isNotEmpty && currentText.isNotEmpty) {
        var cleanedText = currentText.trim();
        final speakerPrefix = "$currentSpeaker:";
        if (cleanedText.startsWith(speakerPrefix)) {
          cleanedText = cleanedText.substring(speakerPrefix.length).trim();
        }
        
        if (cleanedText.startsWith('"') && cleanedText.endsWith('"')) {
          cleanedText = cleanedText.substring(1, cleanedText.length - 1).trim();
        } else if (cleanedText.startsWith("'") && cleanedText.endsWith("'")) {
          cleanedText = cleanedText.substring(1, cleanedText.length - 1).trim();
        }
        
        if (cleanedText.startsWith('"') && cleanedText.endsWith('"')) {
          cleanedText = cleanedText.substring(1, cleanedText.length - 1).trim();
        }
        
        panels.add(ComicPanel(speaker: currentSpeaker, text: cleanedText));
        currentSpeaker = "";
        currentText = "";
      }
    }

    for (var rawLine in lines) {
      var line = rawLine.trim();
      if (line.startsWith('```') || line.isEmpty) continue;
      
      var cleanedLine = rawLine
          .replaceAll(RegExp(r'[│┌└├┤┐┘─┬┴┼────────────]'), '')
          .trim();
      
      if (cleanedLine.isEmpty) continue;
      
      if (cleanedLine.contains('📌 REMEMBER THIS!')) {
        flushCurrentDialogue();
        inRememberThis = true;
        continue;
      }
      
      if (inRememberThis) {
        if (rememberThisText.isNotEmpty) {
          rememberThisText += "\n";
        }
        rememberThisText += cleanedLine;
        continue;
      }
      
      final speakerMatch = RegExp(r'^(.*?)\*\*(.*?):\*\*\s*(.*)$').firstMatch(cleanedLine);
      if (speakerMatch != null) {
        flushCurrentDialogue();
        final emoji = speakerMatch.group(1)?.trim() ?? '';
        final name = speakerMatch.group(2)?.trim() ?? '';
        currentSpeaker = emoji.isNotEmpty ? "$emoji $name" : name;
        currentText = speakerMatch.group(3)?.trim() ?? '';
      } else if (cleanedLine.startsWith('Priya:') || cleanedLine.startsWith('Rahul:')) {
        flushCurrentDialogue();
        final colonIndex = cleanedLine.indexOf(':');
        currentSpeaker = cleanedLine.substring(0, colonIndex).trim();
        currentText = cleanedLine.substring(colonIndex + 1).trim();
      } else if (cleanedLine.startsWith('PANEL')) {
        continue;
      } else {
        if (currentSpeaker.isNotEmpty) {
          if (currentText.isNotEmpty && !currentText.endsWith(' ')) {
            currentText += " ";
          }
          currentText += cleanedLine;
        }
      }
    }
    flushCurrentDialogue();

    final rememberThisWidget = _buildRememberThisWidget(rememberThisText, isDark);

    return ComicRecap(
      panels: panels,
      rememberThis: rememberThisWidget,
    );
  }

  Widget _buildRememberThisWidget(String text, bool isDark) {
    final lines = text.split('\n');
    final List<Widget> children = [];
    
    for (var line in lines) {
      var trimmed = line.trim();
      if (trimmed.isEmpty) continue;
      
      bool hasMath = trimmed.contains('*') || 
                     trimmed.contains('×') || 
                     trimmed.contains('/') || 
                     trimmed.contains('=') || 
                     trimmed.contains('√') || 
                     trimmed.contains(r'\times') || 
                     trimmed.contains(r'\frac');
                     
      if (hasMath) {
        String latex = trimmed;
        latex = latex.replaceAll('*', r'\times');
        latex = latex.replaceAll('×', r'\times');
        
        latex = latex.replaceAllMapped(RegExp(r'(-?)([a-zA-Z0-9]+)/([a-zA-Z0-9]+)'), (match) {
          final sign = match.group(1) ?? '';
          final num = match.group(2)!;
          final den = match.group(3)!;
          return '$sign\\frac{$num}{$den}';
        });
        
        latex = latex.replaceAll('Sum', r'\text{Sum}');
        latex = latex.replaceAll('Product', r'\text{Product}');
        latex = latex.replaceAll('HCF', r'\text{HCF}');
        latex = latex.replaceAll('LCM', r'\text{LCM}');
        
        if (latex.endsWith('.')) {
          latex = latex.substring(0, latex.length - 1);
        }

        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Math.tex(
              latex,
              mathStyle: MathStyle.text,
              textStyle: TextStyle(
                fontSize: 14.5,
                color: isDark ? AppColors.orange : AppColors.orangeDark,
                fontWeight: FontWeight.bold,
              ),
              onErrorFallback: (err) => Text(
                trimmed,
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 14.0,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary,
                ),
              ),
            ),
          ),
        );
      } else {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              trimmed,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 14.0,
                height: 1.4,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary,
              ),
            ),
          ),
        );
      }
    }
    
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
          ...items.map((item) => _buildBulletItem(item)).toList(),
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

  Widget _buildFigureBox(String figType, bool isDark) {
    CustomPainter? painterWidget;
    String? svgPath;
    String figNum;
    String figCaption;
    double figHeight = 180;

    if (figType == 'double_circulation') {
      svgPath = "assets/double_circulation.svg";
      figNum = "Figure 5.1 ";
      figCaption = "Schematic representation of double circulation in human beings, showing separation of oxygenated (red) and deoxygenated (blue) blood routes.";
      figHeight = 280;
    } else if (figType == 'neuron') {
      svgPath = "assets/neuron.svg";
      figNum = "Figure 6.1 ";
      figCaption = "Structure of a typical motor neuron showing dendrites, cell body with nucleus, axon, myelin sheath, and nerve endings.";
      figHeight = 220;
    } else if (figType == 'prism_dispersion') {
      svgPath = "assets/prism_dispersion.svg";
      figNum = "Figure 10.1 ";
      figCaption = "Dispersion of white light through a triangular glass prism, splitting it into a spectrum of seven colors (VIBGYOR).";
      figHeight = 200;
    } else if (figType == 'bar_magnet_field') {
      svgPath = "assets/bar_magnet_field.svg";
      figNum = "Figure 12.1 ";
      figCaption = "Magnetic field lines around a bar magnet, demonstrating closed loops emerging from the North Pole (N) and entering the South Pole (S).";
      figHeight = 200;
    } else if (figType == 'trophic_levels') {
      svgPath = "assets/trophic_levels.svg";
      figNum = "Figure 13.1 ";
      figCaption = "Trophic level pyramid representing the unidirectional flow of energy and the 10% law of energy transfer in an ecosystem.";
      figHeight = 220;
    } else if (figType == 'ohms_law_circuit') {
      svgPath = "assets/ohms_law_circuit.svg";
      figNum = "Figure 11.5 ";
      figCaption = "Circuit diagram for verification of Ohm's Law showing the voltmeter connected in parallel across the resistor, and ammeter, key, rheostat, and battery in series.";
      figHeight = 220;
    } else if (figType == 'circuit_symbols') {
      svgPath = "assets/circuit_symbols.svg";
      figNum = "Figure 11.1 ";
      figCaption = "Standard symbols used in electric circuit diagrams.";
      figHeight = 250;
    } else if (figType == 'basic_circuit') {
      svgPath = "assets/basic_circuit.svg";
      figNum = "Figure 11.2 ";
      figCaption = "A schematic diagram of an electric circuit comprising – cell, electric bulb, ammeter and plug key.";
      figHeight = 200;
    } else if (figType == 'series_circuit') {
      svgPath = "assets/series_circuit.svg";
      figNum = "Figure 11.3 ";
      figCaption = "Resistors connected in series. The current (I) is constant throughout the circuit.";
      figHeight = 220;
    } else if (figType == 'parallel_circuit') {
      svgPath = "assets/parallel_circuit.svg";
      figNum = "Figure 11.4 ";
      figCaption = "Resistors connected in parallel. The potential difference (V) across all resistors is the same.";
      figHeight = 240;
    } else if (figType == 'combination_reaction') {
      svgPath = "assets/combination_animated.svg";
      figNum = "Figure 1.2 ";
      figCaption = "Quicklime (calcium oxide) reacts vigorously with water to produce slaked lime (calcium hydroxide) in an exothermic combination reaction.";
      figHeight = 220;
    } else if (figType == 'ferrous_sulphate_decomposition') {
      svgPath = "assets/ferrous_sulphate_decomposition_animated.svg";
      figNum = "Figure 1.3 ";
      figCaption = "Thermal decomposition of ferrous sulphate crystals. Green crystals turn white/brownish and emit choking SO₂/SO₃ gases.";
      figHeight = 180;
    } else if (figType == 'lead_nitrate_decomposition') {
      svgPath = "assets/lead_nitrate_decomposition_animated.svg";
      figNum = "Figure 1.4 ";
      figCaption = "Thermal decomposition of lead nitrate resulting in the emission of brown nitrogen dioxide (NO₂) fumes.";
      figHeight = 180;
    } else if (figType == 'decomposition_reaction') {
      svgPath = "assets/decomposition_reaction_animated.svg";
      figNum = "Figure 1.5 ";
      figCaption = "Decomposition of calcium carbonate to calcium oxide and carbon dioxide on heating.";
      figHeight = 180;
    } else if (figType == 'electrolysis_of_water') {
      svgPath = "assets/electrolysis_of_water_animated.svg";
      figNum = "Figure 1.6 ";
      figCaption = "Electrolytic decomposition of water. Acidified water is decomposed into hydrogen (at cathode, double volume) and oxygen (at anode).";
      figHeight = 220;
    } else if (figType == 'silver_chloride_sunlight') {
      svgPath = "assets/silver_chloride_sunlight_animated.svg";
      figNum = "Figure 1.7 ";
      figCaption = "Photolytic decomposition of silver chloride. White silver chloride turns grey in sunlight, yielding silver metal and chlorine gas.";
      figHeight = 180;
    } else if (figType == 'displacement_reaction') {
      svgPath = "assets/displacement_reaction_animated.svg";
      figNum = "Figure 1.8 ";
      figCaption = "Displacement reaction. Iron nail dipped in blue copper sulphate solution becomes brownish, and the solution fades to light green.";
      figHeight = 180;
    } else if (figType == 'zinc_acid') {
      svgPath = "assets/zinc_acid_animated.svg";
      figNum = "Figure 1.2 ";
      figCaption = "Formation of hydrogen gas by the action of dilute sulphuric acid on zinc";
      figHeight = 220;
    } else {
      svgPath = "assets/magnesium_burner_animated.svg";
      figNum = "Figure 1.1 ";
      figCaption = "Burning of a magnesium ribbon in air and collection of magnesium oxide in a watch-glass";
      figHeight = 180;
    }

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
          Center(
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 360.0,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: svgPath != null
                    ? LayoutBuilder(
                        builder: (context, constraints) {
                          return buildAnimatedSvg(
                            svgPath: svgPath!,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            isDark: isDark,
                          );
                        },
                      )
                    : CustomPaint(
                        painter: painterWidget,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: figNum,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, fontFamily: 'Georgia'),
                ),
                TextSpan(
                  text: figCaption,
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

class DoubleCirculationPainter extends CustomPainter {
  final bool isDark;
  DoubleCirculationPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color borderColor = isDark ? Colors.white30 : Colors.black26;
    final Color labelColor = isDark ? Colors.white70 : Colors.black87;
    final Color blueColor = const Color(0xFF0284C7);
    final Color redColor = const Color(0xFFE11D48);

    final Color lungsBg = isDark ? Colors.teal.withOpacity(0.15) : const Color(0xFFF0FDFA);
    final Color lungsBorder = isDark ? Colors.teal.withOpacity(0.5) : const Color(0xFF99F6E4);

    final Color bodyBg = isDark ? Colors.orange.withOpacity(0.15) : const Color(0xFFFFF7ED);
    final Color bodyBorder = isDark ? Colors.orange.withOpacity(0.5) : const Color(0xFFFED7AA);

    final Color heartBg = isDark ? Colors.white.withOpacity(0.05) : const Color(0xFFF8FAFC);

    _drawLegend(canvas, const Offset(10, 10), "Deoxygenated (CO₂ Rich)", blueColor);
    _drawLegend(canvas, Offset(size.width - 150, 10), "Oxygenated (O₂ Rich)", redColor);

    // Lungs Box
    final RRect lungsRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.275, size.height * 0.06, size.width * 0.45, size.height * 0.12),
      const Radius.circular(8),
    );
    canvas.drawRRect(lungsRect, Paint()..color = lungsBg);
    canvas.drawRRect(lungsRect, Paint()..color = lungsBorder..style = PaintingStyle.stroke..strokeWidth = 1.2);
    _drawText(canvas, "LUNGS", Offset(size.width * 0.5, size.height * 0.095), labelColor, fontSize: 10, isBold: true);
    _drawText(canvas, "Gaseous Exchange (Capillaries)", Offset(size.width * 0.5, size.height * 0.135), labelColor.withOpacity(0.8), fontSize: 8);

    // Body Organs Box
    final RRect bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.275, size.height * 0.82, size.width * 0.45, size.height * 0.12),
      const Radius.circular(8),
    );
    canvas.drawRRect(bodyRect, Paint()..color = bodyBg);
    canvas.drawRRect(bodyRect, Paint()..color = bodyBorder..style = PaintingStyle.stroke..strokeWidth = 1.2);
    _drawText(canvas, "BODY ORGANS", Offset(size.width * 0.5, size.height * 0.855), labelColor, fontSize: 10, isBold: true);
    _drawText(canvas, "Systemic Circulation", Offset(size.width * 0.5, size.height * 0.895), labelColor.withOpacity(0.8), fontSize: 8);

    // Heart Box
    final RRect heartRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.32),
      const Radius.circular(12),
    );
    canvas.drawRRect(heartRect, Paint()..color = heartBg);
    canvas.drawRRect(heartRect, Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 1.5);
    
    _drawText(canvas, "HEART", Offset(size.width * 0.5, size.height * 0.38), labelColor, fontSize: 8.5, isBold: true);

    // Septum
    final Paint septumPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 4.0;
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.35),
      Offset(size.width * 0.5, size.height * 0.67),
      septumPaint,
    );

    // Valves
    final Paint valvePaint = Paint()
      ..color = borderColor
      ..strokeWidth = 1.0;
    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.5),
      Offset(size.width * 0.43, size.height * 0.5),
      valvePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.57, size.height * 0.5),
      Offset(size.width * 0.75, size.height * 0.5),
      valvePaint,
    );

    // RA
    _drawText(canvas, "RA", Offset(size.width * 0.375, size.height * 0.44), blueColor, fontSize: 11, isBold: true);
    _drawText(canvas, "Right Atrium", Offset(size.width * 0.375, size.height * 0.475), labelColor, fontSize: 7.5);

    // RV
    _drawText(canvas, "RV", Offset(size.width * 0.375, size.height * 0.57), blueColor, fontSize: 11, isBold: true);
    _drawText(canvas, "Right Ventricle", Offset(size.width * 0.375, size.height * 0.605), labelColor, fontSize: 7.5);

    // LA
    _drawText(canvas, "LA", Offset(size.width * 0.625, size.height * 0.44), redColor, fontSize: 11, isBold: true);
    _drawText(canvas, "Left Atrium", Offset(size.width * 0.625, size.height * 0.475), labelColor, fontSize: 7.5);

    // LV
    _drawText(canvas, "LV", Offset(size.width * 0.625, size.height * 0.57), redColor, fontSize: 11, isBold: true);
    _drawText(canvas, "Left Ventricle", Offset(size.width * 0.625, size.height * 0.605), labelColor, fontSize: 7.5);

    // Vessels / Curves
    final Paint bluePathPaint = Paint()
      ..color = blueColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final Paint redPathPaint = Paint()
      ..color = redColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    // Vena Cava
    final Path venaCava = Path()
      ..moveTo(size.width * 0.35, size.height * 0.82)
      ..cubicTo(
        size.width * 0.08, size.height * 0.78,
        size.width * 0.08, size.height * 0.48,
        size.width * 0.25, size.height * 0.44,
      );
    canvas.drawPath(venaCava, bluePathPaint);
    _drawArrowhead(canvas, Offset(size.width * 0.115, size.height * 0.60), -0.05, blueColor);
    _drawPathLabel(canvas, "Vena Cava", Offset(size.width * 0.17, size.height * 0.73), labelColor, isLeftAlign: false);

    // Pulmonary Artery
    final Path pulmArtery = Path()
      ..moveTo(size.width * 0.375, size.height * 0.67)
      ..cubicTo(
        size.width * 0.17, size.height * 0.71,
        size.width * 0.17, size.height * 0.28,
        size.width * 0.35, size.height * 0.18,
      );
    canvas.drawPath(pulmArtery, bluePathPaint);
    _drawArrowhead(canvas, Offset(size.width * 0.198, size.height * 0.41), 0.15, blueColor);
    _drawPathLabel(canvas, "Pulmonary Artery", Offset(size.width * 0.23, size.height * 0.26), labelColor, isLeftAlign: false);

    // Pulmonary Vein
    final Path pulmVein = Path()
      ..moveTo(size.width * 0.65, size.height * 0.18)
      ..cubicTo(
        size.width * 0.83, size.height * 0.28,
        size.width * 0.83, size.height * 0.41,
        size.width * 0.75, size.height * 0.44,
      );
    canvas.drawPath(pulmVein, redPathPaint);
    _drawArrowhead(canvas, Offset(size.width * 0.802, size.height * 0.33), math.pi * 0.85, redColor);
    _drawPathLabel(canvas, "Pulmonary Vein", Offset(size.width * 0.77, size.height * 0.26), labelColor, isLeftAlign: true);

    // Aorta
    final Path aorta = Path()
      ..moveTo(size.width * 0.625, size.height * 0.67)
      ..cubicTo(
        size.width * 0.92, size.height * 0.69,
        size.width * 0.92, size.height * 0.78,
        size.width * 0.65, size.height * 0.82,
      );
    canvas.drawPath(aorta, redPathPaint);
    _drawArrowhead(canvas, Offset(size.width * 0.885, size.height * 0.74), math.pi * 1.05, redColor);
    _drawPathLabel(canvas, "Aorta", Offset(size.width * 0.83, size.height * 0.73), labelColor, isLeftAlign: true);
  }

  void _drawLegend(Canvas canvas, Offset offset, String text, Color color) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(offset.dx, offset.dy, 8, 8), const Radius.circular(2)),
      Paint()..color = color,
    );
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: 7.5,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white60 : Colors.black87,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(offset.dx + 12, offset.dy - 1));
  }

  void _drawArrowhead(Canvas canvas, Offset point, double angle, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(point.dx, point.dy);
    canvas.rotate(angle);

    final path = Path()
      ..moveTo(0, -4.5)
      ..lineTo(-3.5, 3.5)
      ..lineTo(3.5, 3.5)
      ..close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 8.5, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }

  void _drawPathLabel(Canvas canvas, String text, Offset position, Color color, {required bool isLeftAlign}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 8.0,
          color: color.withOpacity(0.6),
          fontStyle: FontStyle.italic,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final double dx = isLeftAlign ? position.dx : position.dx - textPainter.width;
    textPainter.paint(canvas, Offset(dx, position.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NeuronPainter extends CustomPainter {
  final bool isDark;
  NeuronPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color borderColor = isDark ? Colors.white30 : Colors.black26;
    final Color labelColor = isDark ? Colors.white60 : Colors.black87;
    final Color accentColor = const Color(0xFF0284C7);
    final Color myelinColor = const Color(0xFFEAB308);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Cell Body
    final Path soma = Path();
    final Offset center = const Offset(60, 110);
    const double rOuter = 24.0;
    const double rInner = 12.0;
    const int points = 7;
    for (int i = 0; i < points * 2; i++) {
      final double angle = i * math.pi / points - math.pi / 2;
      final double r = i.isEven ? rOuter : rInner;
      final double px = center.dx + r * math.cos(angle);
      final double py = center.dy + r * math.sin(angle);
      if (i == 0) {
        soma.moveTo(px, py);
      } else {
        soma.lineTo(px, py);
      }
    }
    soma.close();
    
    canvas.drawPath(soma, Paint()..color = accentColor.withOpacity(0.12));
    canvas.drawPath(soma, Paint()..color = accentColor..style = PaintingStyle.stroke..strokeWidth = 1.8);

    canvas.drawCircle(center, 6.0, Paint()..color = accentColor);

    // Axon
    final Paint axonPaint = Paint()
      ..color = isDark ? Colors.white30 : Colors.black38
      ..strokeWidth = 3.0;
    canvas.drawLine(const Offset(84, 110), const Offset(230, 110), axonPaint);

    // Myelin Sheaths
    final Paint myelinPaint = Paint()..color = myelinColor.withOpacity(0.15);
    final Paint myelinStroke = Paint()
      ..color = myelinColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final List<double> sheathStarts = [95, 140, 185];
    for (final double start in sheathStarts) {
      final RRect rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(start, 102, 35, 16),
        const Radius.circular(4),
      );
      canvas.drawRRect(rect, myelinPaint);
      canvas.drawRRect(rect, myelinStroke);
    }

    // Nerve Endings
    final Paint terminalPaint = Paint()
      ..color = isDark ? Colors.white30 : Colors.black38
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    
    final Path terminals = Path()
      ..moveTo(230, 110)
      ..lineTo(245, 110)
      ..moveTo(245, 110)
      ..lineTo(255, 95)
      ..moveTo(255, 95)
      ..lineTo(260, 92)
      ..moveTo(245, 110)
      ..lineTo(255, 125)
      ..moveTo(255, 125)
      ..lineTo(262, 128);
    canvas.drawPath(terminals, terminalPaint);

    canvas.drawCircle(const Offset(260, 92), 2.5, Paint()..color = isDark ? Colors.white60 : Colors.black54);
    canvas.drawCircle(const Offset(262, 128), 2.5, Paint()..color = isDark ? Colors.white60 : Colors.black54);

    // Labels
    _drawPointer(canvas, const Offset(30, 65), const Offset(45, 92), borderPaint);
    _drawText(canvas, "Dendrite", const Offset(12, 57), labelColor);

    _drawPointer(canvas, const Offset(35, 150), const Offset(58, 115), borderPaint);
    _drawText(canvas, "Nucleus", const Offset(16, 152), labelColor);

    _drawPointer(canvas, const Offset(70, 55), const Offset(65, 86), borderPaint);
    _drawText(canvas, "Cell Body (Soma)", const Offset(68, 45), labelColor);

    _drawPointer(canvas, const Offset(130, 155), const Offset(130, 112), borderPaint);
    _drawText(canvas, "Axon", const Offset(120, 158), labelColor);

    _drawPointer(canvas, const Offset(180, 75), const Offset(160, 102), borderPaint);
    _drawText(canvas, "Myelin Sheath", const Offset(175, 65), labelColor);

    _drawPointer(canvas, const Offset(230, 155), const Offset(250, 118), borderPaint);
    _drawText(canvas, "Nerve Ending", const Offset(220, 158), labelColor);
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
    canvas.drawCircle(p1, 1.2, Paint()..color = paint.color);
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 8.5}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: fontSize,
          color: color,
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

class PrismDispersionPainter extends CustomPainter {
  final bool isDark;
  PrismDispersionPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color labelColor = isDark ? Colors.white60 : Colors.black87;

    // Glass Prism
    final Path prism = Path()
      ..moveTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.35, size.height * 0.75)
      ..lineTo(size.width * 0.65, size.height * 0.75)
      ..close();

    final Color prismBg = isDark ? Colors.blue.withOpacity(0.08) : Colors.blue.withOpacity(0.03);
    canvas.drawPath(prism, Paint()..color = prismBg);
    canvas.drawPath(prism, Paint()..color = isDark ? Colors.white30 : Colors.black26..style = PaintingStyle.stroke..strokeWidth = 2.0);
    
    _drawText(canvas, "Glass Prism", Offset(size.width * 0.5, size.height * 0.62), labelColor, fontSize: 8.5, isBold: true);

    // Incident White Light Ray
    final Offset incidentStart = Offset(size.width * 0.1, size.height * 0.55);
    final Offset incidentEnd = Offset(size.width * 0.41, size.height * 0.53);

    final Paint whiteRayPaint = Paint()
      ..color = isDark ? Colors.white : Colors.black54
      ..strokeWidth = 2.0;
    canvas.drawLine(incidentStart, incidentEnd, whiteRayPaint);
    _drawText(canvas, "White Light", Offset(size.width * 0.18, size.height * 0.50), labelColor, fontSize: 8.5);

    // Spectrum Colors
    final List<Color> spectrumColors = [
      const Color(0xFFEF4444), // Red
      const Color(0xFFF97316), // Orange
      const Color(0xFFFBBF24), // Yellow
      const Color(0xFF10B981), // Green
      const Color(0xFF3B82F6), // Blue
      const Color(0xFF6366F1), // Indigo
      const Color(0xFF8B5CF6), // Violet
    ];
    final List<String> vibgyorLabels = ["R", "O", "Y", "G", "B", "I", "V"];

    for (int i = 0; i < 7; i++) {
      final double interiorEnd = size.height * (0.53 + 0.02 * i);
      final Offset innerStart = incidentEnd;
      final Offset innerEnd = Offset(size.width * 0.58, interiorEnd);
      
      final Paint innerRay = Paint()
        ..color = spectrumColors[i].withOpacity(0.7)
        ..strokeWidth = 1.0;
      canvas.drawLine(innerStart, innerEnd, innerRay);

      final Offset outerEnd = Offset(size.width * 0.85, size.height * (0.42 + 0.05 * i));
      final Paint outerRay = Paint()
        ..color = spectrumColors[i]
        ..strokeWidth = 1.8;
      canvas.drawLine(innerEnd, outerEnd, outerRay);

      _drawText(canvas, vibgyorLabels[i], Offset(outerEnd.dx + 8, outerEnd.dy), spectrumColors[i], fontSize: 8, isBold: true);
    }

    _drawText(canvas, "Spectrum", Offset(size.width * 0.85, size.height * 0.35), labelColor, fontSize: 8.5, isBold: true);
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 8.5, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BarMagnetFieldPainter extends CustomPainter {
  final bool isDark;
  BarMagnetFieldPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color borderColor = isDark ? Colors.white30 : Colors.black26;
    final Color labelColor = isDark ? Colors.white60 : Colors.black87;
    final Color blueColor = const Color(0xFF0284C7);
    final Color redColor = const Color(0xFFE11D48);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Bar Magnet
    final RRect magnetRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.35, size.height * 0.42, size.width * 0.3, size.height * 0.16),
      const Radius.circular(4),
    );
    canvas.drawRRect(magnetRect, Paint()..color = isDark ? Colors.white10 : Colors.black.withOpacity(0.04));

    final double midX = size.width * 0.5;
    final Paint leftHalfPaint = Paint()..color = redColor.withOpacity(0.12);
    final Paint rightHalfPaint = Paint()..color = blueColor.withOpacity(0.12);

    canvas.drawRect(Rect.fromLTRB(size.width * 0.35, size.height * 0.42, midX, size.height * 0.58), leftHalfPaint);
    canvas.drawRect(Rect.fromLTRB(midX, size.height * 0.42, size.width * 0.65, size.height * 0.58), rightHalfPaint);

    canvas.drawRRect(magnetRect, Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 1.5);
    canvas.drawLine(Offset(midX, size.height * 0.42), Offset(midX, size.height * 0.58), borderPaint);

    _drawText(canvas, "N", Offset(size.width * 0.425, size.height * 0.5), redColor, fontSize: 13, isBold: true);
    _drawText(canvas, "S", Offset(size.width * 0.575, size.height * 0.5), blueColor, fontSize: 13, isBold: true);

    // Magnetic Field Lines
    final Paint linePaint = Paint()
      ..color = isDark ? Colors.white24 : Colors.black26
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final double northPoleX = size.width * 0.4;
    final double southPoleX = size.width * 0.6;
    final double magnetY = size.height * 0.5;

    for (int i = 1; i <= 3; i++) {
      final double loopH = 35.0 * i;
      final Path loop = Path()
        ..moveTo(northPoleX, magnetY - 8)
        ..cubicTo(
          northPoleX - 25 * i, magnetY - 8 - loopH,
          southPoleX + 25 * i, magnetY - 8 - loopH,
          southPoleX, magnetY - 8,
        );
      canvas.drawPath(loop, linePaint);
      _drawArrowhead(canvas, Offset(midX, magnetY - 8 - loopH * 0.67), 1.57, isDark ? Colors.white60 : Colors.black38);
    }

    for (int i = 1; i <= 3; i++) {
      final double loopH = 35.0 * i;
      final Path loop = Path()
        ..moveTo(northPoleX, magnetY + 8)
        ..cubicTo(
          northPoleX - 25 * i, magnetY + 8 + loopH,
          southPoleX + 25 * i, magnetY + 8 + loopH,
          southPoleX, magnetY + 8,
        );
      canvas.drawPath(loop, linePaint);
      _drawArrowhead(canvas, Offset(midX, magnetY + 8 + loopH * 0.67), -1.57, isDark ? Colors.white60 : Colors.black38);
    }

    final Path outLeft = Path()
      ..moveTo(size.width * 0.35, magnetY)
      ..quadraticBezierTo(size.width * 0.2, magnetY - 40, size.width * 0.15, magnetY - 50)
      ..moveTo(size.width * 0.35, magnetY)
      ..quadraticBezierTo(size.width * 0.2, magnetY + 40, size.width * 0.15, magnetY + 50);
    canvas.drawPath(outLeft, linePaint);
    
    final Path outRight = Path()
      ..moveTo(size.width * 0.65, magnetY)
      ..quadraticBezierTo(size.width * 0.8, magnetY - 40, size.width * 0.85, magnetY - 50)
      ..moveTo(size.width * 0.65, magnetY)
      ..quadraticBezierTo(size.width * 0.8, magnetY + 40, size.width * 0.85, magnetY + 50);
    canvas.drawPath(outRight, linePaint);

    _drawText(canvas, "Magnetic Field Lines (N ➔ S)", Offset(size.width * 0.5, size.height * 0.08), labelColor, fontSize: 8.5, isBold: true);
  }

  void _drawArrowhead(Canvas canvas, Offset point, double angle, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(point.dx, point.dy);
    canvas.rotate(angle);

    final path = Path()
      ..moveTo(0, -3.5)
      ..lineTo(-2.5, 2.5)
      ..lineTo(2.5, 2.5)
      ..close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 8.5, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrophicLevelsPainter extends CustomPainter {
  final bool isDark;
  TrophicLevelsPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color labelColor = isDark ? Colors.white60 : Colors.black87;

    final List<Color> levelColors = [
      const Color(0xFFEF4444),
      const Color(0xFFF97316),
      const Color(0xFFFBBF24),
      const Color(0xFF10B981),
    ];

    final List<String> levelLabels = [
      "Tertiary Consumers (Eagle) - 10 J",
      "Secondary Consumers (Snake) - 100 J",
      "Primary Consumers (Grasshopper) - 1,000 J",
      "Producers (Green Plants) - 10,000 J",
    ];

    final double midX = size.width * 0.45;
    
    for (int i = 0; i < 4; i++) {
      final double yTop = size.height * (0.15 + 0.17 * i);
      final double yBot = size.height * (0.15 + 0.17 * (i + 1));
      
      final double wTop = 30.0 + 30.0 * i;
      final double wBot = 30.0 + 30.0 * (i + 1);

      final Path path = Path()
        ..moveTo(midX - wTop, yTop)
        ..lineTo(midX + wTop, yTop)
        ..lineTo(midX + wBot, yBot)
        ..lineTo(midX - wBot, yBot)
        ..close();

      canvas.drawPath(path, Paint()..color = levelColors[i].withOpacity(0.12));
      canvas.drawPath(path, Paint()..color = levelColors[i]..style = PaintingStyle.stroke..strokeWidth = 1.2);

      _drawText(canvas, levelLabels[i], Offset(midX, (yTop + yBot) / 2), labelColor, fontSize: 8, isBold: true);
    }

    final double arrowX = size.width * 0.85;
    final Paint arrowPaint = Paint()
      ..color = const Color(0xFFEF4444)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(Offset(arrowX, size.height * 0.8), Offset(arrowX, size.height * 0.2), arrowPaint);
    
    final Path arrowHead = Path()
      ..moveTo(arrowX, size.height * 0.18)
      ..lineTo(arrowX - 4, size.height * 0.22)
      ..lineTo(arrowX + 4, size.height * 0.22)
      ..close();
    canvas.drawPath(arrowHead, Paint()..color = const Color(0xFFEF4444));

    canvas.save();
    canvas.translate(arrowX + 10, size.height * 0.5);
    canvas.rotate(math.pi / 2);
    _drawText(canvas, "Energy Flow", const Offset(0, 0), isDark ? Colors.white60 : Colors.black54, fontSize: 8);
    canvas.restore();

    _drawText(canvas, "10% Energy Transfer Law", Offset(size.width * 0.45, size.height * 0.08), labelColor, fontSize: 9, isBold: true);
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 8.5, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OhmsLawCircuitPainter extends CustomPainter {
  final bool isDark;
  OhmsLawCircuitPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color labelColor = isDark ? Colors.white60 : Colors.black87;
    final Color wireColor = isDark ? Colors.white70 : Colors.black87;
    final Color componentColor = const Color(0xFF0284C7);
    final Color highlightColor = const Color(0xFFEF4444);

    final wirePaint = Paint()
      ..color = wireColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final componentPaint = Paint()
      ..color = componentColor
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    final double left = 60.0;
    final double right = size.width - 60.0;
    final double top = 70.0;
    final double bottom = 170.0;

    final double midX = (left + right) / 2;
    canvas.drawLine(Offset(left, top), Offset(midX - 25, top), wirePaint);
    canvas.drawLine(Offset(midX + 25, top), Offset(right, top), wirePaint);

    final double midY = (top + bottom) / 2;
    canvas.drawLine(Offset(right, top), Offset(right, midY - 15), wirePaint);
    canvas.drawLine(Offset(right, midY + 15), Offset(right, bottom), wirePaint);

    canvas.drawLine(Offset(right, bottom), Offset(midX + 40, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 10, bottom), Offset(midX - 30, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 45, bottom), Offset(left, bottom), wirePaint);

    canvas.drawLine(Offset(left, bottom), Offset(left, midY + 20), wirePaint);
    canvas.drawLine(Offset(left, midY - 20), Offset(left, top), wirePaint);

    // Resistor
    final Path resistorPath = Path()
      ..moveTo(midX - 25, top)
      ..lineTo(midX - 20, top - 6)
      ..lineTo(midX - 12, top + 6)
      ..lineTo(midX - 4, top - 6)
      ..lineTo(midX + 4, top + 6)
      ..lineTo(midX + 12, top - 6)
      ..lineTo(midX + 20, top + 6)
      ..lineTo(midX + 25, top);
    canvas.drawPath(resistorPath, wirePaint);
    _drawText(canvas, "Resistor (R)", Offset(midX, top - 18), labelColor, fontSize: 8.5, isBold: true);

    // Voltmeter
    final double vTop = top - 35;
    final Paint vWirePaint = Paint()
      ..color = isDark ? Colors.white30 : Colors.black26
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(Offset(midX - 35, top), Offset(midX - 35, vTop), vWirePaint);
    canvas.drawLine(Offset(midX + 35, top), Offset(midX + 35, vTop), vWirePaint);
    canvas.drawLine(Offset(midX - 35, vTop), Offset(midX - 15, vTop), vWirePaint);
    canvas.drawLine(Offset(midX + 35, vTop), Offset(midX + 15, vTop), vWirePaint);

    canvas.drawCircle(Offset(midX, vTop), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(midX, vTop), 15.0, componentPaint);
    _drawText(canvas, "V", Offset(midX, vTop), labelColor, fontSize: 10, isBold: true);
    _drawText(canvas, "Voltmeter", Offset(midX, vTop - 22), labelColor, fontSize: 8);

    // Ammeter
    canvas.drawCircle(Offset(right, midY), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(right, midY), 15.0, componentPaint);
    _drawText(canvas, "A", Offset(right, midY), labelColor, fontSize: 10, isBold: true);
    _drawText(canvas, "Ammeter", Offset(right + 30, midY), labelColor, fontSize: 8);

    // Battery
    canvas.drawLine(Offset(midX - 45, bottom - 10), Offset(midX - 45, bottom + 10), wirePaint);
    canvas.drawLine(Offset(midX - 40, bottom - 6), Offset(midX - 40, bottom + 6), Paint()..color = wireColor..strokeWidth = 3.5);
    canvas.drawLine(Offset(midX - 40, bottom), Offset(midX - 35, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 35, bottom - 10), Offset(midX - 35, bottom + 10), wirePaint);
    canvas.drawLine(Offset(midX - 30, bottom - 6), Offset(midX - 30, bottom + 6), Paint()..color = wireColor..strokeWidth = 3.5);
    canvas.drawLine(Offset(midX - 30, bottom), Offset(midX - 25, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 25, bottom - 10), Offset(midX - 25, bottom + 10), wirePaint);
    canvas.drawLine(Offset(midX - 20, bottom - 6), Offset(midX - 20, bottom + 6), Paint()..color = wireColor..strokeWidth = 3.5);
    canvas.drawLine(Offset(midX - 20, bottom), Offset(midX - 15, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 15, bottom - 10), Offset(midX - 15, bottom + 10), wirePaint);
    canvas.drawLine(Offset(midX - 10, bottom - 6), Offset(midX - 10, bottom + 6), Paint()..color = wireColor..strokeWidth = 3.5);

    _drawText(canvas, "Battery", Offset(midX - 27, bottom + 18), labelColor, fontSize: 8);
    _drawText(canvas, "+", Offset(midX - 52, bottom - 12), highlightColor, fontSize: 9, isBold: true);
    _drawText(canvas, "-", Offset(midX - 5, bottom - 12), highlightColor, fontSize: 9, isBold: true);

    // Key
    final double keyX = midX + 25;
    canvas.drawArc(Rect.fromLTWH(keyX - 10, bottom - 6, 8, 12), math.pi / 2, math.pi, false, wirePaint);
    canvas.drawArc(Rect.fromLTWH(keyX + 2, bottom - 6, 8, 12), -math.pi / 2, math.pi, false, wirePaint);
    canvas.drawCircle(Offset(keyX, bottom), 2.0, Paint()..color = wireColor);
    _drawText(canvas, "Key (K)", Offset(keyX, bottom + 16), labelColor, fontSize: 8);

    // Rheostat
    final Path rheostatPath = Path()
      ..moveTo(left, midY - 20)
      ..lineTo(left - 5, midY - 15)
      ..lineTo(left + 5, midY - 9)
      ..lineTo(left - 5, midY - 3)
      ..lineTo(left + 5, midY + 3)
      ..lineTo(left - 5, midY + 9)
      ..lineTo(left + 5, midY + 15)
      ..lineTo(left, midY + 20);
    canvas.drawPath(rheostatPath, wirePaint);

    final Paint arrowPaint = Paint()
      ..color = highlightColor
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(left + 15, midY + 25), Offset(left - 8, midY - 25), arrowPaint);
    
    final Path arrowHead = Path()
      ..moveTo(left - 8, midY - 25)
      ..lineTo(left - 4, midY - 22)
      ..lineTo(left - 10, midY - 20)
      ..close();
    canvas.drawPath(arrowHead, Paint()..color = highlightColor);

    _drawText(canvas, "Rheostat (Rh)", Offset(left - 30, midY), labelColor, fontSize: 8);

    // Direction arrows
    _drawArrowhead(canvas, Offset(left, midY - 25), 0, highlightColor);
    _drawArrowhead(canvas, Offset(midX - 50, top), math.pi / 2, highlightColor);
    _drawArrowhead(canvas, Offset(right, midY - 25), math.pi, highlightColor);

    _drawText(canvas, "I", Offset(left + 8, midY - 25), highlightColor, fontSize: 8, isBold: true);
    _drawText(canvas, "I", Offset(midX - 50, top - 8), highlightColor, fontSize: 8, isBold: true);
  }

  void _drawArrowhead(Canvas canvas, Offset point, double angle, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(point.dx, point.dy);
    canvas.rotate(angle);

    final path = Path()
      ..moveTo(0, -3.5)
      ..lineTo(-2.5, 2.5)
      ..lineTo(2.5, 2.5)
      ..close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 8.5, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class CircuitSymbolsPainter extends CustomPainter {
  final bool isDark;
  CircuitSymbolsPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark ? Colors.white : Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()
      ..color = isDark ? Colors.white : Colors.black
      ..style = PaintingStyle.fill;
    
    final textPainter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    void drawText(String text, Offset offset) {
      textPainter.text = TextSpan(
        text: text,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 12,
          fontFamily: 'Outfit'
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset);
    }

    double col1 = 5;
    double col2 = 120;
    double col3 = size.width / 2 + 5;
    double col4 = size.width / 2 + 120;
    
    double y = 10;
    
    // Electric cell
    drawText("Electric Cell", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+15, y+10), paint);
    canvas.drawLine(Offset(col2+15, y+0), Offset(col2+15, y+20), paint);
    canvas.drawLine(Offset(col2+22, y+5), Offset(col2+22, y+15), paint..strokeWidth = 3);
    canvas.drawLine(Offset(col2+22, y+10), Offset(col2+40, y+10), paint..strokeWidth = 1.5);
    drawText("+", Offset(col2+5, y-8));
    drawText("-", Offset(col2+25, y-8));
    
    // Battery
    drawText("Battery", Offset(col3, y));
    double bx = col4;
    for(int i=0; i<3; i++) {
        canvas.drawLine(Offset(bx, y+10), Offset(bx+5, y+10), paint);
        canvas.drawLine(Offset(bx+5, y+0), Offset(bx+5, y+20), paint);
        canvas.drawLine(Offset(bx+12, y+5), Offset(bx+12, y+15), paint..strokeWidth = 3);
        canvas.drawLine(Offset(bx+12, y+10), Offset(bx+17, y+10), paint..strokeWidth=1.5);
        bx += 17;
    }
    drawText("+", Offset(col4+0, y-8));
    drawText("-", Offset(bx-10, y-8));
    
    y += 40;
    
    // Plug key (open)
    drawText("Plug Key (Open)", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+10, y+10), paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col2+15, y+10), radius: 5), 1.57, 3.14, false, paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col2+25, y+10), radius: 5), -1.57, 3.14, false, paint);
    canvas.drawLine(Offset(col2+30, y+10), Offset(col2+40, y+10), paint);
    
    // Plug key (closed)
    drawText("Plug Key (Closed)", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+10, y+10), paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col4+15, y+10), radius: 5), 1.57, 3.14, false, paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col4+25, y+10), radius: 5), -1.57, 3.14, false, paint);
    canvas.drawLine(Offset(col4+30, y+10), Offset(col4+40, y+10), paint);
    canvas.drawCircle(Offset(col4+20, y+10), 2, fillPaint);
    
    y += 40;
    
    // Wire joint
    drawText("Wire Joint", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+40, y+10), paint);
    canvas.drawLine(Offset(col2+20, y+10), Offset(col2+20, y-5), paint);
    canvas.drawCircle(Offset(col2+20, y+10), 2.5, fillPaint);

    // Wires crossing without joining
    drawText("Crossing Wires", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+40, y+10), paint);
    canvas.drawLine(Offset(col4+20, y+25), Offset(col4+20, y+15), paint);
    canvas.drawArc(Rect.fromCircle(center: Offset(col4+20, y+10), radius: 5), 3.14, 3.14, false, paint);
    canvas.drawLine(Offset(col4+20, y+5), Offset(col4+20, y-5), paint);

    y += 40;
    
    // Electric Bulb
    drawText("Electric Bulb", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+12, y+10), paint);
    canvas.drawLine(Offset(col2+28, y+10), Offset(col2+40, y+10), paint);
    Path bulbPath = Path()
      ..moveTo(col2+12, y+10)
      ..lineTo(col2+15, y+2)
      ..lineTo(col2+20, y+7)
      ..lineTo(col2+25, y+2)
      ..lineTo(col2+28, y+10);
    canvas.drawPath(bulbPath, paint);
    canvas.drawCircle(Offset(col2+20, y+5), 12, paint);

    // Resistor
    drawText("Resistor", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+5, y+10), paint);
    double rx = col4+5;
    for(int i=0; i<3; i++) {
        canvas.drawLine(Offset(rx, y+10), Offset(rx+2.5, y+0), paint);
        canvas.drawLine(Offset(rx+2.5, y+0), Offset(rx+7.5, y+20), paint);
        canvas.drawLine(Offset(rx+7.5, y+20), Offset(rx+10, y+10), paint);
        rx += 10;
    }
    canvas.drawLine(Offset(rx, y+10), Offset(rx+5, y+10), paint);

    y += 40;

    // Rheostat
    drawText("Variable Resistor / Rheostat", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+5, y+10), paint);
    rx = col2+5;
    for(int i=0; i<3; i++) {
        canvas.drawLine(Offset(rx, y+10), Offset(rx+2.5, y+0), paint);
        canvas.drawLine(Offset(rx+2.5, y+0), Offset(rx+7.5, y+20), paint);
        canvas.drawLine(Offset(rx+7.5, y+20), Offset(rx+10, y+10), paint);
        rx += 10;
    }
    canvas.drawLine(Offset(rx, y+10), Offset(rx+5, y+10), paint);
    
    // Proper diagonal arrow striking through the resistor
    canvas.drawLine(Offset(col2+5, y+22), Offset(col2+35, y-2), paint);
    // Arrow head
    canvas.drawLine(Offset(col2+35, y-2), Offset(col2+30, y-2), paint);
    canvas.drawLine(Offset(col2+35, y-2), Offset(col2+35, y+3), paint);

    // Ammeter
    drawText("Ammeter", Offset(col3, y));
    canvas.drawLine(Offset(col4, y+10), Offset(col4+10, y+10), paint);
    canvas.drawCircle(Offset(col4+20, y+10), 10, paint);
    drawText("A", Offset(col4+16, y+2));
    canvas.drawLine(Offset(col4+30, y+10), Offset(col4+40, y+10), paint);
    drawText("+", Offset(col4+2, y-8));
    drawText("-", Offset(col4+32, y-8));

    y += 40;

    // Voltmeter
    drawText("Voltmeter", Offset(col1, y));
    canvas.drawLine(Offset(col2, y+10), Offset(col2+10, y+10), paint);
    canvas.drawCircle(Offset(col2+20, y+10), 10, paint);
    drawText("V", Offset(col2+16, y+2));
    canvas.drawLine(Offset(col2+30, y+10), Offset(col2+40, y+10), paint);
    drawText("+", Offset(col2+2, y-8));
    drawText("-", Offset(col2+32, y-8));

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ResistorsInSeriesPainter extends CustomPainter {
  final bool isDark;
  ResistorsInSeriesPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color wireColor = isDark ? Colors.white70 : Colors.black87;
    final Color componentColor = const Color(0xFF0284C7);
    final Color highlightColor = const Color(0xFFEF4444);

    final wirePaint = Paint()
      ..color = wireColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final double left = 50.0;
    final double right = size.width - 50.0;
    final double top = 60.0;
    final double bottom = 140.0;
    
    // Main loop
    canvas.drawLine(Offset(left, top), Offset(right, top), wirePaint);
    canvas.drawLine(Offset(right, top), Offset(right, bottom), wirePaint);
    canvas.drawLine(Offset(left, top), Offset(left, bottom), wirePaint);
    
    // Bottom wire segments
    double midX = size.width / 2;
    canvas.drawLine(Offset(right, bottom), Offset(midX + 40, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 10, bottom), Offset(midX - 40, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 70, bottom), Offset(left, bottom), wirePaint);

    // Resistors
    double spacing = (right - left) / 3;
    _drawResistor(canvas, Offset(left + spacing/2, top), wirePaint, "R1", isDark);
    _drawResistor(canvas, Offset(left + 1.5 * spacing, top), wirePaint, "R2", isDark);
    _drawResistor(canvas, Offset(left + 2.5 * spacing, top), wirePaint, "R3", isDark);

    // Voltmeter (across all three)
    double vTop = 20.0;
    final vWirePaint = Paint()..color = isDark ? Colors.white30 : Colors.black26..strokeWidth = 1.0;
    canvas.drawLine(Offset(left + 10, top), Offset(left + 10, vTop), vWirePaint);
    canvas.drawLine(Offset(right - 10, top), Offset(right - 10, vTop), vWirePaint);
    canvas.drawLine(Offset(left + 10, vTop), Offset(midX - 15, vTop), vWirePaint);
    canvas.drawLine(Offset(right - 10, vTop), Offset(midX + 15, vTop), vWirePaint);
    
    canvas.drawCircle(Offset(midX, vTop), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(midX, vTop), 15.0, Paint()..color=componentColor..strokeWidth=1.8..style=PaintingStyle.stroke);
    _drawText(canvas, "V", Offset(midX, vTop), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);
    
    // Ammeter
    canvas.drawCircle(Offset(midX + 25, bottom), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(midX + 25, bottom), 15.0, Paint()..color=componentColor..strokeWidth=1.8..style=PaintingStyle.stroke);
    _drawText(canvas, "A", Offset(midX + 25, bottom), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);

    // Battery
    _drawBattery(canvas, Offset(midX - 25, bottom), wireColor);
    
    // Key
    _drawKey(canvas, Offset(midX - 55, bottom), wireColor);

    // Current Direction
    _drawArrowhead(canvas, Offset(left, (top+bottom)/2), -1.57, highlightColor);
    _drawArrowhead(canvas, Offset(right, (top+bottom)/2), 1.57, highlightColor);
    _drawText(canvas, "I", Offset(left + 10, (top+bottom)/2), highlightColor, isBold: true);
  }

  void _drawResistor(Canvas canvas, Offset center, Paint paint, String label, bool isDark) {
    // hide background line
    canvas.drawLine(Offset(center.dx - 15, center.dy), Offset(center.dx + 15, center.dy), Paint()..color=isDark?Color(0xFF1E293B):Colors.white..strokeWidth=3);
    
    Path rPath = Path()
      ..moveTo(center.dx - 15, center.dy)
      ..lineTo(center.dx - 10, center.dy - 6)
      ..lineTo(center.dx - 5, center.dy + 6)
      ..lineTo(center.dx, center.dy - 6)
      ..lineTo(center.dx + 5, center.dy + 6)
      ..lineTo(center.dx + 10, center.dy - 6)
      ..lineTo(center.dx + 15, center.dy);
    canvas.drawPath(rPath, paint);
    _drawText(canvas, label, Offset(center.dx, center.dy - 15), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);
  }

  void _drawBattery(Canvas canvas, Offset center, Color color) {
    Paint p = Paint()..color=color..strokeWidth=2;
    Paint pThick = Paint()..color=color..strokeWidth=3.5;
    
    canvas.drawLine(Offset(center.dx - 10, center.dy - 10), Offset(center.dx - 10, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx - 4, center.dy - 5), Offset(center.dx - 4, center.dy + 5), pThick);
    canvas.drawLine(Offset(center.dx + 4, center.dy - 10), Offset(center.dx + 4, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx + 10, center.dy - 5), Offset(center.dx + 10, center.dy + 5), pThick);
    _drawText(canvas, "+", Offset(center.dx - 18, center.dy - 12), const Color(0xFFEF4444), fontSize: 10, isBold: true);
    _drawText(canvas, "-", Offset(center.dx + 18, center.dy - 12), const Color(0xFFEF4444), fontSize: 10, isBold: true);
  }

  void _drawKey(Canvas canvas, Offset center, Color color) {
    Paint p = Paint()..color=color..strokeWidth=2..style=PaintingStyle.stroke;
    canvas.drawArc(Rect.fromLTWH(center.dx - 10, center.dy - 6, 8, 12), 1.57, 3.14, false, p);
    canvas.drawArc(Rect.fromLTWH(center.dx + 2, center.dy - 6, 8, 12), -1.57, 3.14, false, p);
    canvas.drawCircle(center, 2.0, Paint()..color=color..style=PaintingStyle.fill);
  }

  void _drawArrowhead(Canvas canvas, Offset point, double angle, Color color) {
    final paint = Paint()..color = color..style = PaintingStyle.fill;
    canvas.save();
    canvas.translate(point.dx, point.dy);
    canvas.rotate(angle);
    final path = Path()..moveTo(0, -4)..lineTo(-3, 3)..lineTo(3, 3)..close();
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 9, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontFamily: 'Outfit', fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ResistorsInParallelPainter extends CustomPainter {
  final bool isDark;
  ResistorsInParallelPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color wireColor = isDark ? Colors.white70 : Colors.black87;
    final Color componentColor = const Color(0xFF0284C7);
    final Color highlightColor = const Color(0xFFEF4444);

    final wirePaint = Paint()
      ..color = wireColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final double left = 60.0;
    final double right = size.width - 60.0;
    final double top = 40.0;
    final double midY = 80.0;
    final double bottom = 120.0;
    final double mainBottom = 170.0;
    
    // Main loop outer frame
    canvas.drawLine(Offset(left, midY), Offset(left, mainBottom), wirePaint);
    canvas.drawLine(Offset(right, midY), Offset(right, mainBottom), wirePaint);
    
    // Bottom wire segments
    double midX = size.width / 2;
    canvas.drawLine(Offset(right, mainBottom), Offset(midX + 40, mainBottom), wirePaint);
    canvas.drawLine(Offset(midX - 10, mainBottom), Offset(midX - 40, mainBottom), wirePaint);
    canvas.drawLine(Offset(midX - 70, mainBottom), Offset(left, mainBottom), wirePaint);

    // Parallel branches
    // Left manifold
    canvas.drawLine(Offset(left, top), Offset(left, bottom), wirePaint);
    // Right manifold
    canvas.drawLine(Offset(right, top), Offset(right, bottom), wirePaint);
    
    // 3 branches
    canvas.drawLine(Offset(left, top), Offset(right, top), wirePaint);
    canvas.drawLine(Offset(left, midY), Offset(right, midY), wirePaint);
    canvas.drawLine(Offset(left, bottom), Offset(right, bottom), wirePaint);

    // Nodes X and Y
    canvas.drawCircle(Offset(left, midY), 3.0, Paint()..color=wireColor..style=PaintingStyle.fill);
    canvas.drawCircle(Offset(right, midY), 3.0, Paint()..color=wireColor..style=PaintingStyle.fill);
    _drawText(canvas, "X", Offset(left - 10, midY), isDark ? Colors.white : Colors.black, isBold: true);
    _drawText(canvas, "Y", Offset(right + 10, midY), isDark ? Colors.white : Colors.black, isBold: true);

    // Resistors
    _drawResistor(canvas, Offset(midX, top), wirePaint, "R1", isDark);
    _drawResistor(canvas, Offset(midX, midY), wirePaint, "R2", isDark);
    _drawResistor(canvas, Offset(midX, bottom), wirePaint, "R3", isDark);

    // Voltmeter (across X and Y)
    double vTop = 15.0;
    final vWirePaint = Paint()..color = isDark ? Colors.white30 : Colors.black26..strokeWidth = 1.0;
    canvas.drawLine(Offset(left, top), Offset(left, vTop), vWirePaint);
    canvas.drawLine(Offset(right, top), Offset(right, vTop), vWirePaint);
    canvas.drawLine(Offset(left, vTop), Offset(midX - 15, vTop), vWirePaint);
    canvas.drawLine(Offset(right, vTop), Offset(midX + 15, vTop), vWirePaint);
    
    canvas.drawCircle(Offset(midX, vTop), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(midX, vTop), 15.0, Paint()..color=componentColor..strokeWidth=1.8..style=PaintingStyle.stroke);
    _drawText(canvas, "V", Offset(midX, vTop), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);
    
    // Ammeter
    canvas.drawCircle(Offset(midX + 25, mainBottom), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(midX + 25, mainBottom), 15.0, Paint()..color=componentColor..strokeWidth=1.8..style=PaintingStyle.stroke);
    _drawText(canvas, "A", Offset(midX + 25, mainBottom), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);

    // Battery
    _drawBattery(canvas, Offset(midX - 25, mainBottom), wireColor);
    
    // Key
    _drawKey(canvas, Offset(midX - 55, mainBottom), wireColor);
    
    // Current Arrows
    _drawArrowhead(canvas, Offset(left, mainBottom - 25), -1.57, highlightColor);
    _drawArrowhead(canvas, Offset(right, mainBottom - 25), 1.57, highlightColor);
  }

  void _drawResistor(Canvas canvas, Offset center, Paint paint, String label, bool isDark) {
    canvas.drawLine(Offset(center.dx - 15, center.dy), Offset(center.dx + 15, center.dy), Paint()..color=isDark?Color(0xFF1E293B):Colors.white..strokeWidth=3);
    Path rPath = Path()
      ..moveTo(center.dx - 15, center.dy)
      ..lineTo(center.dx - 10, center.dy - 6)
      ..lineTo(center.dx - 5, center.dy + 6)
      ..lineTo(center.dx, center.dy - 6)
      ..lineTo(center.dx + 5, center.dy + 6)
      ..lineTo(center.dx + 10, center.dy - 6)
      ..lineTo(center.dx + 15, center.dy);
    canvas.drawPath(rPath, paint);
    _drawText(canvas, label, Offset(center.dx, center.dy - 12), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);
  }

  void _drawBattery(Canvas canvas, Offset center, Color color) {
    Paint p = Paint()..color=color..strokeWidth=2;
    Paint pThick = Paint()..color=color..strokeWidth=3.5;
    
    canvas.drawLine(Offset(center.dx - 10, center.dy - 10), Offset(center.dx - 10, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx - 4, center.dy - 5), Offset(center.dx - 4, center.dy + 5), pThick);
    canvas.drawLine(Offset(center.dx + 4, center.dy - 10), Offset(center.dx + 4, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx + 10, center.dy - 5), Offset(center.dx + 10, center.dy + 5), pThick);
  }

  void _drawKey(Canvas canvas, Offset center, Color color) {
    Paint p = Paint()..color=color..strokeWidth=2..style=PaintingStyle.stroke;
    canvas.drawArc(Rect.fromLTWH(center.dx - 10, center.dy - 6, 8, 12), 1.57, 3.14, false, p);
    canvas.drawArc(Rect.fromLTWH(center.dx + 2, center.dy - 6, 8, 12), -1.57, 3.14, false, p);
    canvas.drawCircle(center, 2.0, Paint()..color=color..style=PaintingStyle.fill);
  }

  void _drawArrowhead(Canvas canvas, Offset point, double angle, Color color) {
    final paint = Paint()..color = color..style = PaintingStyle.fill;
    canvas.save();
    canvas.translate(point.dx, point.dy);
    canvas.rotate(angle);
    final path = Path()..moveTo(0, -4)..lineTo(-3, 3)..lineTo(3, 3)..close();
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 9, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontFamily: 'Outfit', fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BasicCircuitPainter extends CustomPainter {
  final bool isDark;
  BasicCircuitPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Color wireColor = isDark ? Colors.white70 : Colors.black87;
    final Color componentColor = const Color(0xFF0284C7);
    final Color highlightColor = const Color(0xFFEF4444);

    final wirePaint = Paint()
      ..color = wireColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final double left = 60.0;
    final double right = size.width - 60.0;
    final double top = 60.0;
    final double bottom = 140.0;
    final double midX = size.width / 2;

    // Draw main rectangle wires
    canvas.drawLine(Offset(left, top), Offset(midX - 25, top), wirePaint);
    canvas.drawLine(Offset(midX + 25, top), Offset(right, top), wirePaint);
    
    canvas.drawLine(Offset(right, top), Offset(right, bottom - 20), wirePaint);
    canvas.drawLine(Offset(right, bottom + 20), Offset(right, bottom), wirePaint);

    canvas.drawLine(Offset(right, bottom), Offset(midX + 40, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 10, bottom), Offset(midX - 30, bottom), wirePaint);
    canvas.drawLine(Offset(midX - 45, bottom), Offset(left, bottom), wirePaint);

    canvas.drawLine(Offset(left, bottom), Offset(left, top), wirePaint);

    // Bulb at the top
    _drawBulb(canvas, Offset(midX, top), wirePaint, isDark);
    
    // Ammeter on the right
    canvas.drawCircle(Offset(right, bottom - 10), 15.0, Paint()..color = isDark ? Colors.black : Colors.white);
    canvas.drawCircle(Offset(right, bottom - 10), 15.0, Paint()..color=componentColor..strokeWidth=1.8..style=PaintingStyle.stroke);
    _drawText(canvas, "A", Offset(right, bottom - 10), isDark ? Colors.white : Colors.black, fontSize: 10, isBold: true);
    _drawText(canvas, "+", Offset(right - 12, bottom - 32), highlightColor, fontSize: 10, isBold: true);
    _drawText(canvas, "-", Offset(right - 12, bottom + 12), highlightColor, fontSize: 10, isBold: true);

    // Battery at the bottom
    _drawBattery(canvas, Offset(midX - 25, bottom), wireColor);

    // Key at the bottom
    _drawKey(canvas, Offset(midX + 25, bottom), wireColor);
    
    // Direction arrows
    _drawArrowhead(canvas, Offset(left, (top+bottom)/2), 0, highlightColor); // Up
    _drawArrowhead(canvas, Offset(midX - 30, top), 1.57, highlightColor); // Right
    _drawArrowhead(canvas, Offset(right, (top+bottom)/2), 3.14, highlightColor); // Down
    _drawText(canvas, "I", Offset(left + 15, (top+bottom)/2), highlightColor, isBold: true);
  }

  void _drawBulb(Canvas canvas, Offset center, Paint paint, bool isDark) {
    canvas.drawCircle(center, 18, paint);
    Path filament = Path()
      ..moveTo(center.dx - 8, center.dy + 18)
      ..lineTo(center.dx - 4, center.dy + 6)
      ..lineTo(center.dx, center.dy + 12)
      ..lineTo(center.dx + 4, center.dy + 6)
      ..lineTo(center.dx + 8, center.dy + 18);
    canvas.drawPath(filament, paint);
  }

  void _drawBattery(Canvas canvas, Offset center, Color color) {
    Paint p = Paint()..color=color..strokeWidth=2;
    Paint pThick = Paint()..color=color..strokeWidth=3.5;
    
    // 3 cells
    canvas.drawLine(Offset(center.dx - 15, center.dy - 10), Offset(center.dx - 15, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx - 9, center.dy - 5), Offset(center.dx - 9, center.dy + 5), pThick);
    canvas.drawLine(Offset(center.dx - 1, center.dy - 10), Offset(center.dx - 1, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx + 5, center.dy - 5), Offset(center.dx + 5, center.dy + 5), pThick);
    canvas.drawLine(Offset(center.dx + 13, center.dy - 10), Offset(center.dx + 13, center.dy + 10), p);
    canvas.drawLine(Offset(center.dx + 19, center.dy - 5), Offset(center.dx + 19, center.dy + 5), pThick);
    
    _drawText(canvas, "+", Offset(center.dx - 22, center.dy - 12), const Color(0xFFEF4444), fontSize: 10, isBold: true);
    _drawText(canvas, "-", Offset(center.dx + 26, center.dy - 12), const Color(0xFFEF4444), fontSize: 10, isBold: true);
  }

  void _drawKey(Canvas canvas, Offset center, Color color) {
    Paint p = Paint()..color=color..strokeWidth=2..style=PaintingStyle.stroke;
    canvas.drawArc(Rect.fromLTWH(center.dx - 10, center.dy - 6, 8, 12), 1.57, 3.14, false, p);
    canvas.drawArc(Rect.fromLTWH(center.dx + 2, center.dy - 6, 8, 12), -1.57, 3.14, false, p);
    canvas.drawCircle(center, 2.0, Paint()..color=color..style=PaintingStyle.fill);
    _drawText(canvas, "K", Offset(center.dx, center.dy - 15), color, fontSize: 10, isBold: true);
  }

  void _drawArrowhead(Canvas canvas, Offset point, double angle, Color color) {
    final paint = Paint()..color = color..style = PaintingStyle.fill;
    canvas.save();
    canvas.translate(point.dx, point.dy);
    canvas.rotate(angle);
    final path = Path()..moveTo(0, -4)..lineTo(-3, 3)..lineTo(3, 3)..close();
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color, {double fontSize = 9, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontFamily: 'Outfit', fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(position.dx - textPainter.width / 2, position.dy - textPainter.height / 2));
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
