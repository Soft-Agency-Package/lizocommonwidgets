import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/components/shared/lizo_icons.dart';
import 'package:lizocommonwidgets/components/widgets/build_delivery_path.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class DeliveryAddress {
  final TextEditingController? controller;
  final void Function()? onTap;
  final String hintText;

  DeliveryAddress({
    required this.hintText,
    required this.controller,
    required this.onTap,
  });
}

class DeliveryAddressView extends StatelessWidget {
  final List<DeliveryAddress> deliveryPoints;
  final double? containerHeight;
  final EdgeInsetsGeometry? containerPadding;
  final Decoration? decoration;
  final String startIconPath;
  final String middleIconPath;
  final String endIconPath;
  final String fieldIconPath;

  const DeliveryAddressView({
    super.key,
    required this.deliveryPoints,
    this.containerHeight = 200,
    this.containerPadding = const EdgeInsets.all(10),
    this.decoration = const BoxDecoration(
      color: Color(0xFFF6F4EF),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    required this.startIconPath,
    required this.middleIconPath,
    required this.endIconPath,
    required this.fieldIconPath,
  });

  @override
  Widget build(BuildContext context) {
    // Vérifier que nous avons au moins 2 points (origine et destination)
    if (deliveryPoints.length < 2) {
      throw ArgumentError(
        'DeliveryPathView requires at least 2 delivery points',
      );
    }

    return Container(
      width: double.infinity,
      // height: containerHeight,
      constraints: BoxConstraints(minHeight: containerHeight!),
      padding: containerPadding,
      decoration: decoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Colonne des icônes et lignes pointillées
          Column(children: _buildIconsAndLines()),
          // Colonne des informations de points de livraison
          Column(
            spacing: 35,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildDeliveryPointsInfo(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIconsAndLines() {
    final List<Widget> iconsAndLines = [];

    // Ajouter la première icône
    iconsAndLines.add(
      Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: LizoColor.grey, width: 1.5),
          borderRadius: BorderRadius.circular(17),
        ),
        child: SvgUtil.svgFromAsset(
                  assetName: startIconPath,
                  color: LizoColor.black,
                ),
      ),
    );

    // Ajouter les lignes et icônes intermédiaires
    for (int i = 0; i < deliveryPoints.length - 2; i++) {
      // Ajouter la ligne pointillée
      iconsAndLines.add(
        SizedBox(
          height: 35,
          child: DottedLines(
            direction: Axis.vertical,
            color: LizoColor.grey,
            dashWidth: 4,
            dashSpace: 4,
          ),
        ),
      );

      // Ajouter l'icône intermédiaire
      iconsAndLines.add(
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: LizoColor.grey, width: 1.5),
            borderRadius: BorderRadius.circular(17),
          ),
          child: SvgUtil.svgFromAsset(
                  assetName: middleIconPath,
                  color: LizoColor.black,
                ),
        ),
      );
    }

    // Ajouter la dernière ligne pointillée
    if (deliveryPoints.length > 1) {
      iconsAndLines.add(
        SizedBox(
          height: 35,
          child: DottedLines(
            direction: Axis.vertical,
            color: LizoColor.grey,
            dashWidth: 4,
            dashSpace: 4,
          ),
        ),
      );
    }

    // Ajouter la dernière icône (rouge si toutes les étapes sont complétées)
    iconsAndLines.add(
      Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: LizoColor.grey, width: 1.5),
          borderRadius: BorderRadius.circular(17),
        ),
        child: SvgUtil.svgFromAsset(
                  assetName: endIconPath,
                  color: LizoColor.black,
                ),
      ),
    );

    return iconsAndLines;
  }

  List<Widget> _buildDeliveryPointsInfo() {
    return deliveryPoints.map((point) {
      return Container(
        margin: EdgeInsets.only(left: 10),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(197, 249, 247, 245),
                border: Border.all(
                  color: const Color.fromARGB(207, 181, 175, 175),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: point.controller,
                      onTap: point.onTap,
                      style: StyleOfApp.custom(size: 13),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: point.hintText,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(onTap: point.onTap, child: SvgUtil.svgFromAsset(
                      assetName: fieldIconPath,
                      color: LizoColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
