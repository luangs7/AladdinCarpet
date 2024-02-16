import 'package:alladin/common/observer/lg_observer.dart';
import 'package:alladin/common/observer/model/observer.dart';
import 'package:alladin/domain/usecase/carpet_budget_get_usecase.dart';
import 'package:alladin/presentation/history/states/history_states.dart';

class HistoryViewModel {
  final GetCarpetBudgetUseCase getUseCase;

  HistoryViewModel({required this.getUseCase});

  final carpetHistoryState = LGObserver();

  void subscribe(Observer o) {
    carpetHistoryState.observer(o);
  }

  void unsubscribe(Observer o) {
    carpetHistoryState.removeObserver(o);
  }

  void getHistory() async {
    carpetHistoryState.invoke(HistoryLoadingEvent(isLoading: true));
    final result = await getUseCase.execute();
    result.when(
        success: (data) {
          carpetHistoryState.invoke(HistoryLoadedEvent(budgets: data));
        },
        error: (e) => carpetHistoryState.invoke(HistoryExceptionEvent(e: e)),
        empty: () => carpetHistoryState.invoke(HistoryEmptyEvent()));
  }
}
