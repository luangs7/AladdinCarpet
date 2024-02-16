import 'package:alladin/data/remote/datasource/carpet_remote_datasource_impl.dart';
import 'package:alladin/data/remote/mapper/carpet_remote_mapper.dart';
import 'package:alladin/data/remote/service/carpet_service.dart';
import 'package:alladin/data/respository/datasource/carpet_remote_datasource.dart';
import 'package:alladin/flavors/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

extension RemoteModule on GetIt {
  void remoteModule() {
    registerLazySingleton(() => configureDio());
    registerLazySingleton(() => CarpetRemoteMapper());
    registerLazySingleton<CarpetService>(() => CarpetServiceImpl(dio: get()));
    registerLazySingleton<CarpetRemoteDatasource>(() => CarpetRemoteDatasourceImpl(service: get(), mapper: get()));
  }
  
  Dio configureDio() {
    final options = BaseOptions(
      baseUrl: FlavorConfig.instance.values.apiBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    final dio = Dio(options);
    dio.options.followRedirects = true;

    return dio;
  }
}