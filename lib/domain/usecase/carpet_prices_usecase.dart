import 'package:alladin/common/apiresult/api_result.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/repository/carpet_repository.dart';

abstract class CarpetPricesUseCase {
  Future<ApiResult<List<Carpet>>> execute();
}

class CarpetPricesUseCaseImpl extends CarpetPricesUseCase {
  final CarpetRepository repository;

  CarpetPricesUseCaseImpl({required this.repository});

  @override
  Future<ApiResult<List<Carpet>>> execute() async {
    return repository.getPrices();
  }
}
