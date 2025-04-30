import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';

BottomNavigationBarItem buildBottomNaviguationItem({
  required String title,
  required String assetPath,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    label: title,
    icon: SvgPicture.asset(
      assetPath,
      width: 18,
      colorFilter: ColorFilter.mode(
        isSelected ? LizoColor.primary : LizoColor.black.withValues(alpha : 0.6),
        BlendMode.srcIn,
      ),
    ),
  );
}
