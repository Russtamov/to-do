import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/product/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        textTheme: textTheme,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  TextTheme get textTheme => TextTheme(
        labelMedium: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          wordSpacing: 2,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          wordSpacing: 2,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          wordSpacing: 2,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          wordSpacing: 2,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          wordSpacing: 2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          wordSpacing: 2,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          fontSize: 18,
          wordSpacing: 2,
          fontWeight: FontWeight.w500,
        ),
      );
}
