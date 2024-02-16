import 'package:alladin/data/respository/model/carpet_repo.dart';

abstract class CarpetRemoteDatasource {
  Future<List<CarpetRepo>> getPrices();
}