import 'package:alladin/common/apiresult/api_result.dart';
import 'package:alladin/common/viewevent/view_event.dart';

class BudgetEmptyView extends ViewEvent {
  BudgetEmptyView() : super("BudgetEmptyView");
}

class BudgetLoadingEvent extends ViewEvent {
  bool isLoading;

  BudgetLoadingEvent({required this.isLoading}) : super("BudgetLoadingEvent");
}

class BudgetValueEvent extends ViewEvent {
  double value;

  BudgetValueEvent({required this.value}) : super("BudgetValueEvent");
}

class BudgetSavedEvent extends ViewEvent {
  Future<ApiResult<void>> result;

  BudgetSavedEvent({required this.result}) : super("BudgetSavedEvent");
}
