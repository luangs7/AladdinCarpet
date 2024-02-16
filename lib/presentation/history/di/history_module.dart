import 'package:alladin/presentation/history/viewmodel/history_view_model.dart';
import 'package:get_it/get_it.dart';

extension HistoryModule on GetIt {
  void historyModule() {
    registerLazySingleton(() => HistoryViewModel(getUseCase: get()));
  }
}
