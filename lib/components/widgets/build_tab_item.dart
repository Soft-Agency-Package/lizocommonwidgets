import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';

class BuildTabItem extends StatelessWidget {
  final String title;
  final String assetPath;
  final bool isSelected;

  const BuildTabItem({
    super.key,
    required this.title,
    required this.assetPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.0,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetPath,
          width: 18,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : LizoColor.black.withValues(alpha: 0.6),
            BlendMode.srcIn,
          ),
        ),
        Text(title),
      ],
    );
  }
}
