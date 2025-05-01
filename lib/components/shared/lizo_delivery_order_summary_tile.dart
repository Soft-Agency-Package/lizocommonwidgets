import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class LizoDeliveryOrderSummaryTile extends StatelessWidget {
  final double height;
  final double counter;
  final String title;

  const LizoDeliveryOrderSummaryTile({
    super.key,
    required this.height,
    required this.counter,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: height,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: LizoColor.quaternary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$counter", style: StyleOfApp.custom(size: 11.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: StyleOfApp.body.copyWith(
                    color: LizoColor.black.withValues(alpha: 0.6),
                    fontSize: 8.0,
                  ),
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
