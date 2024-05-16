import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/domain/model/shape.dart';
import 'package:alladin/domain/usecase/carpet_budget_save_usecase.dart';
import 'package:alladin/domain/usecase/carpet_budget_usecase.dart';
import 'package:alladin/presentation/budget/states/budget_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetCubit extends Cubit<ViewEvent> {
  final SaveCarpetBudgetUseCase saveUseCase;
  final CarpetBudgetUseCase budgetUseCase;

  BudgetCubit({required this.saveUseCase, required this.budgetUseCase})
      : super(BudgetEmptyView());

  void save(
      Carpet carpet, double side1, double? side2, double totalValue) async {
    final shape = getShapeFromString(carpet.name);
    final result = saveUseCase.execute(CarpetBudget(
        totalValue: totalValue, shape: shape, side1: side1, side2: side2));
    emit(BudgetSavedEvent(result: result));
  }

  void getValue(Carpet carpet, double side1, double? side2) async {
    emit(BudgetLoadingEvent(isLoading: true));
    final result = await budgetUseCase.execute(carpet, side1, side2);
    emit(BudgetValueEvent(value: result));
  }
}
