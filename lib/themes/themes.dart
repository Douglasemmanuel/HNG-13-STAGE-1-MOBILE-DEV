import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🌞 LIGHT THEME
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,

    colorScheme: const ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.blue,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
    ),

    // 🧩 Card Style
  cardTheme: CardThemeData(
  color: Colors.white,
  elevation: 4,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  shadowColor: Colors.grey.shade300,
),



    // 🎨 Icon color
    iconTheme: const IconThemeData(
      color: Colors.blueAccent,
      size: 24,
    ),

    // 📝 Text style
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: const TextStyle(color: Colors.black87),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 🧭 AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    dividerColor: Colors.grey.shade300,
  );

  // 🌙 DARK THEME
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: Colors.amberAccent,

    colorScheme: const ColorScheme.dark(
      primary: Colors.amberAccent,
      secondary: Colors.amber,
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),

    // 🧩 Card Style
    cardTheme: CardThemeData(
  color: const Color(0xFF1E1E1E),
  elevation: 4,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  shadowColor: Colors.black54,
),


    // 🎨 Icon color
    iconTheme: const IconThemeData(
      color: Colors.amberAccent,
      size: 24,
    ),

    // 📝 Text style
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: const TextStyle(color: Colors.white70),
      titleLarge: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 🧭 AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    dividerColor: Colors.grey.shade700,
  );
}
