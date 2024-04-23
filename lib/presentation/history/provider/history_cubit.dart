import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/usecase/carpet_budget_get_usecase.dart';
import 'package:alladin/presentation/history/states/history_states.dart';
import 'package:bloc/bloc.dart';

class HistoryCubit extends Cubit<ViewEvent> {
  final GetCarpetBudgetUseCase getUseCase;

  HistoryCubit({required this.getUseCase}) : super(HistoryEmptyEvent());

  void getHistory() async {
    emit(HistoryLoadingEvent(isLoading: true));
    final result = await getUseCase.execute();
    result.when(
        success: (data) {
          emit(HistoryLoadedEvent(budgets: data));
        },
        error: (e) => emit(HistoryExceptionEvent(e: e)),
        empty: () => emit(HistoryEmptyEvent()));
  }
}
