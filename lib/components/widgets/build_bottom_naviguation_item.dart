import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

BottomNavigationBarItem buildBottomNaviguationItem({
  required String title,
  required String assetPath,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    icon: Column(
      spacing: 5.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          assetPath,
          width: 24.0,
          height: 24.0,
          colorFilter: ColorFilter.mode(
            isSelected ? LizoColor.primary : LizoColor.grey,
            BlendMode.srcIn,
          ),
        ),
        Text(
          title,
          style: StyleOfApp.custom(
            size: 10.0,
            weight: FontWeight.w500,
            color: isSelected ? LizoColor.primary : LizoColor.grey,
          ),
        ),
      ],
    ),
  );
}
