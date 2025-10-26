import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Updated color palette (provided by user)
const _surface = Color(0xFF43A99F);
const _accent1 = Color(0xFF43A99F);
const _accent2 = Color(0xFF2F7785);
const _stroke = Color(0xFF305F70);
const _text = Color(0xFF2F4858);

/// Material-based app theme using the provided palette.
/// Exposes `appTheme` (ThemeData) and `appDecoration` for cards/containers.
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: _accent2,
    onPrimary: Colors.white,
    secondary: _accent1,
    onSecondary: Colors.white,
    onBackground: _text,
    onSurface: _text,
  ),
  // scaffoldBackgroundColor: _bg,
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.poppins(
      color: _text,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: const IconThemeData(color: _text),
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: _text,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _text,
    ),
    bodyMedium: GoogleFonts.inter(fontSize: 14, color: _text),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _accent2,
      foregroundColor: Colors.white,
      elevation: 4,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _surface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: _stroke),
    ),
  ),
  iconTheme: const IconThemeData(color: _text),
);

BoxDecoration appDecoration({double radius = 12}) => BoxDecoration(
  color: _surface,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: _stroke, width: 1.5),
  boxShadow: const [
    BoxShadow(offset: Offset(4, 4), blurRadius: 8, color: Color(0x22000000)),
    BoxShadow(offset: Offset(-2, -2), blurRadius: 6, color: Color(0x20FFFFFF)),
  ],
);
