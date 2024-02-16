import 'package:alladin/data/remote/model/carpet_response.dart';
import 'package:alladin/data/respository/model/carpet_repo.dart';

class CarpetRemoteMapper {
  CarpetRepo toRepo(CarpetResponse model) {
    return CarpetRepo(
      id: model.id.toString(),
      name: model.nome,
      valorM2: model.valor_m2);
  }
}