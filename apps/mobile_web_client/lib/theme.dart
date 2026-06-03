import 'package:flutter/material.dart';

class AppColors {
  // NCERT Magenta/Pink Accent
  static const Color purple = Color(0xFFBE185D);
  static const Color purpleLight = Color(0xFFFCE7F3);
  static const Color purpleDark = Color(0xFF831843);

  // NCERT Do You Know Orange
  static const Color orange = Color(0xFFEA580C);
  static const Color orangeLight = Color(0xFFFFEDD5);
  static const Color orangeDark = Color(0xFF7C2D12);

  static const Color green = Color(0xFF10B981);
  static const Color greenLight = Color(0xFFECFDF5);
  static const Color greenDark = Color(0xFF064E3B);

  // NCERT Sky Blue Title Accent
  static const Color blue = Color(0xFF0284C7);
  static const Color blueLight = Color(0xFFE0F2FE);
  static const Color blueDark = Color(0xFF0C4A6E);

  // Soft textbook paper cream background
  static const Color bgLight = Color(0xFFFAF9F6);
  static const Color bgDark = Color(0xFF0F172A);

  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E293B);

  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF334155);

  static const Color textLightPrimary = Color(0xFF0F172A);
  static const Color textLightSecondary = Color(0xFF334155);
  static const Color textDarkPrimary = Color(0xFFF8FAFC);
  static const Color textDarkSecondary = Color(0xFFCBD5E1);
}

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgLight,
      cardColor: AppColors.cardLight,
      primaryColor: AppColors.purple,
      hintColor: AppColors.textLightSecondary,
      dividerColor: AppColors.borderLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.purple,
        secondary: AppColors.orange,
        surface: AppColors.cardLight,
        error: Colors.red,
      ),
      fontFamily: 'Outfit',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textLightPrimary, fontFamily: 'Outfit'),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textLightPrimary, fontFamily: 'Outfit'),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textLightPrimary, fontFamily: 'Outfit'),
        bodyLarge: TextStyle(fontSize: 14.5, color: AppColors.textLightPrimary, fontFamily: 'Georgia'),
        bodyMedium: TextStyle(fontSize: 12.5, color: AppColors.textLightSecondary, fontFamily: 'Georgia'),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      cardColor: AppColors.cardDark,
      primaryColor: AppColors.purple,
      hintColor: AppColors.textDarkSecondary,
      dividerColor: AppColors.borderDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.purple,
        secondary: AppColors.orange,
        surface: AppColors.cardDark,
        error: Colors.redAccent,
      ),
      fontFamily: 'Outfit',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDarkPrimary, fontFamily: 'Outfit'),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDarkPrimary, fontFamily: 'Outfit'),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDarkPrimary, fontFamily: 'Outfit'),
        bodyLarge: TextStyle(fontSize: 14.5, color: AppColors.textDarkPrimary, fontFamily: 'Georgia'),
        bodyMedium: TextStyle(fontSize: 12.5, color: AppColors.textDarkSecondary, fontFamily: 'Georgia'),
      ),
    );
  }
}
