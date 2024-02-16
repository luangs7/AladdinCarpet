import 'package:alladin/common/apiresult/api_result.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/domain/repository/carpet_repository.dart';

abstract class SaveCarpetBudgetUseCase {
  Future<ApiResult<void>> execute(CarpetBudget budget);
}

class SaveCarpetBudgetUseCaseImpl extends SaveCarpetBudgetUseCase {
  final CarpetRepository repository;

  SaveCarpetBudgetUseCaseImpl(this.repository);

  @override
  Future<ApiResult<void>> execute(CarpetBudget budget) {
    return repository.setBudget(budget);
  }
}
