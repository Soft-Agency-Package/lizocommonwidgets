import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/components/shared/lizo_delivery_order_summary_tile.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';
import 'package:lizocommonwidgets/data/models/order_summary_tile.dart';

class DeliveryOrderSummaryLayout extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final List<OrderSummaryTile> orderSummaryTiles;

  const DeliveryOrderSummaryLayout({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    required this.orderSummaryTiles,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60.0,
      left: 0.0,
      right: 0.0,
      child: IntrinsicHeight(
        child: Container(
          width: width,
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: LizoColor.quaternary,
            border: Border.all(color: LizoColor.quaternary, width: 2.0),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            spacing: 10.0,
            children: [
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  spacing: 18.0,
                  children: [
                    child,
                    IntrinsicWidth(
                      child: Row(
                        spacing: 5.0,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(orderSummaryTiles.length, (
                          index,
                        ) {
                          final tile = orderSummaryTiles[index];
                          return LizoDeliveryOrderSummaryTile(
                            width: width * .25,
                            height: height,
                            counter: tile.counter,
                            title: tile.title,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 5.0,
                children: [
                  SvgPicture.asset(
                    "assets/icons/info_.svg",
                    width: 14.0,
                    colorFilter: ColorFilter.mode(
                      LizoColor.black.withValues(alpha: 0.6),
                      BlendMode.srcIn,
                    ),
                    height: 14.0,
                  ),
                  Text(
                    "Total des commandes journalières",
                    style: StyleOfApp.body.copyWith(
                      color: LizoColor.black.withValues(alpha: 0.6),
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
