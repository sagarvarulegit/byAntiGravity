import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CinemagraphWidget extends StatefulWidget {
  final String assetPath;

  const CinemagraphWidget({super.key, required this.assetPath});

  @override
  State<CinemagraphWidget> createState() => _CinemagraphWidgetState();
}

class _CinemagraphWidgetState extends State<CinemagraphWidget> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
      }).catchError((e) {
        debugPrint("Error loading cinemagraph: $e");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container(
        color: Colors.grey.shade900,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white24),
        ),
      );
    }

    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}
