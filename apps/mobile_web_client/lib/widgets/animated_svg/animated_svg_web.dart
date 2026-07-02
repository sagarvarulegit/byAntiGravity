import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

// Unique token generated once per app load to completely bust iframe browser cache
final String _sessionBuster = DateTime.now().millisecondsSinceEpoch.toString();

// Cache to prevent duplicate platform view registration
final Set<String> _registeredViewIds = {};

Widget buildAnimatedSvg({
  required String svgPath,
  required double width,
  required double height,
  required bool isDark,
}) {
  // Unique view ID based on the SVG path, theme, and session buster
  final String viewId = 'svg-view-${svgPath.replaceAll('/', '-').replaceAll('.', '-')}-$isDark-$_sessionBuster';
  
  // Register the element view factory once per session
  if (!_registeredViewIds.contains(viewId)) {
    ui_web.platformViewRegistry.registerViewFactory(
      viewId,
      (int viewId) {
        // Use an IFrameElement instead of ImageElement.
        // Chrome disables CSS animations inside SVGs when loaded via <img> tag (ImageElement).
        // Using an <iframe> allows the browser to render it as a document, executing the CSS animations.
        // We append the session buster to the src URL to force Chrome to request the file fresh from the server.
        final iframe = html.IFrameElement()
          ..src = 'assets/$svgPath?v=$_sessionBuster'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.border = 'none'
          ..style.overflow = 'hidden';
        return iframe;
      },
    );
    _registeredViewIds.add(viewId);
  }

  return SizedBox(
    width: width,
    height: height,
    child: HtmlElementView(
      viewType: viewId,
    ),
  );
}
