import 'dart:ffi';

import 'package:alladin/common/apiresult/api_result.dart';
import 'package:alladin/data/respository/datasource/carpet_local_datasource.dart';
import 'package:alladin/data/respository/datasource/carpet_remote_datasource.dart';
import 'package:alladin/data/respository/mapper/carpet_repo_mapper.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/domain/repository/carpet_repository.dart';

class CarpetRepositoryImpl extends CarpetRepository {
  final CarpetRemoteDatasource remoteDatasource;
  final CarpetRepoMapper mapper;
  final CarpetLocalDatasource localDatasource;

  CarpetRepositoryImpl(
      {required this.remoteDatasource,
      required this.mapper,
      required this.localDatasource});

  @override
  Future<ApiResult<List<Carpet>>> getPrices() async {
    try {
      final result = await remoteDatasource.getPrices();
      return ApiResult.success(result.map((e) => mapper.toDomain(e)).toList());
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<CarpetBudget>>> getBudgets() async {
    try {
      final result = await localDatasource.getBudgets();
      if (result.isEmpty) {
        return ApiResult.empty();
      }
      return ApiResult.success(
          result.map((e) => mapper.budgetToDomain(e)).toList());
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<void>> setBudget(CarpetBudget budget) async {
    try {
      await localDatasource.setBudgets(mapper.budgetToRepo(budget));
      return ApiResult.success(Void);
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }
}
