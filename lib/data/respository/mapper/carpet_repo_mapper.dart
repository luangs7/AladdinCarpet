import 'package:alladin/data/respository/model/carpet_budget_repo.dart';
import 'package:alladin/data/respository/model/carpet_repo.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/domain/model/shape.dart';

class CarpetRepoMapper {
  Carpet toDomain(CarpetRepo model) {
    return Carpet(id: model.id, name: model.name, valorM2: model.valorM2);
  }

  CarpetBudget budgetToDomain(CarpetBudgetRepo model) {
    return CarpetBudget(
        shape:
            Shape.values.firstWhere((element) => element.name == model.shape),
        totalValue: model.totalValue,
        side1: double.tryParse(model.side1) ?? 0,
        side2: double.tryParse(model.side2) ?? 0);
  }

  CarpetBudgetRepo budgetToRepo(CarpetBudget model) {
    return CarpetBudgetRepo(
        shape: model.shape.name,
        totalValue: model.totalValue,
        side1: model.side1.toString(),
        side2: model.side2.toString());
  }
}
