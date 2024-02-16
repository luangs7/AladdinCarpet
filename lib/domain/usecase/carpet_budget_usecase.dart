import 'dart:math';

import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/shape.dart';

abstract class CarpetBudgetUseCase {
  Future<double> execute(Carpet carpet, double side1, double? side2);
}

class CarpetBudgetUseCaseImpl extends CarpetBudgetUseCase {
  @override
  Future<double> execute(Carpet carpet, double side1, double? side2) async {
    return getAreaFromShape(getShapeFromString(carpet.name), side1, side2);
  }

  double getAreaFromShape(Shape shape, double side1, double? side2) {
    switch (shape) {
      case Shape.CIRCULO:
        return pow(side1 / 2, 2) * pi;
      case Shape.TRIANGULO:
        return (side1 * (side2 ?? 0)) / 2;
      case Shape.RETANGULO:
        return side1 * (side2 ?? 0);
      default:
        return 0;
    }
  }
}
