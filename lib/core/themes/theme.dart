import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _bg = Color(0xFFF5F7FB);
const _surface = Color(0xFFE8EEF8);
const _accent1 = Color(0xFFFF5C7C);
const _accent2 = Color(0xFF00BCD4);
const _stroke = Color(0xFFBFC9D9);
const _text = Color(0xFF0F1724);

final neubrutalTheme = ThemeData(
  scaffoldBackgroundColor: _bg,
  primaryColor: _accent2,
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
  appBarTheme: const AppBarTheme(
    backgroundColor: _bg,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: _text,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(color: _text),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _surface,
      foregroundColor: _text,
      elevation: 6,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(width: 2, color: _stroke),
      ),
    ),
  ),
  // cardTheme: const CardTheme(
  //   color: _surface,
  //   elevation: 6,
  //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(12)),
  //     side: BorderSide(color: _stroke, width: 3),
  //   ),
  // ),
);

BoxDecoration neubrutalDecoration({double radius = 12}) => BoxDecoration(
  color: _surface,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: _stroke, width: 3),
  boxShadow: const [
    BoxShadow(offset: Offset(6, 6), blurRadius: 8, color: Color(0x22000000)),
    BoxShadow(offset: Offset(-4, -4), blurRadius: 6, color: Color(0x20FFFFFF)),
  ],
);
