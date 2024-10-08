import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTextTheme = TextTheme(
  headlineMedium:
      GoogleFonts.nunitoSans(fontSize: 28, fontWeight: FontWeight.bold),
  headlineSmall:
      GoogleFonts.nunitoSans(fontSize: 24, fontWeight: FontWeight.bold),
  labelMedium: GoogleFonts.nunitoSans(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
  titleLarge: GoogleFonts.nunitoSans(fontSize: 22, fontWeight: FontWeight.w400),
  titleMedium:
      GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.w500),
  titleSmall: GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.w700),
  bodyMedium: GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.w400),
  bodySmall: GoogleFonts.nunitoSans(fontSize: 12, fontWeight: FontWeight.w400),
);
