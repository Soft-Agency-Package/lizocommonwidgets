import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class BuildProfilItem extends StatelessWidget {
  final String title;
  final String assetPath;
  final Function onTap;

  const BuildProfilItem({
    super.key,
    required this.title,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child : Row(
      spacing: 5.0,
      children: [
        SvgPicture.asset(assetPath, width: 24.0, height: 24.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFD1D1D6), width: 1.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: StyleOfApp.body.copyWith(fontSize: 15.0)),
                SvgPicture.asset(
                  "assets/icons/chevron_right.svg",
                  width: 24.0,
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ],
    )
    ) ;
  }
}
