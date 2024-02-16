import 'package:alladin/common/apiresult/api_result.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/domain/repository/carpet_repository.dart';

abstract class GetCarpetBudgetUseCase {
  Future<ApiResult<List<CarpetBudget>>> execute();
}

class GetCarpetBudgetUseCaseImpl extends GetCarpetBudgetUseCase {
  final CarpetRepository repository;

  GetCarpetBudgetUseCaseImpl(this.repository);

  @override
  Future<ApiResult<List<CarpetBudget>>> execute() {
    return repository.getBudgets();
  }
}
