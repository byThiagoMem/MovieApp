import 'package:flutter/material.dart';

import 'color_palettes.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'IBMPlexSans',
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
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'IBMPlexSans',
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
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorPalettes.darkBN,
    ),
  );
}
