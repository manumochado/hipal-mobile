import 'dart:convert';

class CommonZone {
  CommonZone({
    required this.id,
    required this.enabled,
    required this.name,
    required this.description,
    required this.isFree,
    required this.costPerHour,
    required this.maxPersons,
    required this.color,
    required this.image,
    required this.residential,
    required this.schedule,
  });

  String id;
  bool enabled;
  String name;
  String description;
  bool isFree;
  double costPerHour;
  int maxPersons;
  String color;
  Image? image;
  Residential? residential;
  List<Schedule>? schedule;

  factory CommonZone.fromRawJson(String str) =>
      CommonZone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommonZone.fromJson(Map<String, dynamic> json) => CommonZone(
        id: json["_id"] == null ? null : json["_id"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        isFree: json["is_free"] == null ? null : json["is_free"],
        costPerHour: json["cost_per_hour"] == null
            ? null
            : json["cost_per_hour"].toDouble(),
        maxPersons: json["max_persons"] == null ? null : json["max_persons"],
        color: json["color"] == null ? null : json["color"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        residential: json["residential"] == null
            ? null
            : Residential.fromJson(json["residential"]),
        schedule: json["schedule"] == null
            ? null
            : List<Schedule>.from(
                json["schedule"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "enabled": enabled == null ? null : enabled,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "is_free": isFree == null ? null : isFree,
        "cost_per_hour": costPerHour == null ? null : costPerHour,
        "max_persons": maxPersons == null ? null : maxPersons,
        "color": color == null ? null : color,
        "image": image == null ? null : image?.toJson(),
        "residential": residential == null ? null : residential?.toJson(),
        "schedule": schedule == null
            ? null
            : List<dynamic>.from(schedule!.map((x) => x.toJson())),
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
  Availability({
    required this.allowedHours,
    required this.start,
    required this.end,
    required this.enabledHours,
  });

  int allowedHours;
  String start;
  String end;
  List<EnabledHour>? enabledHours;

  factory Availability.fromRawJson(String str) =>
      Availability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        allowedHours:
            json["allowed_hours"] == null ? null : json["allowed_hours"],
        start: json["start"] == null ? null : json["start"],
        end: json["end"] == null ? null : json["end"],
        enabledHours: json["enabled_hours"] == null
            ? null
            : List<EnabledHour>.from(
                json["enabled_hours"].map((x) => EnabledHour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "allowed_hours": allowedHours == null ? null : allowedHours,
        "start": start == null ? null : start,
        "end": end == null ? null : end,
        "enabled_hours": enabledHours == null
            ? null
            : List<dynamic>.from(enabledHours!.map((x) => x.toJson())),
      };
}

class EnabledHour {
  EnabledHour({
    required this.start,
    required this.end,
  });

  String start;
  String end;

  factory EnabledHour.fromRawJson(String str) =>
      EnabledHour.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnabledHour.fromJson(Map<String, dynamic> json) => EnabledHour(
        start: json["start"] == null ? null : json["start"],
        end: json["end"] == null ? null : json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start == null ? null : start,
        "end": end == null ? null : end,
      };
}
