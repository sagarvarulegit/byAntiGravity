import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

// Unique token generated once per app load to completely bust iframe browser cache
final String _sessionBuster = DateTime.now().millisecondsSinceEpoch.toString();

Widget buildAnimatedSvg({
  required String svgPath,
  required double width,
  required double height,
  required bool isDark,
}) {
  return _AnimatedSvgKeepAlive(
    svgPath: svgPath,
    isDark: isDark,
    width: width,
    height: height,
  );
}

class _AnimatedSvgKeepAlive extends StatefulWidget {
  final String svgPath;
  final bool isDark;
  final double width;
  final double height;

  const _AnimatedSvgKeepAlive({
    super.key,
    required this.svgPath,
    required this.isDark,
    required this.width,
    required this.height,
  });
  @override
  State<_AnimatedSvgKeepAlive> createState() => _AnimatedSvgKeepAliveState();
}

class _AnimatedSvgKeepAliveState extends State<_AnimatedSvgKeepAlive>
    with AutomaticKeepAliveClientMixin {
  static int _instanceCounter = 0;
  late String _viewId;

  @override
  void initState() {
    super.initState();
    _instanceCounter++;
    // Generate a unique viewId for this specific widget instance to prevent Flutter Web DOM recycling bugs
    _viewId = 'svg-view-${widget.svgPath.replaceAll('/', '-').replaceAll('.', '-')}-${widget.isDark}-$_sessionBuster-$_instanceCounter';

    ui_web.platformViewRegistry.registerViewFactory(
      _viewId,
      (int viewId) {
        final objectElem = html.ObjectElement()
          ..type = 'image/svg+xml'
          ..data = '${widget.svgPath}?v=$_sessionBuster'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.border = 'none'
          ..style.overflow = 'hidden';
        return objectElem;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(
        key: ValueKey(_viewId),
        viewType: _viewId,
      ),
    );
  }
}
