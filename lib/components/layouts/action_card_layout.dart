import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class ActionCardLayout extends StatelessWidget {
  final double width;
  final double height;
  final double marginVerticalValue;
  final Widget child;

  const ActionCardLayout({
    super.key,
    required this.width,
    required this.height,
    required this.marginVerticalValue,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: marginVerticalValue,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: StyleOfApp.cardInput,
      child: child,
    );
  }
}
