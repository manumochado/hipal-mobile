// To parse this JSON data, do
//
//     final munResponse = munResponseFromJson(jsonString);

import 'dart:convert';

List<MunResponse> munResponseFromJson(String str) => List<MunResponse>.from(
    json.decode(str).map((x) => MunResponse.fromJson(x)));

String munResponseToJson(List<MunResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MunResponse {
  MunResponse({
    this.codDepto,
    this.codMpio,
    this.nomMpio,
    this.tipoMunicipio,
  });

  String? codDepto;
  String? codMpio;
  String? nomMpio;
  String? tipoMunicipio;

  MunResponse copyWith({
    String? codDepto,
    String? codMpio,
    String? nomMpio,
    String? tipoMunicipio,
  }) =>
      MunResponse(
        codDepto: codDepto ?? this.codDepto,
        codMpio: codMpio ?? this.codMpio,
        nomMpio: nomMpio ?? this.nomMpio,
        tipoMunicipio: tipoMunicipio ?? this.tipoMunicipio,
      );

  factory MunResponse.fromJson(Map<String, dynamic> json) => MunResponse(
        codDepto: json["cod_depto"] == null ? null : json["cod_depto"],
        codMpio: json["cod_mpio"] == null ? null : json["cod_mpio"],
        nomMpio: json["nom_mpio"] == null ? null : json["nom_mpio"],
        tipoMunicipio:
            json["tipo_municipio"] == null ? null : json["tipo_municipio"],
      );

  Map<String, dynamic> toJson() => {
        "cod_depto": codDepto == null ? null : codDepto,
        "cod_mpio": codMpio == null ? null : codMpio,
        "nom_mpio": nomMpio == null ? null : nomMpio,
        "tipo_municipio": tipoMunicipio == null ? null : tipoMunicipio,
      };
}
