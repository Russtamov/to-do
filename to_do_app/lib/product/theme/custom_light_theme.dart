import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/product/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lexend().fontFamily,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        textTheme: textTheme,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  TextTheme get textTheme => TextTheme(
        labelMedium: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      );
}
