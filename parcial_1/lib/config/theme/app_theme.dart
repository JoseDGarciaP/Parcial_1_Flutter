import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getThemeData() {
    const primary = Color(0xFF2563EB);
    const secondary = Color(0xFF60A5FA);
    const background = Color(0xFFF9FAFB);
    const textPrimary = Color(0xFF111827);
    const textSecondary = Color(0xFF6B7280);
    const accent = Color(0xF59E0B00);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: background,
        onSurface: textPrimary,
        onSecondary: textSecondary,
        tertiary: accent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      scaffoldBackgroundColor: background,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textPrimary),
        bodyMedium: TextStyle(color: textSecondary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}