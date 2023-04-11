import 'dart:convert';

class UserChat {
  UserChat({
    required this.id,
    required this.user,
    required this.roles,
    required this.rolesDetail,
    required this.apartments,
    required this.apartmentsDetail,
    required this.profiles,
    required this.fullname,
    required this.order,
  });

  Id? id;
  User? user;
  List<String>? roles;
  List<RolesDetail>? rolesDetail;
  List<String>? apartments;
  List<ApartmentsDetail>? apartmentsDetail;
  Profiles? profiles;
  String fullname;
  String order;

  factory UserChat.fromRawJson(String str) =>
      UserChat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserChat.fromJson(Map<String, dynamic> json) => UserChat(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        roles: json["roles"] == null
            ? null
            : List<String>.from(json["roles"].map((x) => x)),
        rolesDetail: json["rolesDetail"] == null
            ? null
            : List<RolesDetail>.from(
                json["rolesDetail"].map((x) => RolesDetail.fromJson(x))),
        apartments: json["apartments"] == null
            ? null
            : List<String>.from(json["apartments"].map((x) => x)),
        apartmentsDetail: json["apartmentsDetail"] == null
            ? null
            : List<ApartmentsDetail>.from(json["apartmentsDetail"]
                .map((x) => ApartmentsDetail.fromJson(x))),
        profiles: json["profiles"] == null
            ? null
            : Profiles.fromJson(json["profiles"]),
        fullname: json["fullname"] == null ? null : json["fullname"],
        order: json["order"] == null ? null : json["order"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id!.toJson(),
        "user": user == null ? null : user!.toJson(),
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
        "rolesDetail": rolesDetail == null
            ? null
            : List<dynamic>.from(rolesDetail!.map((x) => x.toJson())),
        "apartments": apartments == null
            ? null
            : List<dynamic>.from(apartments!.map((x) => x)),
        "apartmentsDetail": apartmentsDetail == null
            ? null
            : List<dynamic>.from(apartmentsDetail!.map((x) => x.toJson())),
        "profiles": profiles == null ? null : profiles!.toJson(),
        "fullname": fullname == null ? null : fullname,
        "order": order == null ? null : order,
      };
}

class ApartmentsDetail {
  ApartmentsDetail({
    required this.id,
    required this.name,
    required this.towerName,
    required this.towerId,
  });

  String id;
  String name;
  String towerName;
  String towerId;

  factory ApartmentsDetail.fromRawJson(String str) =>
      ApartmentsDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApartmentsDetail.fromJson(Map<String, dynamic> json) =>
      ApartmentsDetail(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        towerName: json["tower_name"] == null ? null : json["tower_name"],
        towerId: json["tower_id"] == null ? null : json["tower_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "tower_name": towerName == null ? null : towerName,
        "tower_id": towerId == null ? null : towerId,
      };
}

class Id {
  Id({
    required this.user,
    required this.residential,
  });

  String user;
  String residential;

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        user: json["user"] == null ? null : json["user"],
        residential: json["residential"] == null ? null : json["residential"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user,
        "residential": residential == null ? null : residential,
      };
}

class Profiles {
  Profiles({
    required this.id,
    required this.apartment,
    required this.rol,
    required this.residential,
    required this.user,
    required this.v,
  });

  String id;
  String apartment;
  List<String>? rol;
  String residential;
  String user;
  int v;

  factory Profiles.fromRawJson(String str) =>
      Profiles.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
        id: json["_id"] == null ? null : json["_id"],
        apartment: json["apartment"] == null ? null : json["apartment"],
        rol: json["rol"] == null
            ? null
            : List<String>.from(json["rol"].map((x) => x)),
        residential: json["residential"] == null ? null : json["residential"],
        user: json["user"] == null ? null : json["user"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "apartment": apartment == null ? null : apartment,
        "rol": rol == null ? null : List<dynamic>.from(rol!.map((x) => x)),
        "residential": residential == null ? null : residential,
        "user": user == null ? null : user,
        "__v": v == null ? null : v,
      };
}

class RolesDetail {
  RolesDetail({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory RolesDetail.fromRawJson(String str) =>
      RolesDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RolesDetail.fromJson(Map<String, dynamic> json) => RolesDetail(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class Phone {
  Phone({
    required this.id,
    required this.number,
    required this.nationalNumber,
    required this.internationalNumber,
    required this.e164Number,
    required this.dialCode,
    required this.countryCode,
    required this.v,
  });

  String id;
  String number;
  String nationalNumber;
  String internationalNumber;
  String e164Number;
  String dialCode;
  String countryCode;
  int v;

  factory Phone.fromRawJson(String str) => Phone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        id: json["_id"] == null ? null : json["_id"],
        number: json["number"] == null ? null : json["number"],
        nationalNumber:
            json["nationalNumber"] == null ? null : json["nationalNumber"],
        internationalNumber: json["internationalNumber"] == null
            ? null
            : json["internationalNumber"],
        e164Number: json["e164Number"] == null ? null : json["e164Number"],
        dialCode: json["dialCode"] == null ? null : json["dialCode"],
        countryCode: json["countryCode"] == null ? null : json["countryCode"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "number": number == null ? null : number,
        "nationalNumber": nationalNumber == null ? null : nationalNumber,
        "internationalNumber":
            internationalNumber == null ? null : internationalNumber,
        "e164Number": e164Number == null ? null : e164Number,
        "dialCode": dialCode == null ? null : dialCode,
        "countryCode": countryCode == null ? null : countryCode,
        "__v": v == null ? null : v,
      };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.lastname,
    required this.firstname,
    required this.photo,
    required this.phone,
  });

  String id;
  String email;
  String lastname;
  String firstname;
  Photo? photo;
  Phone? phone;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "lastname": lastname == null ? null : lastname,
        "firstname": firstname == null ? null : firstname,
        "photo": photo == null ? null : photo?.toJson(),
        "phone": photo == null ? null : phone?.toJson(),
      };
}

class Photo {
  Photo({
    required this.id,
    required this.key,
    required this.url,
    required this.v,
  });

  String id;
  String key;
  String url;
  int v;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["_id"] == null ? null : json["_id"],
        key: json["key"] == null ? null : json["key"],
        url: json["url"] == null ? null : json["url"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "key": key == null ? null : key,
        "url": url == null ? null : url,
        "__v": v == null ? null : v,
      };
}
