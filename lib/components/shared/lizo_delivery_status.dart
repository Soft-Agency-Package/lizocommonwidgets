import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';

class LizoDeliveryStatus extends StatelessWidget {
  final String titleBold;
  final String titleHighlight;
  final String availabilityLabel;
  final String availabilityStatus;
  final bool isRow;
  final double width;
  final List<Widget> children;

  const LizoDeliveryStatus({
    super.key,
    required this.titleBold,
    required this.titleHighlight,
    required this.availabilityLabel,
    required this.availabilityStatus,
    required this.isRow,
    required this.width,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: LizoColor.secondary,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child:
          isRow
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
    );
  }
}
