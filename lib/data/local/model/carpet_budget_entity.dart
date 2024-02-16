import 'package:isar/isar.dart';
part 'carpet_budget_entity.g.dart';

@collection
class CarpetBudgetEntity {
  Id id = Isar.autoIncrement;
  @Name("totalValue")
  double totalValue;
  @Name("shape")
  String shape;
  @Name("side1")
  String side1;
  @Name("side2")
  String side2;

  CarpetBudgetEntity(
      {required this.totalValue,
      required this.shape,
      required this.side1,
      required this.side2});
}
