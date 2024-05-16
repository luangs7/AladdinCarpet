import 'package:alladin/data/remote/model/carpet_response.dart';
import 'package:alladin/data/remote/service/carpet_service.dart';

class CarpetServiceMock extends CarpetService {
  @override
  Future<List<CarpetResponse>> getPrices() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      CarpetResponse(id: 1, nome: "Circulo", valor_m2: 10.4),
      CarpetResponse(id: 2, nome: "Retangulo", valor_m2: 3.5),
      CarpetResponse(id: 3, nome: "Triangulo", valor_m2: 7.9),
    ];
  }
}
