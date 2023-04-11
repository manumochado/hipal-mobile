// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

class Reservations {
  Reservations({
    required this.id,
    required this.guests,
    required this.amount,
    required this.end,
    required this.start,
    required this.residential,
    required this.commonZone,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  List<dynamic>? guests;
  double? amount;
  DateTime? end;
  DateTime? start;
  Residential? residential;
  CommonZone? commonZone;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory Reservations.fromRawJson(String str) =>
      Reservations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reservations.fromJson(Map<String, dynamic> json) => Reservations(
        id: json["_id"] == null ? null : json["_id"],
        guests: json["guests"] == null
            ? null
            : List<dynamic>.from(json["guests"].map((x) => x)),
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        residential: json["residential"] == null
            ? null
            : Residential.fromJson(json["residential"]),
        commonZone: json["common_zone"] == null
            ? null
            : CommonZone.fromJson(json["common_zone"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
        "guests":
            guests == null ? null : List<dynamic>.from(guests!.map((x) => x)),
        "amount": amount == null ? null : amount,
        "end": end == null ? null : end?.toIso8601String(),
        "start": start == null ? null : start?.toIso8601String(),
        "residential": residential == null ? null : residential?.toJson(),
        "common_zone": commonZone == null ? null : commonZone?.toJson(),
        "user": user == null ? null : user?.toJson(),
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
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

class CommonZone {
  CommonZone({
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
    required this.v,
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
  String? residential;
  Image? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory CommonZone.fromRawJson(String str) =>
      CommonZone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommonZone.fromJson(Map<String, dynamic> json) => CommonZone(
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
        residential: json["residential"] == null ? null : json["residential"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
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
        "residential": residential == null ? null : residential,
        "image": image == null ? null : image?.toJson(),
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
    required this.start,
    required this.end,
    required this.allowedHours,
  });

  String start;
  String end;
  int allowedHours;

  factory Availability.fromRawJson(String str) =>
      Availability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        start: json["start"] == null ? null : json["start"],
        end: json["end"] == null ? null : json["end"],
        allowedHours:
            json["allowed_hours"] == null ? null : json["allowed_hours"],
      );

  Map<String, dynamic> toJson() => {
        "start": start == null ? null : start,
        "end": end == null ? null : end,
        "allowed_hours": allowedHours == null ? null : allowedHours,
      };
}

class Residential {
  Residential({
    required this.isEnabled,
    required this.id,
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

  bool? isEnabled;
  String id;
  String? typeParking;
  String? plan;
  String? city;
  String? address;
  String? description;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory Residential.fromRawJson(String str) =>
      Residential.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        isEnabled: json["is_enabled"] == null ? null : json["is_enabled"],
        id: json["_id"] == null ? null : json["_id"],
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
        "is_enabled": isEnabled == null ? null : isEnabled,
        "_id": id == null ? null : id,
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

class User {
  User({
    required this.id,
    required this.fullProfile,
    required this.firstMessage,
    required this.firstTime,
    required this.phone,
    required this.socialNetworks,
    required this.username,
    required this.gender,
    required this.city,
    required this.birthDate,
    required this.email,
    required this.lastname,
    required this.firstname,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.codeTemp,
    required this.codeTempExpiration,
    required this.urlWebsite,
    required this.userJujuId,
    required this.isEnabled,
    required this.identity,
  });

  String id;
  bool? fullProfile;
  bool? firstMessage;
  bool? firstTime;
  String? phone;
  List<dynamic>? socialNetworks;
  String? username;
  String? gender;
  dynamic city;
  DateTime? birthDate;
  String? email;
  String? lastname;
  String? firstname;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;
  String? codeTemp;
  DateTime? codeTempExpiration;
  dynamic urlWebsite;
  dynamic userJujuId;
  bool? isEnabled;
  String? identity;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        fullProfile: json["fullProfile"] == null ? null : json["fullProfile"],
        firstMessage:
            json["firstMessage"] == null ? null : json["firstMessage"],
        firstTime: json["firstTime"] == null ? null : json["firstTime"],
        phone: json["phone"] == null ? null : json["phone"],
        socialNetworks: json["socialNetworks"] == null
            ? null
            : List<dynamic>.from(json["socialNetworks"].map((x) => x)),
        username: json["username"] == null ? null : json["username"],
        gender: json["gender"] == null ? null : json["gender"],
        city: json["city"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        email: json["email"] == null ? null : json["email"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        photo: json["photo"] == null ? null : json["photo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        codeTemp: json["codeTemp"] == null ? null : json["codeTemp"],
        codeTempExpiration: json["codeTempExpiration"] == null
            ? null
            : DateTime.parse(json["codeTempExpiration"]),
        urlWebsite: json["urlWebsite"],
        userJujuId: json["userJujuId"],
        isEnabled: json["is_enabled"] == null ? null : json["is_enabled"],
        identity: json["identity"] == null ? null : json["identity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "fullProfile": fullProfile == null ? null : fullProfile,
        "firstMessage": firstMessage == null ? null : firstMessage,
        "firstTime": firstTime == null ? null : firstTime,
        "phone": phone == null ? null : phone,
        "socialNetworks": socialNetworks == null
            ? null
            : List<dynamic>.from(socialNetworks!.map((x) => x)),
        "username": username == null ? null : username,
        "gender": gender == null ? null : gender,
        "city": city,
        "birthDate": birthDate == null ? null : birthDate?.toIso8601String(),
        "email": email == null ? null : email,
        "lastname": lastname == null ? null : lastname,
        "firstname": firstname == null ? null : firstname,
        "photo": photo == null ? null : photo,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
        "codeTemp": codeTemp == null ? null : codeTemp,
        "codeTempExpiration": codeTempExpiration == null
            ? null
            : codeTempExpiration?.toIso8601String(),
        "urlWebsite": urlWebsite,
        "userJujuId": userJujuId,
        "is_enabled": isEnabled == null ? null : isEnabled,
        "identity": identity == null ? null : identity,
      };
}
