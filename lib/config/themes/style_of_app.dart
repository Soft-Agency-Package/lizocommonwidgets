import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';

class StyleOfApp {
  static const String primaryFont = 'Montserrat';

  // font size
  static const double footerNote = 13;

  //  title

  static TextStyle largeTile = TextStyle(
    fontSize: 37,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFont,
    color: LizoColor.black,
  );

  // body
  static TextStyle body = TextStyle(fontSize: 17, fontWeight: FontWeight.w400);

  // input style
  static BoxDecoration cardInput = BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    color: LizoColor.inputBgColor,
    border: Border.all(color: LizoColor.inputBorderColor, width: 2.0),
  );

  // custom style
  static TextStyle custom({
    required double size,
    FontWeight weight = FontWeight.w400,
    Color color = Colors.black,
    String font = primaryFont,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      fontFamily: font,
    );
  }
}
