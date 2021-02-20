import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.brown,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.patrickHandTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}
