import 'package:alladin/data/remote/model/carpet_response.dart';
import 'package:dio/dio.dart';

abstract class CarpetService {
  Future<List<CarpetResponse>> getPrices();
}

class CarpetServiceImpl extends CarpetService {
  final Dio dio;

  CarpetServiceImpl({required this.dio});

  @override
  Future<List<CarpetResponse>> getPrices() async {
    final response = await dio.get("precos");
    return (response.data as List)
        .map((x) => CarpetResponse.fromJson(x))
        .toList();
  }
}
