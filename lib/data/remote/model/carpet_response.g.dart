// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carpet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarpetResponse _$CarpetResponseFromJson(Map<String, dynamic> json) =>
    CarpetResponse(
      id: json['id'] as int,
      nome: json['nome'] as String,
      valor_m2: (json['valor_m2'] as num).toDouble(),
    );

Map<String, dynamic> _$CarpetResponseToJson(CarpetResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'valor_m2': instance.valor_m2,
    };
