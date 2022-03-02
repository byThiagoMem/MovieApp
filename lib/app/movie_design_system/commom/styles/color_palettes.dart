import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class ColorPalettes {
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = const Color(0xff16161C);
  static Color lightAccent = const Color(0xFFE82626);
  static Color darkAccent = const Color(0xFFE82626);
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = const Color(0xff1C1A29);
  static Color darkBN = const Color(0xff38354B);

  static Color white = const Color(0xffffffff);
  static Color whiteSemiTransparent = Colors.white70;
  static Color grey = Colors.grey;
  static Color darkgrey = const Color(0xFF575d66);
  static Color greyBg = const Color(0xfff0f0f0);
  static Color red = Colors.red;
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;
  static Color setActive = Colors.grey[500] ?? const Color(0xFF9E9E9E);
  static Color blueGrey = Colors.blueGrey;
  static Color black = const Color(0xFF000000);
  static Color black12 = Colors.black12;
  static Color transparent = const Color(0x00000000);

  static Color getColorCircleProgress(double s) {
    var r = ColorPalettes.red;
    if (s > 4.5 && s < 8) {
      r = ColorPalettes.yellow;
    } else if (s >= 8) {
      r = ColorPalettes.green;
    }
    return r;
  }
}
