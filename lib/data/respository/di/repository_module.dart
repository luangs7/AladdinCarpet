import 'package:alladin/data/respository/implementation/carpet_repository_impl.dart';
import 'package:alladin/data/respository/mapper/carpet_repo_mapper.dart';
import 'package:alladin/domain/repository/carpet_repository.dart';
import 'package:get_it/get_it.dart';

extension RepositoryModule on GetIt {
  void repositoryModule() {
    registerLazySingleton(() => CarpetRepoMapper());
    registerLazySingleton<CarpetRepository>(() => CarpetRepositoryImpl(
        remoteDatasource: get(), mapper: get(), localDatasource: get()));
  }
}
