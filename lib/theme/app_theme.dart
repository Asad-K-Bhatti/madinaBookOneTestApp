import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
      primary: const Color(0xFF1B5E20),
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFFC8E6C9),
      secondary: const Color(0xFF0D47A1),
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFBBDEFB),
      tertiary: const Color(0xFF4A148C),
      tertiaryContainer: const Color(0xFFE1BEE7),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF81C784),
      brightness: Brightness.dark,
      primary: const Color(0xFF81C784),
      onPrimary: const Color(0xFF003300),
      primaryContainer: const Color(0xFF1B5E20),
      secondary: const Color(0xFF90CAF9),
      secondaryContainer: const Color(0xFF0D47A1),
      tertiary: const Color(0xFFCE93D8),
      tertiaryContainer: const Color(0xFF4A148C),
    ),
  );
}