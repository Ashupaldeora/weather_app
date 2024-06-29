import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(),
    textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600)),
        headlineSmall: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        headlineLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        headlineMedium: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600))));
