import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palettes.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    backgroundColor: ColorPalettes.lightBG,
    primaryColor: ColorPalettes.lightPrimary,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPalettes.lightAccent,
    ),
    dividerColor: ColorPalettes.darkBG,
    scaffoldBackgroundColor: ColorPalettes.lightBG,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorPalettes.lightPrimary,
      toolbarTextStyle: TextStyle(
        color: ColorPalettes.darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      titleTextStyle: GoogleFonts.sourceSansPro(
        color: ColorPalettes.darkBG,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: ColorPalettes.darkBG,
    primaryColor: ColorPalettes.darkPrimary,
    dividerColor: ColorPalettes.lightPrimary,
    scaffoldBackgroundColor: ColorPalettes.darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPalettes.darkAccent,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorPalettes.darkBG,
      toolbarTextStyle: TextStyle(
        color: ColorPalettes.lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
      titleTextStyle: GoogleFonts.sourceSansPro(
        color: ColorPalettes.lightBG,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ),
    ),
  );
}
