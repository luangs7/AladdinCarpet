import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/usecase/carpet_prices_usecase.dart';
import 'package:alladin/presentation/home/states/home_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<ViewEvent> {
  final CarpetPricesUseCase pricesUseCase;

  HomeCubit({required this.pricesUseCase}) : super(HomeEmptyEvent());

  static HomeCubit get(BuildContext context) => context.watch<HomeCubit>();

  static HomeCubit read(BuildContext context) => context.read<HomeCubit>();

  void getPrices() async {
    emit(HomeLoadingEvent(isLoading: true));
    final result = await pricesUseCase.execute();
    result.when(
        success: ((data) {
          emit(HomeLoadingEvent(isLoading: false));
          emit(HomeLoadedEvent(carpets: data));
        }),
        error: (e) => emit(HomeExceptionEvent(e: e)),
        empty: () => emit(HomeEmptyEvent()));
  }
}
