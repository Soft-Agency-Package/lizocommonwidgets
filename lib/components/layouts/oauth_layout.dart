import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';

class OauthLayout extends StatelessWidget {
  final double width;
  final Widget child;
  final double height;

  const OauthLayout({
    super.key,
    required this.width,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: LizoColor.otherBorder, width: 2.37),
      ),
      child: child,
    );
  }
}
