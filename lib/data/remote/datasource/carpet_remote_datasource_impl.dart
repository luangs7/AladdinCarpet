import 'package:alladin/data/remote/mapper/carpet_remote_mapper.dart';
import 'package:alladin/data/remote/service/carpet_service.dart';
import 'package:alladin/data/respository/datasource/carpet_remote_datasource.dart';
import 'package:alladin/data/respository/model/carpet_repo.dart';

class CarpetRemoteDatasourceImpl extends CarpetRemoteDatasource {  
  final CarpetService service;
  final CarpetRemoteMapper mapper;

  CarpetRemoteDatasourceImpl({required this.service, required this.mapper});

  @override
  Future<List<CarpetRepo>> getPrices() async {
    return service.getPrices()
      .then((value) => value.map((e) => mapper.toRepo(e)).toList())
      .catchError ((onError) {
        throw onError;
    });    
  }
}