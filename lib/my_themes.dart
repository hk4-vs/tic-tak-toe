import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme() {
    return ThemeData(
        highlightColor: const Color(0xffFF6531),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Color.fromARGB(255, 40, 43, 46),
            secondary: Color(0xffB83B5E),
            onSecondary: Color(0xffB83B6F),
            error: Color(0xffB83B5E),
            onError: Color(0xffB83B5E),
            background: Color.fromARGB(255, 222, 235, 250),
            onBackground: Color.fromARGB(255, 182, 218, 234),
            surface: Color(0xffF5F0BB),
            onSurface: Color(0xffDBDFAA)),
        textTheme: TextTheme(
            titleMedium: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w400, fontSize: 30, color: Colors.black),
            titleSmall: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w600,
              fontSize: 34,
              color: Colors.black,
            ),
            headlineSmall: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w600, color: Colors.black),
            bodyLarge: GoogleFonts.ebGaramond(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.black),
            bodyMedium: GoogleFonts.josefinSans(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            bodySmall: GoogleFonts.josefinSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)));
  }

  static ThemeData darkTheme() {
    return ThemeData(
        highlightColor: const Color(0xffFF6531),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.white,
            onPrimary: Color(0xff9BABB8),
            secondary: Color(0xffB83B5E),
            onSecondary: Color(0xffB83B6F),
            error: Color(0xffB83B5E),
            onError: Color(0xffB83B5E),
            background: Color(0xff18202A),
            onBackground: Color(0xff36474F),
            surface: Color(0xffF5F0BB),
            onSurface: Color(0xffDBDFAA)),
        textTheme: TextTheme(
            titleMedium: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w400, fontSize: 30, color: Colors.white),
            titleSmall: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w600,
              fontSize: 34,
              color: Colors.white,
            ),
            headlineSmall: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w600, color: Colors.white),
            bodyLarge: GoogleFonts.ebGaramond(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
            bodyMedium: GoogleFonts.josefinSans(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            bodySmall: GoogleFonts.josefinSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)));
  }
}
