import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final VoidCallback? onVideoCompleted;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.onVideoCompleted,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _controller.removeListener(_videoListener);
      _controller.dispose();
      _initialized = false;
      _hasError = false;
      _initializeController();
    }
  }

  String _errorMessage = "Error loading video lecture";

  void _initializeController() {
    Uri uri;
    if (widget.videoUrl.startsWith('http://') || widget.videoUrl.startsWith('https://')) {
      uri = Uri.parse(widget.videoUrl);
    } else {
      // Local/web static relative URL path: resolve from current browser URL
      uri = Uri.base.resolve(widget.videoUrl);
    }

    _controller = VideoPlayerController.networkUrl(uri);

    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _initialized = true;
        });
        _controller.addListener(_videoListener);
      }
    }).catchError((error) {
      debugPrint("Video initialization error: $error");
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = error.toString();
        });
      }
    });
  }

  void _videoListener() {
    if (_controller.value.position >= _controller.value.duration &&
        _controller.value.duration > Duration.zero) {
      widget.onVideoCompleted?.call();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 40),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                _errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
      );
    }

    if (!_initialized) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFBE185D), // NCERT Magenta
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        
        // Touch overlay to toggle play/pause
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: _controller.value.isPlaying
                  ? const SizedBox.shrink()
                  : Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
            ),
          ),
        ),
        
        // Bottom progress bar overlay
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.black45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          _formatDuration(_controller.value.position),
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const Text(
                          ' / ',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        Text(
                          _formatDuration(_controller.value.duration),
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    PopupMenuButton<double>(
                      initialValue: _controller.value.playbackSpeed,
                      tooltip: 'Playback speed',
                      color: const Color(0xFF1E293B), // Slate 800
                      elevation: 4,
                      position: PopupMenuPosition.over,
                      onSelected: (double speed) {
                        _controller.setPlaybackSpeed(speed);
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<double>>[
                          for (final speed in [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0])
                            PopupMenuItem<double>(
                              value: speed,
                              child: Text(
                                '${speed}x',
                                style: TextStyle(
                                  color: _controller.value.playbackSpeed == speed 
                                      ? const Color(0xFFBE185D) // NCERT Magenta
                                      : Colors.white,
                                  fontWeight: _controller.value.playbackSpeed == speed 
                                      ? FontWeight.bold 
                                      : FontWeight.normal,
                                ),
                              ),
                            )
                        ];
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.speed_rounded, color: Colors.white, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              '${_controller.value.playbackSpeed == 1.0 ? 'Normal' : _controller.value.playbackSpeed.toString() + 'x'}',
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: EdgeInsets.zero,
                colors: const VideoProgressColors(
                  playedColor: Color(0xFFBE185D), // NCERT Magenta
                  bufferedColor: Colors.white30,
                  backgroundColor: Colors.white12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
