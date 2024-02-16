import 'package:alladin/common/apiresult/api_result.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/carpet_budget.dart';

abstract class CarpetRepository {
  Future<ApiResult<List<Carpet>>> getPrices();
  Future<ApiResult<List<CarpetBudget>>> getBudgets();
  Future<ApiResult<void>> setBudget(CarpetBudget budget);
}
