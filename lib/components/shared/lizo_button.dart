import 'package:flutter/material.dart';

class LizoButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final double width;
  final double height;
  final double circularRadius;
  final TextStyle textStyle;

  const LizoButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.textColor,
    required this.circularRadius,
    required this.width,
    required this.height,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
