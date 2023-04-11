import 'dart:convert';

class ApartamentUpdate {
  ApartamentUpdate({
    required this.area,
    required this.deposit,
    required this.realEstateRegistration,
    required this.parkings,
  });

  String area;
  String deposit;
  String realEstateRegistration;
  List<Parking> parkings;

  factory ApartamentUpdate.fromRawJson(String str) =>
      ApartamentUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApartamentUpdate.fromJson(Map<String, dynamic> json) =>
      ApartamentUpdate(
        area: json["area"],
        deposit: json["deposit"],
        realEstateRegistration: json["realEstateRegistration"],
        parkings: List<Parking>.from(
            json["parkings"].map((x) => Parking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "area": area,
        "deposit": deposit,
        "realEstateRegistration": realEstateRegistration,
        "parkings": convertListAparcamentoJson(parkings)
      };

  convertListAparcamentoJson(parking) {
    var parqueaderomap = parking.map((e) {
      return {
        "_id": e.id,
        "name": e.name,
        "realEstateRegistration": e.realEstateRegistration,
      };
    }).toList(); //convert to map
    String stringparqueadero = json.encode(parqueaderomap);
    print(stringparqueadero);
    return stringparqueadero;
  }
}

class Parking {
  Parking({
    required this.id,
    required this.name,
    required this.realEstateRegistration,
  });

  final id;
  String name;
  String realEstateRegistration;

  factory Parking.fromRawJson(String str) => Parking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        id: json["_id"],
        name: json["name"],
        realEstateRegistration: json["realEstateRegistration"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "realEstateRegistration": realEstateRegistration,
      };
}
