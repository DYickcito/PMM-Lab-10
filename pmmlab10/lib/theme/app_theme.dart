import 'package:flutter/material.dart';

class AppTheme {
  // ─── Colores ────────────────────────────────────────────────
  static const Color primaryRed = Color(0xFFE50914);
  static const Color darkBg = Color(0xFF0D0D0D);
  static const Color cardBg = Color(0xFF1A1A2E);
  static const Color cardBg2 = Color(0xFF16213E);
  static const Color cardBg3 = Color(0xFF1B1B2F);
  static const Color accentPurple = Color(0xFF7B2FBE);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textMuted = Color(0xFF6B6B6B);
  static const Color dividerColor = Color(0xFF2A2A2A);

  // ─── ThemeData global ───────────────────────────────────────
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBg,
      primaryColor: primaryRed,
      colorScheme: const ColorScheme.dark(
        primary: primaryRed,
        secondary: accentPurple,
        surface: cardBg,
        background: darkBg,
        onPrimary: textPrimary,
        onSecondary: textPrimary,
        onSurface: textPrimary,
        onBackground: textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textPrimary),
      ),
      textTheme: const TextTheme(
        // FUENTE 1: Bebas Neue — títulos grandes / display
        displayLarge: TextStyle(
          fontFamily: 'BebasNeue',
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: textPrimary,
          letterSpacing: 2.5,
        ),
        displayMedium: TextStyle(
          fontFamily: 'BebasNeue',
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: textPrimary,
          letterSpacing: 2.0,
        ),
        displaySmall: TextStyle(
          fontFamily: 'BebasNeue',
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: textPrimary,
          letterSpacing: 1.5,
        ),

        // FUENTE 2: Raleway — subtítulos / secciones
        headlineLarge: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: 0.3,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),

        // FUENTE 3: Source Sans 3 — cuerpo / descripción / UI
        bodyLarge: TextStyle(
          fontFamily: 'SourceSans3',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textPrimary,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'SourceSans3',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontFamily: 'SourceSans3',
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: textMuted,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
        labelMedium: TextStyle(
          fontFamily: 'SourceSans3',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textSecondary,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        hintStyle: const TextStyle(
          fontFamily: 'SourceSans3',
          color: textMuted,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}