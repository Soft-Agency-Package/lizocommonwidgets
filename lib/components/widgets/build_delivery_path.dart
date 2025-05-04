import 'package:flutter/widgets.dart';

import 'package:lizocommonwidgets/config/themes/colors.dart';

class DeliveryPoint {
  final Text label;
  final Text address;

  DeliveryPoint({required this.label, required this.address});
}


class DeliveryPathView extends StatelessWidget {
  final List<DeliveryPoint> deliveryPoints;
  final List<bool> completedSteps;
  final Widget activeIcon;
  final Widget inactiveIcon;
  final double? containerHeight;
  final EdgeInsetsGeometry? containerPadding;
  final Decoration? decoration;

  const DeliveryPathView({
    super.key,
    required this.deliveryPoints,
    this.completedSteps = const [],
    this.containerHeight = 250,
    this.containerPadding = const EdgeInsets.all(10),
    this.decoration = const BoxDecoration(
      color: Color(0xFFF6F4EF),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ), required this.activeIcon, required this.inactiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Vérifier que nous avons au moins 2 points (origine et destination)
    if (deliveryPoints.length < 2) {
      throw ArgumentError(
        'DeliveryPathView requires at least 2 delivery points',
      );
    }

    // Calculer les statuts des étapes
    final stepsStatus = List<bool>.filled(deliveryPoints.length, false);
    for (int i = 0; i < completedSteps.length && i < stepsStatus.length; i++) {
      stepsStatus[i] = completedSteps[i];
    }

    return Container(
      width: double.infinity,
      height: containerHeight,
      padding: containerPadding,
      decoration: decoration,
      child: Row(
        children: [
          // Colonne des icônes et lignes pointillées
          Column(children: _buildIconsAndLines(stepsStatus)),
          // Colonne des informations de points de livraison
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildDeliveryPointsInfo(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIconsAndLines(List<bool> stepsStatus) {
    final List<Widget> iconsAndLines = [];

    // Ajouter la première icône
    iconsAndLines.add(
      stepsStatus.isNotEmpty && stepsStatus[0]
          ? activeIcon
          : inactiveIcon
    );

    // Ajouter les lignes et icônes intermédiaires
    for (int i = 0; i < deliveryPoints.length - 2; i++) {
      // Ajouter la ligne pointillée
      iconsAndLines.add(
        Expanded(
          child: DottedLines(
            direction: Axis.vertical,
            color:
                i < stepsStatus.length && stepsStatus[i]
                    ? LizoColor.primary
                    : LizoColor.grey,
            dashWidth: 4,
            dashSpace: 4,
          ),
        ),
      );

      // Ajouter l'icône intermédiaire
      iconsAndLines.add(
        i + 1 < stepsStatus.length && stepsStatus[i + 1]
            ? activeIcon
            : inactiveIcon
      );
    }

    // Ajouter la dernière ligne pointillée
    if (deliveryPoints.length > 1) {
      iconsAndLines.add(
        Expanded(
          child: DottedLines(
            direction: Axis.vertical,
            color:
                stepsStatus.isNotEmpty && stepsStatus.every((status) => status)
                    ? LizoColor.primary
                    : LizoColor.grey,
            dashWidth: 4,
            dashSpace: 4,
          ),
        ),
      );
    }

    // Ajouter la dernière icône (rouge si toutes les étapes sont complétées)
    final allStepsCompleted =
        stepsStatus.isNotEmpty && stepsStatus.every((status) => status);
    iconsAndLines.add(
      allStepsCompleted ? activeIcon : inactiveIcon,
    );

    return iconsAndLines;
  }

  List<Widget> _buildDeliveryPointsInfo() {
    return deliveryPoints.map((point) {
      return Container(
        margin: EdgeInsets.only(left: 20),
        width: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            point.label,
            point.address,
            // Text(point.label, style: StyleOfApp.custom(size: 17)),
            // Text(
            //   point.address,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            //   style: StyleOfApp.custom(size: 15, color: Colors.grey),
            // ),
          ],
        ),
      );
    }).toList();
  }
}


class DottedLines extends StatelessWidget {
  final Axis direction;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DottedLines({
    super.key,
    required this.direction,
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight =
            direction == Axis.vertical
                ? constraints.constrainHeight()
                : constraints.constrainWidth();
        final dashCount = (boxHeight / (dashWidth + dashSpace)).floor();

        return Flex(
          direction: direction,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(
              width: direction == Axis.vertical ? 2 : dashWidth,
              height: direction == Axis.vertical ? dashWidth : 2,
              color: color,
            );
          }),
        );
      },
    );
  }
}
