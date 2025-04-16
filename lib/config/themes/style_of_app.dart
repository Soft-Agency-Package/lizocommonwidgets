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
}
