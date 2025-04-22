import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/components/widgets/build_tab_item.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';
import 'package:lizocommonwidgets/data/models/tab_item.dart';

class TabBarLayout extends StatelessWidget {
  final TabController tabController;
  final List<TabItem> tabItems;

  const TabBarLayout({
    super.key,
    required this.tabController,
    required this.tabItems,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: LizoColor.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      labelPadding: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(0.0),
      controller: tabController,
      indicatorColor: Colors.transparent,
      unselectedLabelStyle: TextStyle(
        color: LizoColor.black.withValues(alpha: 0.6),
      ),
      labelColor: Colors.white,
      labelStyle: StyleOfApp.body.copyWith(fontSize: 13.5),
      tabs: List.generate(tabItems.length, (index) {
        final isSelected = tabController.index == index;
        final tab = tabItems[index];
        return Tab(
          child: BuildTabItem(
            title: tab.title,
            assetPath: tab.assetPath,
            isSelected: isSelected,
          ),
        );
      }),
    );
  }
}
