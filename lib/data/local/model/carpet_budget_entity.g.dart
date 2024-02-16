// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carpet_budget_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCarpetBudgetEntityCollection on Isar {
  IsarCollection<CarpetBudgetEntity> get carpetBudgetEntitys =>
      this.collection();
}

const CarpetBudgetEntitySchema = CollectionSchema(
  name: r'CarpetBudgetEntity',
  id: -5311495734862757561,
  properties: {
    r'shape': PropertySchema(
      id: 0,
      name: r'shape',
      type: IsarType.string,
    ),
    r'side1': PropertySchema(
      id: 1,
      name: r'side1',
      type: IsarType.string,
    ),
    r'side2': PropertySchema(
      id: 2,
      name: r'side2',
      type: IsarType.string,
    ),
    r'totalValue': PropertySchema(
      id: 3,
      name: r'totalValue',
      type: IsarType.double,
    )
  },
  estimateSize: _carpetBudgetEntityEstimateSize,
  serialize: _carpetBudgetEntitySerialize,
  deserialize: _carpetBudgetEntityDeserialize,
  deserializeProp: _carpetBudgetEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _carpetBudgetEntityGetId,
  getLinks: _carpetBudgetEntityGetLinks,
  attach: _carpetBudgetEntityAttach,
  version: '3.1.0+1',
);

int _carpetBudgetEntityEstimateSize(
  CarpetBudgetEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.shape.length * 3;
  bytesCount += 3 + object.side1.length * 3;
  bytesCount += 3 + object.side2.length * 3;
  return bytesCount;
}

void _carpetBudgetEntitySerialize(
  CarpetBudgetEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.shape);
  writer.writeString(offsets[1], object.side1);
  writer.writeString(offsets[2], object.side2);
  writer.writeDouble(offsets[3], object.totalValue);
}

CarpetBudgetEntity _carpetBudgetEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CarpetBudgetEntity(
    shape: reader.readString(offsets[0]),
    side1: reader.readString(offsets[1]),
    side2: reader.readString(offsets[2]),
    totalValue: reader.readDouble(offsets[3]),
  );
  object.id = id;
  return object;
}

P _carpetBudgetEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _carpetBudgetEntityGetId(CarpetBudgetEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _carpetBudgetEntityGetLinks(
    CarpetBudgetEntity object) {
  return [];
}

void _carpetBudgetEntityAttach(
    IsarCollection<dynamic> col, Id id, CarpetBudgetEntity object) {
  object.id = id;
}

extension CarpetBudgetEntityQueryWhereSort
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QWhere> {
  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CarpetBudgetEntityQueryWhere
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QWhereClause> {
  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CarpetBudgetEntityQueryFilter
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QFilterCondition> {
  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shape',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shape',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shape',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shape',
        value: '',
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      shapeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shape',
        value: '',
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'side1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'side1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'side1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'side1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'side1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'side1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'side1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'side1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'side1',
        value: '',
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'side1',
        value: '',
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'side2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'side2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'side2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'side2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'side2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'side2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'side2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'side2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'side2',
        value: '',
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      side2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'side2',
        value: '',
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      totalValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      totalValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      totalValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterFilterCondition>
      totalValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CarpetBudgetEntityQueryObject
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QFilterCondition> {}

extension CarpetBudgetEntityQueryLinks
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QFilterCondition> {}

extension CarpetBudgetEntityQuerySortBy
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QSortBy> {
  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortByShape() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shape', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortByShapeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shape', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortBySide1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side1', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortBySide1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side1', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortBySide2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side2', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortBySide2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side2', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortByTotalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      sortByTotalValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.desc);
    });
  }
}

extension CarpetBudgetEntityQuerySortThenBy
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QSortThenBy> {
  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenByShape() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shape', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenByShapeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shape', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenBySide1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side1', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenBySide1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side1', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenBySide2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side2', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenBySide2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'side2', Sort.desc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenByTotalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.asc);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QAfterSortBy>
      thenByTotalValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.desc);
    });
  }
}

extension CarpetBudgetEntityQueryWhereDistinct
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QDistinct> {
  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QDistinct>
      distinctByShape({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shape', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QDistinct>
      distinctBySide1({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'side1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QDistinct>
      distinctBySide2({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'side2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QDistinct>
      distinctByTotalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalValue');
    });
  }
}

extension CarpetBudgetEntityQueryProperty
    on QueryBuilder<CarpetBudgetEntity, CarpetBudgetEntity, QQueryProperty> {
  QueryBuilder<CarpetBudgetEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CarpetBudgetEntity, String, QQueryOperations> shapeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shape');
    });
  }

  QueryBuilder<CarpetBudgetEntity, String, QQueryOperations> side1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'side1');
    });
  }

  QueryBuilder<CarpetBudgetEntity, String, QQueryOperations> side2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'side2');
    });
  }

  QueryBuilder<CarpetBudgetEntity, double, QQueryOperations>
      totalValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalValue');
    });
  }
}
