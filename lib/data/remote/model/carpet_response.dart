import 'package:json_annotation/json_annotation.dart';
part 'carpet_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CarpetResponse {
  int id;
  String nome;
  double valor_m2;

  CarpetResponse({required this.id, required this.nome, required this.valor_m2});

  factory CarpetResponse.fromJson(Map<String, dynamic> json) =>
      _$CarpetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CarpetResponseToJson(this);
}