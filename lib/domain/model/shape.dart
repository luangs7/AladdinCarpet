import 'package:diacritic/diacritic.dart';

enum Shape { TRIANGULO, CIRCULO, RETANGULO, UNKNOWN }

Shape getShapeFromString(String shape) {
  try {
    final selectedShape = Shape.values.firstWhere(
      (e) =>
          e.name.toString().toLowerCase() ==
          removeDiacritics(shape).toLowerCase(),
    );
    return selectedShape;
  } catch (e) {
    return Shape.UNKNOWN;
  }
}
