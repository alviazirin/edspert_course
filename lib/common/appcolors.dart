import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF357AD4);
  static const Color secondary = Color(0xFF27B1E0);
  static const Color title = Color(0xFF14142B);
  static const Color body = Color(0xFF4E4B66);
  static const Color label = Color(0xFF85868B);
  static const Color placeholder = Color(0xFFBFC0C2);
  static const Color line = Color(0xFFE4E4E5);
  static const Color inputBackground = Color(0xFFF6F6F6);
  static const Color background = Color(0xFFF9F9F9);
  static const Color offWhite = Color(0xFFFCFCFC);
  static const Color greenSuccess = Color(0xFF00BA4A);
  static const Color yellowWarning = Color(0xFFFFCC47);
  static const Color blackButton = Color(0xFF1A1F26);

  static final ThemeData appThemeData = ThemeData(
    primaryColor: primary,
    secondaryHeaderColor: secondary,
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(color: title),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: title),
      bodyMedium: TextStyle(color: body),
      labelMedium: TextStyle(color: label),
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      background: background,
      secondary: secondary,
      onBackground: offWhite,
    ),
  );
}
