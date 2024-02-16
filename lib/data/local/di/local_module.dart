import 'package:alladin/data/local/datasource/carpet_local_datasource_impl.dart';
import 'package:alladin/data/local/mapper/carpet_budget_entity_mapper.dart';
import 'package:alladin/data/local/model/carpet_budget_entity.dart';
import 'package:alladin/data/respository/datasource/carpet_local_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

extension LocalModule on GetIt {
  void localModule() {
    registerSingletonAsync(() async {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([CarpetBudgetEntitySchema], directory: dir.path);
    });
    registerLazySingleton(() => CarpetBudgetEntityMapper());
    registerLazySingleton<CarpetLocalDatasource>(
        () => CarpetLocalDatasourceImpl(get(), get()));
  }
}
