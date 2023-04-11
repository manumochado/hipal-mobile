import 'dart:convert';

List<CityResponse> cityResponseFromJson(String str) => List<CityResponse>.from(
    json.decode(str).map((x) => CityResponse.fromJson(x)));

String cityResponseToJson(List<CityResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityResponse {
  CityResponse({
    this.codDepto,
    this.dpto,
  });

  String? codDepto;
  String? dpto;

  CityResponse copyWith({
    String? codDepto,
    String? dpto,
  }) =>
      CityResponse(
        codDepto: codDepto ?? this.codDepto,
        dpto: dpto ?? this.dpto,
      );

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        codDepto: json["cod_depto"] == null ? null : json["cod_depto"],
        dpto: json["dpto"] == null ? null : json["dpto"],
      );

  Map<String, dynamic> toJson() => {
        "cod_depto": codDepto == null ? null : codDepto,
        "dpto": dpto == null ? null : dpto,
      };
}
