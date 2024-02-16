import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/model/carpet_budget.dart';

class HistoryLoadingEvent extends ViewEvent {
  bool isLoading;

  HistoryLoadingEvent({required this.isLoading}) : super("HistoryLoadingEvent");
}

class HistoryLoadedEvent extends ViewEvent {
  List<CarpetBudget> budgets = [];

  HistoryLoadedEvent({required this.budgets}) : super("HistoryLoadedEvent");
}

class HistoryExceptionEvent extends ViewEvent {
  Exception? e;

  HistoryExceptionEvent({required this.e}) : super("HistoryExceptionEvent");
}

class HistoryEmptyEvent extends ViewEvent {
  HistoryEmptyEvent() : super("HistoryEmptyEvent");
}
