import 'package:alladin/data/respository/model/carpet_budget_repo.dart';

abstract class CarpetLocalDatasource {
  Future<List<CarpetBudgetRepo>> getBudgets();
  Future<void> setBudgets(CarpetBudgetRepo budget);
}
