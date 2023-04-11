import 'dart:convert';

class ResponseApartament {
  ResponseApartament({
    required this.isEnabled,
    required this.type,
    required this.realEstateRegistration,
    required this.deposit,
    required this.area,
    required this.name,
    this.parkings,
  });

  bool isEnabled;
  String type;
  String realEstateRegistration;
  String deposit;
  int area;
  String name;
  List<Parking>? parkings;

  factory ResponseApartament.fromRawJson(String str) =>
      ResponseApartament.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseApartament.fromJson(Map<String, dynamic> json) =>
      ResponseApartament(
        isEnabled: json["is_enabled"],
        type: json["type"],
        realEstateRegistration: json["realEstateRegistration"],
        deposit: json["deposit"],
        area: json["area"],
        name: json["name"],
        parkings: List<Parking>.from(
            json["parkings"].map((x) => Parking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is_enabled": isEnabled,
        "type": type,
        "realEstateRegistration": realEstateRegistration,
        "deposit": deposit,
        "area": area,
        "name": name,
        "parkings": List<dynamic>.from(parkings!.map((x) => x.toJson())),
      };
}

class Parking {
  Parking({
    required this.id,
    required this.apartment,
    required this.realEstateRegistration,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String apartment;
  String realEstateRegistration;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Parking.fromRawJson(String str) => Parking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        id: json["_id"],
        apartment: json["apartment"],
        realEstateRegistration: json["realEstateRegistration"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "apartment": apartment,
        "realEstateRegistration": realEstateRegistration,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
