import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Classe che definisce il tema dell'applicazione PedalaMente.
///
/// Contiene la palette di colori e le configurazioni di tema per l'app.
class AppTheme {
  /// Colori principali dell'applicazione
  static const Color primaryBlue = Color(0xFF0502FF);
  static const Color secondaryBlue = Color(0xFF344BFA);
  static const Color lightBlue = Color(0xFFE4EBFE);
  static const Color titleGrey = Color(0xFF333333);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color white = Color(0xFFFAFAFA);

  /// Tema chiaro dell'applicazione
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.workSans().fontFamily,
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryBlue,
        onPrimary: white,
        secondary: secondaryBlue,
        onSecondary: white,
        error: Colors.red,
        onError: white,
        surface: white,
        onSurface: Color.fromARGB(255, 136, 136, 136),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            color: titleGrey,
            fontWeight: FontWeight.w800,
            fontFamily: 'OpenSauce',
            fontSize: 48),
        displayMedium: const TextStyle(
            color: titleGrey,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSauce',
            fontSize: 36),
        displaySmall: const TextStyle(
            color: titleGrey,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSauce',
            fontSize: 24),
        headlineMedium: const TextStyle(
            color: titleGrey,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSauce',
            fontSize: 24),
        headlineSmall: const TextStyle(
            color: titleGrey,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSauce',
            fontSize: 20),
        titleLarge: const TextStyle(
            color: titleGrey,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSauce',
            fontSize: 16),
        bodyLarge: TextStyle(
            color: titleGrey,
            fontFamily: GoogleFonts.workSans().fontFamily,
            fontSize: 18,
            letterSpacing: 0.01),
        bodyMedium: TextStyle(
            color: titleGrey,
            fontFamily: GoogleFonts.workSans().fontFamily,
            fontSize: 16),
      ),
      cardTheme: CardThemeData(
        color: white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dialogTheme: const DialogThemeData(
        actionsPadding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        backgroundColor: white,
      ),
    );
  }

  /// Tema scuro dell'applicazione
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: GoogleFonts.workSans().fontFamily,
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryBlue,
        onPrimary: white,
        secondary: secondaryBlue,
        onSecondary: white,
        error: Colors.red,
        onError: white,
        surface: Colors.white,
        onSurface: white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge:
            const TextStyle(color: white, fontWeight: FontWeight.bold),
        displayMedium:
            const TextStyle(color: white, fontWeight: FontWeight.bold),
        displaySmall:
            const TextStyle(color: white, fontWeight: FontWeight.bold),
        headlineMedium:
            const TextStyle(color: white, fontWeight: FontWeight.bold),
        headlineSmall:
            const TextStyle(color: white, fontWeight: FontWeight.w600),
        titleLarge: const TextStyle(color: white, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            color: white,
            fontFamily: GoogleFonts.workSans().fontFamily,
            fontSize: 18,
            letterSpacing: 0.01),
        bodyMedium: TextStyle(
            color: white,
            fontFamily: GoogleFonts.workSans().fontFamily,
            fontSize: 16,
            letterSpacing: 0.01),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
