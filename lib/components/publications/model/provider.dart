// To parse this JSON data, do
//
//     final provider = providerFromJson(jsonString);

import 'dart:developer';

class Provider {
  String? id;
  String? user;
  InfoContract? infoContract;
  Responsable? responsable;
  Company? company;
  bool? isEnabled;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? v;

  Provider({
    this.id,
    this.user,
    this.infoContract,
    this.responsable,
    this.company,
    this.isEnabled,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["_id"],
        user: json["user"],
        infoContract: json["info_contract"] != null
            ? InfoContract.fromJson(json["info_contract"])
            : InfoContract(),
        responsable: json["responsable"] != null
            ? Responsable.fromJson(json["responsable"])
            : Responsable(),
        company: json["company"] != null
            ? Company.fromJson(json["company"])
            : Company(),
        isEnabled: json["is_enabled"],
        img: json["img"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "info_contract": infoContract?.toJson(),
        "responsable": responsable?.toJson(),
        "company": company?.toJson(),
        "is_enabled": isEnabled,
        "img": img,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Company {
  Company({
    this.pageWeb,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.bussinnes,
    this.name,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  String? pageWeb;
  String? email;
  int? phone;
  String? address;
  City? city;
  String? bussinnes;
  String? name;
  String? id;
  String? createdAt;
  String? updatedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        pageWeb: json["pageWeb"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"] != null ? City.fromJson(json["city"]) : null,
        bussinnes: json["bussinnes"],
        name: json["name"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "pageWeb": pageWeb,
        "email": email,
        "phone": phone,
        "address": address,
        "city": city,
        "bussinnes": bussinnes,
        "name": name,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class City {
  City(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}

class Category {
  Category({
    required this.id,
    required this.contract,
    required this.provider,
    required this.image,
    required this.name,
  });

  final String id;
  final String contract;
  final String provider;
  final String image;
  final String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        contract: json["contract"],
        provider: json["provider"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "contract": contract,
        "provider": provider,
        "image": image,
        "name": name,
      };
}

class SubCategory {
  SubCategory(
      {required this.id,
      required this.residential,
      required this.users,
      required this.typeUsers,
      required this.message,
      required this.type});

  final String id;
  final String residential;
  final List<dynamic> users;
  final String typeUsers;
  final String message;
  final String type;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
      id: json["_id"],
      residential: json["residential"],
      users: List<dynamic>.from(json["users"].map((x) => x)),
      typeUsers: json["typeUsers"],
      message: json["message"],
      type: json["type"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "residential": residential,
        "users": List<dynamic>.from(users.map((x) => x)),
        "typeUsers": typeUsers,
        "message": message,
        "type": type
      };
}

class InfoContract {
  InfoContract({
    this.subCategory,
    this.category,
    this.hiringEndDate,
    this.hiringStartDate,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  SubCategory? subCategory;
  Category? category;
  String? hiringEndDate;
  String? hiringStartDate;
  String? id;
  String? createdAt;
  String? updatedAt;

  factory InfoContract.fromJson(Map<String, dynamic> json) {
    return InfoContract(
      subCategory: json["subCategory"] != null
          ? SubCategory.fromJson(json["subCategory"])
          : null,
      category:
          json["category"] != null ? Category.fromJson(json["category"]) : null,
      hiringEndDate: json["hiringEndDate"],
      hiringStartDate: json["hiringStartDate"],
      id: json["_id"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "subCategory": subCategory,
        "category": category,
        "hiringEndDate": hiringEndDate,
        "hiringStartDate": hiringStartDate,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Responsable {
  Responsable({
    this.phone,
    this.email,
    this.secondSurname,
    this.surname,
    this.secondName,
    this.firstName,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  dynamic? phone;
  String? email;
  String? secondSurname;
  String? surname;
  String? secondName;
  String? firstName;
  String? id;
  String? createdAt;
  String? updatedAt;

  factory Responsable.fromJson(Map<String, dynamic> json) => Responsable(
        phone: json["phone"],
        email: json["email"],
        secondSurname: json["second_surname"],
        surname: json["surname"],
        secondName: json["second_name"],
        firstName: json["first_name"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
        "second_surname": secondSurname,
        "surname": surname,
        "second_name": secondName,
        "first_name": firstName,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
