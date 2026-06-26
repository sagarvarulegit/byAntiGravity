import 'package:flutter/material.dart';
import '../theme.dart';

class BoardBadge extends StatelessWidget {
  final String text;

  const BoardBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7), // Amber light
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF59E0B), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF59E0B).withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 14, color: Color(0xFFD97706)),
          const SizedBox(width: 4),
          Text(
            text.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFFB45309),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
