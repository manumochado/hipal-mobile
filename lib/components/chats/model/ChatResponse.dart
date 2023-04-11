import 'dart:convert';

class ChatResponse {
  ChatResponse({
    required this.id,
    required this.type,
    required this.residential,
    required this.isViews,
    required this.isEmpty,
    required this.isDeleted,
    required this.v,
    required this.user,
    required this.messageNotView,
    required this.messageLast,
    required this.fullname,
    required this.order,
  });

  String id;
  String type;
  String residential;
  List<String>? isViews;
  List<dynamic>? isEmpty;
  List<dynamic>? isDeleted;
  int v;
  User? user;
  int messageNotView;
  MessageLast? messageLast;
  String fullname;
  String? order;

  factory ChatResponse.fromRawJson(String str) =>
      ChatResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
        residential: json["residential"] == null ? null : json["residential"],
        isViews: json["is_views"] == null
            ? null
            : List<String>.from(json["is_views"].map((x) => x)),
        isEmpty: json["is_empty"] == null
            ? null
            : List<dynamic>.from(json["is_empty"].map((x) => x)),
        isDeleted: json["is_deleted"] == null
            ? null
            : List<dynamic>.from(json["is_deleted"].map((x) => x)),
        v: json["__v"] == null ? null : json["__v"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        messageNotView:
            json["messageNotView"] == null ? null : json["messageNotView"],
        messageLast: json["messageLast"] == null
            ? null
            : MessageLast.fromJson(json["messageLast"]),
        fullname: json["fullname"] == null ? null : json["fullname"],
        order: json["order"] == null ? null : json["order"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "type": type == null ? null : type,
        "residential": residential == null ? null : residential,
        "is_views":
            isViews == null ? null : List<dynamic>.from(isViews!.map((x) => x)),
        "is_empty":
            isEmpty == null ? null : List<dynamic>.from(isEmpty!.map((x) => x)),
        "is_deleted": isDeleted == null
            ? null
            : List<dynamic>.from(isDeleted!.map((x) => x)),
        "__v": v == null ? null : v,
        "user": user == null ? null : user?.toJson(),
        "messageNotView": messageNotView == null ? null : messageNotView,
        "messageLast": messageLast == null ? null : messageLast?.toJson(),
        "fullname": fullname == null ? null : fullname,
        "order": order == null ? null : order,
      };
}

class MessageLast {
  MessageLast({
    required this.id,
    required this.type,
    required this.message,
    required this.chat,
    required this.isViews,
    required this.isDeleted,
    required this.userSend,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String type;
  String message;
  String chat;
  List<String>? isViews;
  List<dynamic>? isDeleted;
  String userSend;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory MessageLast.fromRawJson(String str) =>
      MessageLast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MessageLast.fromJson(Map<String, dynamic> json) => MessageLast(
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
        message: json["message"] == null ? null : json["message"],
        chat: json["chat"] == null ? null : json["chat"],
        isViews: json["is_views"] == null
            ? null
            : List<String>.from(json["is_views"].map((x) => x)),
        isDeleted: json["is_deleted"] == null
            ? null
            : List<dynamic>.from(json["is_deleted"].map((x) => x)),
        userSend: json["user_send"] == null ? null : json["user_send"],
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
        "type": type == null ? null : type,
        "message": message == null ? null : message,
        "chat": chat == null ? null : chat,
        "is_views":
            isViews == null ? null : List<dynamic>.from(isViews!.map((x) => x)),
        "is_deleted": isDeleted == null
            ? null
            : List<dynamic>.from(isDeleted!.map((x) => x)),
        "user_send": userSend == null ? null : userSend,
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
    required this.profiles,
  });

  String id;
  String email;
  String lastname;
  String firstname;
  Photo? photo;
  Phone? phone;
  List<Profile>? profiles;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
        profiles: json["profiles"] == null
            ? null
            : List<Profile>.from(
                json["profiles"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "lastname": lastname == null ? null : lastname,
        "firstname": firstname == null ? null : firstname,
        "photo": photo == null ? null : photo?.toJson(),
        "phone": photo == null ? null : phone?.toJson(),
        "profiles": profiles == null
            ? null
            : List<dynamic>.from(profiles!.map((x) => x.toJson())),
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

class Profile {
  Profile({
    required this.id,
    required this.apartment,
    required this.rol,
    required this.residential,
    required this.user,
    required this.v,
  });

  String id;
  Apartment? apartment;
  List<Residential>? rol;
  Residential? residential;
  String user;
  int v;

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["_id"] == null ? null : json["_id"],
        apartment: json["apartment"] == null
            ? null
            : Apartment.fromJson(json["apartment"]),
        rol: json["rol"] == null
            ? null
            : List<Residential>.from(
                json["rol"].map((x) => Residential.fromJson(x))),
        residential: json["residential"] == null
            ? null
            : Residential.fromJson(json["residential"]),
        user: json["user"] == null ? null : json["user"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "apartment": apartment == null ? null : apartment!.toJson(),
        "rol": rol == null
            ? null
            : List<dynamic>.from(rol!.map((x) => x.toJson())),
        "residential": residential == null ? null : residential!.toJson(),
        "user": user == null ? null : user,
        "__v": v == null ? null : v,
      };
}

class Apartment {
  Apartment({
    required this.id,
    required this.tower,
    required this.name,
  });

  String id;
  Residential? tower;
  String name;

  factory Apartment.fromRawJson(String str) =>
      Apartment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        id: json["_id"] == null ? null : json["_id"],
        tower:
            json["tower"] == null ? null : Residential.fromJson(json["tower"]),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "tower": tower == null ? null : tower?.toJson(),
        "name": name == null ? null : name,
      };
}

class Residential {
  Residential({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Residential.fromRawJson(String str) =>
      Residential.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
