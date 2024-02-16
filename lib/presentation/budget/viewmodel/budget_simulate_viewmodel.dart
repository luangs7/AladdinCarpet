import 'package:alladin/common/observer/lg_observer.dart';
import 'package:alladin/common/observer/model/observer.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/domain/model/shape.dart';
import 'package:alladin/domain/usecase/carpet_budget_save_usecase.dart';
import 'package:alladin/domain/usecase/carpet_budget_usecase.dart';

class BudgetSimulateViewModel {
  final CarpetBudgetUseCase budgetUseCase;
  final SaveCarpetBudgetUseCase saveUseCase;

  BudgetSimulateViewModel(
      {required this.budgetUseCase, required this.saveUseCase});

  final carpetBudgetState = LGObserver();

  void subscribe(Observer o) {
    carpetBudgetState.observer(o);
  }

  void unsubscribe(Observer o) {
    carpetBudgetState.removeObserver(o);
  }

  void getValue(Carpet carpet, double side1, double? side2) async {
    // carpetBudgetState.invoke(value)// loading
    final result = await budgetUseCase.execute(carpet, side1, side2);
    carpetBudgetState.invoke(result);
  }

  void save(
      Carpet carpet, double side1, double? side2, double totalValue) async {
    final shape = getShapeFromString(carpet.name);
    final result = saveUseCase.execute(CarpetBudget(
        totalValue: totalValue, shape: shape, side1: side1, side2: side2));
    carpetBudgetState.invoke(result);
  }
}
