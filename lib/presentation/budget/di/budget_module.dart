import 'package:alladin/presentation/budget/viewmodel/budget_simulate_viewmodel.dart';
import 'package:get_it/get_it.dart';

extension BudgetModule on GetIt {
  void budgetModule() {
    registerLazySingleton(() =>
        BudgetSimulateViewModel(budgetUseCase: get(), saveUseCase: get()));
  }
}
