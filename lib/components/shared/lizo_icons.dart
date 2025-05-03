import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgUtil {
  /// Crée un widget SvgPicture à partir d'un chemin d'asset
  ///
  /// [assetName] est le chemin du fichier SVG dans les assets
  /// [size] définit la taille du SVG (largeur et hauteur identiques)
  /// [color] est la couleur à appliquer au SVG (optionnel)
  static Widget svgFromAsset({
    required String assetName,
    double size = 20,
    Color? color,
  }) {
    return SvgPicture.asset(
      assetName,
      height: size,
      width: size,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: BoxFit.contain,
    );
  }

  /// Crée un widget SvgPicture à partir d'une URL
  ///
  /// [url] est l'URL du fichier SVG
  /// [size] définit la taille du SVG (largeur et hauteur identiques)
  /// [color] est la couleur à appliquer au SVG (optionnel)
  static Widget svgFromUrl({required String url, double size =20, Color? color}) {
    return SvgPicture.network(
      url,
      height: size,
      width: size,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: BoxFit.contain,
    );
  }

  /// Crée un widget SvgPicture à partir d'une chaîne de caractères
  ///
  /// [svgString] est la chaîne de caractères contenant le code SVG
  /// [size] définit la taille du SVG (largeur et hauteur identiques)
  /// [color] est la couleur à appliquer au SVG (optionnel)
  static Widget svgFromString({required String svgString, double size = 20, Color? color}) {
    return SvgPicture.string(
      svgString,
      height: size,
      width: size,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: BoxFit.contain,
    );
  }
}
