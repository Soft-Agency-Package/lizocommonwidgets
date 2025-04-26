import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class LizoProfilCard extends StatelessWidget {
  final double width;

  LizoProfilCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: LizoColor.otherBorder, width: 2.0),
      ),
      child: Column(
        spacing: 10.0,
        children: [
          Container(
            width: width,
            height: 110.0,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 14.0,
            ),
            decoration: BoxDecoration(
              color: LizoColor.otherBorder,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 14.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Koffi Alexis Marc", style: StyleOfApp.body),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1.5,
                          horizontal: 4.5,
                        ),
                        decoration: BoxDecoration(
                          color: LizoColor.quaternary,
                          borderRadius: BorderRadius.circular(6.2),
                        ),
                        child: Row(
                          spacing: 5.0,
                          children: [
                            SvgPicture.asset(
                              "assets/images/trophy_star.svg",
                              width: 8.06,
                            ),
                            Text(
                              "NIveau 5 / 5",
                              style: StyleOfApp.body.copyWith(fontSize: 7.88),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: LizoColor.quaternary,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: LizoColor.inputBorderColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Améliore ton niveau en étant bien noté pour tes livraisons 👌🛵",
            style: StyleOfApp.body.copyWith(
              fontSize: 11.0,
              color: LizoColor.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
