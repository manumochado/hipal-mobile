// To parse this JSON data, do
//
//     final typeZone = typeZoneFromJson(jsonString);

import 'dart:convert';

class TypeZone {
  TypeZone({
    required this.id,
    required this.enabled,
    required this.schedule,
    required this.color,
    required this.maxPersons,
    required this.costPerHour,
    required this.isFree,
    required this.description,
    required this.name,
    required this.residential,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  bool? enabled;
  List<Schedule>? schedule;
  String? color;
  int? maxPersons;
  double? costPerHour;
  bool? isFree;
  String? description;
  String? name;
  Residential? residential;
  Image? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TypeZone.fromRawJson(String str) =>
      TypeZone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeZone.fromJson(Map<String, dynamic> json) => TypeZone(
        id: json["_id"] == null ? null : json["_id"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        schedule: json["schedule"] == null
            ? null
            : List<Schedule>.from(
                json["schedule"].map((x) => Schedule.fromJson(x))),
        color: json["color"] == null ? null : json["color"],
        maxPersons: json["max_persons"] == null ? null : json["max_persons"],
        costPerHour: json["cost_per_hour"] == null
            ? null
            : json["cost_per_hour"].toDouble(),
        isFree: json["is_free"] == null ? null : json["is_free"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        residential: json["residential"] == null
            ? null
            : Residential.fromJson(json["residential"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "enabled": enabled == null ? null : enabled,
        "schedule": schedule == null
            ? null
            : List<dynamic>.from(schedule!.map((x) => x.toJson())),
        "color": color == null ? null : color,
        "max_persons": maxPersons == null ? null : maxPersons,
        "cost_per_hour": costPerHour == null ? null : costPerHour,
        "is_free": isFree == null ? null : isFree,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "residential": residential == null ? null : residential?.toJson(),
        "image": image == null ? null : image?.toJson(),
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}

class Image {
  Image({
    required this.id,
    required this.url,
  });

  String id;
  String url;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["_id"] == null ? null : json["_id"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "url": url == null ? null : url,
      };
}

class Residential {
  Residential({
    required this.id,
    required this.isEnabled,
    required this.typeParking,
    required this.plan,
    required this.city,
    required this.address,
    required this.description,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  bool isEnabled;
  String typeParking;
  String plan;
  String city;
  String address;
  String description;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory Residential.fromRawJson(String str) =>
      Residential.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        id: json["_id"] == null ? null : json["_id"],
        isEnabled: json["is_enabled"] == null ? null : json["is_enabled"],
        typeParking: json["typeParking"] == null ? null : json["typeParking"],
        plan: json["plan"] == null ? null : json["plan"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "is_enabled": isEnabled == null ? null : isEnabled,
        "typeParking": typeParking == null ? null : typeParking,
        "plan": plan == null ? null : plan,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Schedule {
  Schedule({
    required this.days,
    required this.availability,
  });

  List<String>? days;
  List<Availability>? availability;

  factory Schedule.fromRawJson(String str) =>
      Schedule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  List<int> get availableAllowedHours {
    final allowed_hours = (availability ?? []).map((e) => e.allowedHours);
    final uniqueValues = allowed_hours.toSet().toList();
    ;
    uniqueValues.sort();
    return uniqueValues;
  }

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        days: json["days"] == null
            ? null
            : List<String>.from(json["days"].map((x) => x)),
        availability: json["availability"] == null
            ? null
            : List<Availability>.from(
                json["availability"].map((x) => Availability.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "days": days == null ? null : List<dynamic>.from(days!.map((x) => x)),
        "availability": availability == null
            ? null
            : List<dynamic>.from(availability!.map((x) => x.toJson())),
      };
}

class Availability {
  Availability(
      {required this.start,
      required this.end,
      required this.allowedHours,
      required this.enabled_hours});

  String start;
  String end;
  List<EnabledHours>? enabled_hours;
  int allowedHours;

  factory Availability.fromRawJson(String str) =>
      Availability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        start: json["start"] == null ? null : json["start"],
        end: json["end"] == null ? null : json["end"],
        allowedHours:
            json["allowed_hours"] == null ? null : json["allowed_hours"],
        enabled_hours: json["enabled_hours"] == null
            ? null
            : List<EnabledHours>.from(
                json["enabled_hours"].map((x) => EnabledHours.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start": start == null ? null : start,
        "end": end == null ? null : end,
        "allowed_hours": allowedHours == null ? null : allowedHours,
        "enabled_hours": enabled_hours == null
            ? null
            : List<dynamic>.from(enabled_hours!.map((x) => x.toJson())),
      };
}

class EnabledHours {
  EnabledHours({
    required this.start,
    required this.end,
    required this.available_reserves,
  });

  String start;
  String end;
  int? available_reserves;

  factory EnabledHours.fromRawJson(String str) =>
      EnabledHours.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnabledHours.fromJson(Map<String, dynamic> json) => EnabledHours(
        start: json["start"] == null ? null : json["start"],
        end: json["end"] == null ? null : json["end"],
        available_reserves: json["available_reserves"] == null
            ? null
            : json["available_reserves"],
      );

  Map<String, dynamic> toJson() => {
        "start": start == null ? null : start,
        "end": end == null ? null : end,
        "available_reserves":
            available_reserves == null ? null : available_reserves,
      };
}
