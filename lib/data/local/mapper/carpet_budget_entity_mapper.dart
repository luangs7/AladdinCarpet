import 'package:alladin/data/local/model/carpet_budget_entity.dart';
import 'package:alladin/data/respository/model/carpet_budget_repo.dart';

class CarpetBudgetEntityMapper {
  CarpetBudgetRepo toRepo(CarpetBudgetEntity entity) {
    return CarpetBudgetRepo(
        shape: entity.shape,
        side1: entity.side1,
        side2: entity.side2,
        totalValue: entity.totalValue);
  }

  CarpetBudgetEntity toEntity(CarpetBudgetRepo repo) {
    return CarpetBudgetEntity(
        shape: repo.shape,
        side1: repo.side1,
        side2: repo.side2,
        totalValue: repo.totalValue);
  }
}
