import 'package:alladin/domain/usecase/carpet_budget_get_usecase.dart';
import 'package:alladin/domain/usecase/carpet_budget_save_usecase.dart';
import 'package:alladin/domain/usecase/carpet_budget_usecase.dart';
import 'package:alladin/domain/usecase/carpet_prices_usecase.dart';
import 'package:get_it/get_it.dart';

extension DomainModule on GetIt {
  void domainModule() {
    registerLazySingleton<CarpetPricesUseCase>(
        () => CarpetPricesUseCaseImpl(repository: get()));
    registerLazySingleton<CarpetBudgetUseCase>(() => CarpetBudgetUseCaseImpl());
    registerLazySingleton<GetCarpetBudgetUseCase>(
        () => GetCarpetBudgetUseCaseImpl(get()));

    registerLazySingleton<SaveCarpetBudgetUseCase>(
        () => SaveCarpetBudgetUseCaseImpl(get()));
  }
}
