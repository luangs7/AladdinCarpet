import 'package:alladin/domain/model/shape.dart';

class CarpetBudget {
  double totalValue;
  Shape shape;
  double side1;
  double? side2;

  CarpetBudget(
      {required this.totalValue,
      required this.shape,
      required this.side1,
      required this.side2});
}
