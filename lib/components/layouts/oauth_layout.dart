import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';

class OauthLayout extends StatelessWidget {
  final double width;
  final Widget child;
  final double height;
  final Function onTap;
  final Color bgColor;

  const OauthLayout({
    super.key,
    required this.width,
    required this.child,
    required this.height,
    required this.onTap,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: LizoColor.otherBorder, width: 2.37),
        ),
        child: child,
      ),
    );
  }
}
