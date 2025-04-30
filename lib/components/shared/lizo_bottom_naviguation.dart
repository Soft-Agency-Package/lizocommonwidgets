import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lizocommonwidgets/components/widgets/build_bottom_naviguation_item.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';
import 'package:lizocommonwidgets/data/models/bottom_navigation_item.dart';

class LizoBottomNaviguation extends StatefulWidget {
  final int selectIndex;
  final List<BottomNavigationItem> bottomNavigationItems;
  final StateController<int> selectedIndexNotifier;

  const LizoBottomNaviguation({
    super.key,
    required this.selectIndex,
    required this.bottomNavigationItems,
    required this.selectedIndexNotifier,
  });

  @override
  State<LizoBottomNaviguation> createState() => _LizoBottomNaviguationState();
}

class _LizoBottomNaviguationState extends State<LizoBottomNaviguation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: LizoColor.background,
      selectedItemColor: LizoColor.primary,
      unselectedItemColor: Color(0xFF999999),
      currentIndex: widget.selectIndex,
      unselectedLabelStyle: StyleOfApp.custom(
        size: 10.0,
        weight: FontWeight.w500,
      ),
      onTap: (index) {
        widget.selectedIndexNotifier.state = index;
      },
      type: BottomNavigationBarType.fixed,
      items: List.generate(widget.bottomNavigationItems.length, (index) {
        final isSelected = widget.selectIndex == index;
        final tab = widget.bottomNavigationItems[index];
        return buildBottomNaviguationItem(
          title: tab.title,
          assetPath: tab.assetPath,
          isSelected: isSelected,
        );
      })
    );
  }
}
