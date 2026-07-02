import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildAnimatedSvg({
  required String svgPath,
  required double width,
  required double height,
  required bool isDark,
}) {
  // Mobile/Desktop Fallback: Renders the SVG statically via flutter_svg
  return SvgPicture.asset(
    svgPath,
    width: width,
    height: height,
  );
}
