import 'package:alladin/presentation/home/viewmodel/home_view_model.dart';
import 'package:get_it/get_it.dart';

extension HomeModule on GetIt {
  void homeModule() {
      registerLazySingleton(() => HomeViewModel(pricesUseCase: get()));      
  }
}