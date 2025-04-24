import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class BuildDeliveryAction extends StatelessWidget {
  final String title;
  final String assetName;
  final VoidCallback onTap;

  const BuildDeliveryAction({
    super.key,
    required this.title,
    required this.assetName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 72.0,
        child: Column(
          spacing: 12.0,
          children: [
            Container(
              alignment: Alignment.center,
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(
                color: LizoColor.primary,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: SvgPicture.asset(
                'assets/icons/$assetName.svg',
                width: 43.0,
                height: 43.0,
              ),
            ),
            Text(title, style: StyleOfApp.body.copyWith(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}
