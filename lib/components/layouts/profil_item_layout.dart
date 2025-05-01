import 'package:flutter/material.dart';
import 'package:lizocommonwidgets/components/widgets/build_profil_item.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';
import 'package:lizocommonwidgets/data/models/build_profil.dart';

class ProfilItemLayout extends StatelessWidget {
  final double width;
  final double verticalMargin;
  final List<BuildProfil> buildProfil;
  final Function onTap;

  const ProfilItemLayout({
    super.key,
    required this.width,
    required this.verticalMargin,
    required this.buildProfil,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(buildProfil.length, (index) {
        return Container(
          width: width,
          margin: EdgeInsets.symmetric(vertical: verticalMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buildProfil[index].title,
                style: StyleOfApp.body.copyWith(
                  color: LizoColor.black.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: LizoColor.quaternary,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: List.generate(
                    buildProfil[index].profilItems.length,
                    (itemIndex) {
                      return BuildProfilItem(
                        onTap: onTap , 
                        title: buildProfil[index].profilItems[itemIndex].title,
                        assetPath:
                            buildProfil[index].profilItems[itemIndex].assetPath,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
