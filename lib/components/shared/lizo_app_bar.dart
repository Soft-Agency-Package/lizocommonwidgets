import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lizocommonwidgets/components/layouts/tab_bar_layout.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';
import 'package:lizocommonwidgets/data/models/tab_item.dart';

class LizoAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  final String title;
  final StateController<int> selectedIndexNotifier;
  final double width;
  final List<TabItem> tabItems;
  final int selectedIndex;

  const LizoAppBar({
    super.key,
    required this.title,
    required this.selectedIndexNotifier,
    required this.width,
    required this.tabItems,
    required this.selectedIndex,
    required this.tabController,
  });

  @override
  State<LizoAppBar> createState() => _LizoAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _LizoAppBarState extends State<LizoAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        widget.title,
        style: StyleOfApp.largeTile.copyWith(fontSize: 20.0),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Column(
          children: [
            Container(height: 1.0, color: LizoColor.inputBorderColor),
            TabBarLayout(
              tabController: widget.tabController,
              tabItems: widget.tabItems,
              width: widget.width,
              height: 35.0,
              selectedIndex: widget.selectedIndex,
              onTabChanged: (index) {
                widget.selectedIndexNotifier.state = index;
              },
            ),
          ],
        ),
      ),
    );
  }
}
