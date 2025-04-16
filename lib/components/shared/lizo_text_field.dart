import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class LizoTextField extends StatelessWidget {
  final String placehoder;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  const LizoTextField({
    super.key,
    required this.placehoder,
    required this.controller,
    required this.obscureText,
    required this.textInputType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      style: StyleOfApp.body.copyWith(
        color: LizoColor.black.withValues(alpha: 0.6),
      ),
      decoration: InputDecoration(
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.all(0.0),
        hintText: placehoder,
        hintStyle: StyleOfApp.body.copyWith(
          color: LizoColor.black.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
