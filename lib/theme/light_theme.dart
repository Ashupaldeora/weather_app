import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Color(0xff5B95F6),
      secondary: Color(0xff83B1FB),
      tertiary: Colors.white,
      secondaryContainer: Colors.white,
    ),
    textTheme: TextTheme(
        displaySmall: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 13,
                fontWeight: FontWeight.w500)),
        titleMedium: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.blue, fontSize: 13, fontWeight: FontWeight.w500)),
        titleSmall: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500)),
        labelLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        labelMedium: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        displayMedium: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        displayLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600)),
        headlineSmall: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        headlineLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        headlineMedium: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600))));
