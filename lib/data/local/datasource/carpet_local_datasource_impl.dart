import 'package:alladin/data/local/mapper/carpet_budget_entity_mapper.dart';
import 'package:alladin/data/local/model/carpet_budget_entity.dart';
import 'package:alladin/data/respository/datasource/carpet_local_datasource.dart';
import 'package:alladin/data/respository/model/carpet_budget_repo.dart';
import 'package:isar/isar.dart';

class CarpetLocalDatasourceImpl extends CarpetLocalDatasource {
  final Isar isar;
  final CarpetBudgetEntityMapper mapper;

  CarpetLocalDatasourceImpl(this.isar, this.mapper);

  @override
  Future<List<CarpetBudgetRepo>> getBudgets() async {
    final result = await isar.carpetBudgetEntitys
        .filter()
        .totalValueGreaterThan(0)
        .findAll();
    return result.map((e) => mapper.toRepo(e)).toList();
  }

  @override
  Future<void> setBudgets(CarpetBudgetRepo budget) {
    return isar
        .writeTxn(() => isar.carpetBudgetEntitys.put(mapper.toEntity(budget)));
  }
}
