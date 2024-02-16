import 'package:alladin/common/observer/lg_observer.dart';
import 'package:alladin/common/observer/model/observer.dart';
import 'package:alladin/domain/usecase/carpet_prices_usecase.dart';
import 'package:alladin/presentation/home/states/home_states.dart';

class HomeViewModel {
  final CarpetPricesUseCase pricesUseCase;

  HomeViewModel({required this.pricesUseCase});

  final carpetPricesState = LGObserver();

  void subscribe(Observer o) {
    carpetPricesState.observer(o);
  }

  void unsubscribe(Observer o) {
    carpetPricesState.removeObserver(o);
  }

  void getPrices() async {
    carpetPricesState.invoke(HomeLoadingEvent(isLoading: true));
    final result = await pricesUseCase.execute();
    result.when(
        success: ((data) {
          carpetPricesState.invoke(HomeLoadingEvent(isLoading: false));
          carpetPricesState.invoke(HomeLoadedEvent(carpets: data));
        }),
        error: (e) => carpetPricesState.invoke(HomeExceptionEvent(e: e)),
        empty: () => carpetPricesState.invoke(HomeEmptyEvent()));
  }
}
