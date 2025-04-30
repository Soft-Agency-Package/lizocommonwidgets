import 'dart:io';
import 'package:path/path.dart' as path;

void main() {
  // Chemin vers votre dossier d'icônes SVG
  final String iconsDir = 'assets/icons';

  // Vérifier si le dossier existe
  final Directory directory = Directory(iconsDir);
  if (!directory.existsSync()) {
    print('Le dossier $iconsDir n\'existe pas!');
    return;
  }

  // Récupérer tous les fichiers SVG
  final List<FileSystemEntity> entities = directory.listSync();
  final List<String> svgFiles =
      entities
          .where(
            (entity) => entity is File && path.extension(entity.path) == '.svg',
          )
          .map((entity) => path.basenameWithoutExtension(entity.path))
          .toList();

  // Trier les noms de fichiers
  svgFiles.sort();

  // Générer le contenu de la classe
  final StringBuffer buffer = StringBuffer();

  buffer.writeln('import \'package:flutter/widgets.dart\';');
  buffer.writeln('import \'package:flutter_svg/flutter_svg.dart\';');
  buffer.writeln('');
  buffer.writeln(
    '/// Classe générée automatiquement pour accéder aux icônes SVG',
  );
  buffer.writeln('class CustomIcons {');
  buffer.writeln('  CustomIcons._();');
  buffer.writeln('');

  // Générer une méthode pour chaque fichier SVG
  for (final String fileName in svgFiles) {
    final String methodName = _formatMethodName(fileName);
    buffer.writeln('  /// Icône $fileName');
    buffer.writeln(
      '  static Widget $methodName({double size = 24.0, Color? color}) {',
    );
    buffer.writeln(
      '    return _svgIcon(\'$iconsDir/$fileName.svg\', size, color);',
    );
    buffer.writeln('  }');
    buffer.writeln('');
  }

  // Ajouter la méthode helper
  buffer.writeln('  // Méthode helper pour créer un SvgPicture');
  buffer.writeln(
    '  static Widget _svgIcon(String assetName, double size, Color? color) {',
  );
  buffer.writeln('    return SvgPicture.asset(');
  buffer.writeln('      assetName,');
  buffer.writeln('      height: size,');
  buffer.writeln('      width: size,');
  buffer.writeln('      colorFilter: color != null');
  buffer.writeln('          ? ColorFilter.mode(color, BlendMode.srcIn)');
  buffer.writeln('          : null,');
  buffer.writeln('      fit: BoxFit.contain,');
  buffer.writeln('    );');
  buffer.writeln('  }');
  buffer.writeln('}');

  // Écrire le fichier généré
  final File outputFile = File('lib/config/components/custom_icons.dart');
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(buffer.toString());

  print('Classe CustomIcons générée avec ${svgFiles.length} icônes!');
}

/// Convertit un nom de fichier en nom de méthode camelCase
String _formatMethodName(String fileName) {
  // Gérer les noms avec des tirets ou des underscores
  final parts = fileName.split(RegExp(r'[-_]'));

  // Premier mot en minuscules, les autres avec première lettre majuscule
  String result = parts.first.toLowerCase();

  // Ajouter les autres parties avec première lettre majuscule
  for (int i = 1; i < parts.length; i++) {
    final part = parts[i];
    if (part.isNotEmpty) {
      result += part[0].toUpperCase() + part.substring(1).toLowerCase();
    }
  }

  return result;
}
