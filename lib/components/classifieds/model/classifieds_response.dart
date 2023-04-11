import 'dart:convert';

import 'package:hipal/utils/general.dart';

class ClassifiedResponse {
  ClassifiedResponse({
    required this.data,
    required this.page,
    required this.statistic,
  });

  List<Classified> data;
  Page page;
  Statistic statistic;

  factory ClassifiedResponse.fromJson(String str) =>
      ClassifiedResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassifiedResponse.fromMap(Map<String, dynamic> json) =>
      ClassifiedResponse(
        data: List<Classified>.from(
            json["data"].map((x) => Classified.fromMap(x))),
        page: Page.fromMap(json["page"]),
        statistic: Statistic.fromMap(json["statistic"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "page": page.toMap(),
        "statistic": statistic.toMap(),
      };
}

class Classified {
  Classified({
    required this.id,
    required this.commentsCount,
    required this.likes,
    this.residential,
    this.usser,
    required this.publish,
    required this.authorType,
    required this.state,
    required this.phone,
    required this.whatsappSeller,
    required this.emailSeller,
    required this.nameSeller,
    required this.description,
    required this.price,
    required this.title,
    this.link,
    required this.images,
    this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  int commentsCount;
  Likes? likes;
  Residential? residential;
  Usser? usser;
  String? publish;
  String? authorType;
  String? state;
  Phone? phone;
  String? whatsappSeller;
  String? emailSeller;
  String? nameSeller;
  String? description;
  double? price;
  String? title;
  String? link;
  List<ClassifiedImage>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Classified copyWith({
    String? id,
    int? commentsCount,
    Likes? likes,
    Residential? residential,
    Usser? usser,
    String? publish,
    String? authorType,
    String? state,
    Phone? phone,
    String? whatsappSeller,
    String? emailSeller,
    String? nameSeller,
    String? description,
    double? price,
    String? title,
    String? link,
    List<ClassifiedImage>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Classified(
        id: id ?? this.id,
        commentsCount: commentsCount ?? this.commentsCount,
        likes: likes ?? this.likes,
        residential: residential ?? this.residential,
        usser: usser ?? this.usser,
        publish: publish ?? this.publish,
        authorType: authorType ?? this.authorType,
        state: state ?? this.state,
        phone: phone ?? this.phone,
        whatsappSeller: whatsappSeller ?? this.whatsappSeller,
        emailSeller: emailSeller ?? this.emailSeller,
        nameSeller: nameSeller ?? this.nameSeller,
        description: description ?? this.description,
        price: price ?? this.price,
        title: title ?? this.title,
        link: link ?? this.link,
        images: images ?? this.images,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Classified.fromJson(String str) =>
      Classified.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Classified.fromMap(Map<String, dynamic> json) => Classified(
        id: json["_id"],
        commentsCount: json["comments_count"],
        likes: json["likes"] != null
            ? Likes.fromMap(json["likes"])
            : Likes(likesCount: 0, usersLikes: []),
        residential: json["residential"] != null
            ? Residential.fromMap(json["residential"])
            : Residential(id: "0", name: ""),
        usser: json["usser"] == null ? null : Usser.fromMap(json["usser"]),
        publish: json["publish"],
        authorType: json["authorType"],
        state: json["state"],
        phone: json["phone"] != null
            ? Phone.fromMap(json["phone"])
            : Phone(
                countryCode: "",
                dialCode: "",
                e164Number: "",
                internationalNumber: "",
                nationalNumber: "",
                number: ""),
        whatsappSeller: json["whatsappSeller"],
        emailSeller: json["emailSeller"],
        nameSeller: json["nameSeller"],
        description: json["description"],
        price: json["price"] != null ? json["price"].toDouble() : 0.0,
        title: json["title"],
        link: json["link"] == null ? null : json["link"],
        images: json["images"] != null
            ? List<ClassifiedImage>.from(
                json["images"].map((x) => ClassifiedImage.fromMap(x)))
            : [],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "comments_count": commentsCount,
        "likes": likes!.toMap(),
        "residential": residential == null ? null : residential!.toMap(),
        "usser": usser == null ? null : usser!.toMap(),
        "publish": publish,
        "authorType": authorType,
        "state": state,
        "phone": phone!.toMap(),
        "whatsappSeller": whatsappSeller,
        "emailSeller": emailSeller,
        "nameSeller": nameSeller,
        "description": description,
        "price": price,
        "title": title,
        "link": link == null ? null : link,
        "images": images ?? List<dynamic>.from(images!.map((x) => x.toMap())),
        "createdAt": link == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  String get createdAtLocal => createdAt != null
      ? DateTimeHelper.ddMMyyyyTT(createdAt!.toLocal())
      : 'unassigned date';
}

class Apartment {
  Apartment({
    required this.id,
    required this.tower,
    required this.name,
  });

  String id;
  Residential tower;
  String name;

  factory Apartment.fromJson(String str) => Apartment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Apartment.fromMap(Map<String, dynamic> json) => Apartment(
        id: json["_id"],
        tower: Residential.fromMap(json["tower"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "tower": tower.toMap(),
        "name": name,
      };
}

class Residential {
  Residential({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Residential.fromJson(String str) =>
      Residential.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Residential.fromMap(Map<String, dynamic> json) => Residential(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
      };
}

class ClassifiedImage {
  ClassifiedImage({
    required this.id,
    required this.key,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String key;
  String url;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ClassifiedImage.fromJson(String str) =>
      ClassifiedImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassifiedImage.fromMap(Map<String, dynamic> json) => ClassifiedImage(
        id: json["_id"],
        key: json["key"],
        url: json["url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "key": key,
        "url": url,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Likes {
  Likes({
    required this.usersLikes,
    required this.likesCount,
  });

  List<UsersLike> usersLikes;
  int likesCount;

  Likes copyWith({
    List<UsersLike>? usersLikes,
    int? likesCount,
  }) =>
      Likes(
        usersLikes: usersLikes ?? this.usersLikes,
        likesCount: likesCount ?? this.likesCount,
      );

  factory Likes.fromJson(String str) => Likes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Likes.fromMap(Map<String, dynamic> json) => Likes(
        usersLikes: List<UsersLike>.from(
            json["users_likes"].map((x) => UsersLike.fromMap(x))),
        likesCount: json["likes_count"],
      );

  Map<String, dynamic> toMap() => {
        "users_likes": List<dynamic>.from(usersLikes.map((x) => x.toMap())),
        "likes_count": likesCount,
      };
}

class UsersLike {
  UsersLike({
    required this.id,
    required this.lastname,
    required this.firstname,
    required this.photo,
  });

  String id;
  String lastname;
  String firstname;
  Photo photo;

  factory UsersLike.fromJson(String str) => UsersLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersLike.fromMap(Map<String, dynamic> json) => UsersLike(
        id: json["_id"],
        lastname: json["lastname"],
        firstname: json["firstname"],
        photo: Photo.fromMap(json["photo"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "lastname": lastname,
        "firstname": firstname,
        "photo": photo.toMap(),
      };
}

class Photo {
  Photo({
    required this.id,
    required this.url,
  });

  String id;
  String url;

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        id: json["_id"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "url": url,
      };
}

class Phone {
  Phone({
    required this.number,
    required this.nationalNumber,
    required this.internationalNumber,
    required this.e164Number,
    required this.dialCode,
    required this.countryCode,
  });

  String number;
  String nationalNumber;
  String internationalNumber;
  String e164Number;
  String dialCode;
  String countryCode;

  Phone copyWith({
    String? number,
    String? nationalNumber,
    String? internationalNumber,
    String? e164Number,
    String? dialCode,
    String? countryCode,
  }) =>
      Phone(
        number: number ?? this.number,
        nationalNumber: nationalNumber ?? this.nationalNumber,
        internationalNumber: internationalNumber ?? this.internationalNumber,
        e164Number: e164Number ?? this.e164Number,
        dialCode: dialCode ?? this.dialCode,
        countryCode: countryCode ?? this.countryCode,
      );

  factory Phone.fromJson(String str) => Phone.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Phone.fromMap(Map<String, dynamic> json) => Phone(
        number: json["number"],
        nationalNumber: json["nationalNumber"],
        internationalNumber: json["internationalNumber"],
        e164Number: json["e164Number"],
        dialCode: json["dialCode"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "nationalNumber": nationalNumber,
        "internationalNumber": internationalNumber,
        "e164Number": e164Number,
        "dialCode": dialCode,
        "countryCode": countryCode,
      };
}

class Usser {
  Usser({
    required this.isEnabledChats,
    required this.id,
    required this.isEnabled,
    required this.userJujuId,
    required this.fullProfile,
    required this.firstMessage,
    required this.firstTime,
    required this.codeTempExpiration,
    required this.codeTemp,
    required this.socialNetworks,
    required this.urlWebsite,
    this.username,
    required this.gender,
    this.city,
    this.birthDate,
    required this.email,
    this.identity,
    required this.lastname,
    required this.firstname,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  bool isEnabledChats;
  String id;
  bool isEnabled;
  dynamic userJujuId;
  bool fullProfile;
  bool firstMessage;
  bool firstTime;
  dynamic codeTempExpiration;
  dynamic codeTemp;
  List<dynamic> socialNetworks;
  dynamic urlWebsite;
  String? username;
  String gender;
  String? city;
  DateTime? birthDate;
  String email;
  String? identity;
  String lastname;
  String firstname;
  ClassifiedImage? photo;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Usser.fromJson(String str) => Usser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usser.fromMap(Map<String, dynamic> json) => Usser(
        isEnabledChats: json["is_enabled_chats"],
        id: json["_id"],
        isEnabled: json["is_enabled"],
        userJujuId: json["userJujuId"],
        fullProfile: json["fullProfile"],
        firstMessage: json["firstMessage"],
        firstTime: json["firstTime"],
        codeTempExpiration: json["codeTempExpiration"],
        codeTemp: json["codeTemp"],
        socialNetworks:
            List<dynamic>.from(json["socialNetworks"].map((x) => x)),
        urlWebsite: json["urlWebsite"],
        username: json["username"] == null ? null : json["username"],
        gender: json["gender"],
        city: json["city"] == null ? null : json["city"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        email: json["email"],
        identity: json["identity"] == null ? null : json["identity"],
        lastname: json["lastname"],
        firstname: json["firstname"],
        photo: json["photo"] == null
            ? null
            : ClassifiedImage.fromMap(json["photo"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "is_enabled_chats": isEnabledChats,
        "_id": id,
        "is_enabled": isEnabled,
        "userJujuId": userJujuId,
        "fullProfile": fullProfile,
        "firstMessage": firstMessage,
        "firstTime": firstTime,
        "codeTempExpiration": codeTempExpiration,
        "codeTemp": codeTemp,
        "socialNetworks": List<dynamic>.from(socialNetworks.map((x) => x)),
        "urlWebsite": urlWebsite,
        "username": username == null ? null : username,
        "gender": gender,
        "city": city == null ? null : city,
        "birthDate": birthDate == null ? null : birthDate!.toIso8601String(),
        "email": email,
        "identity": identity == null ? null : identity,
        "lastname": lastname,
        "firstname": firstname,
        "photo": photo == null ? null : photo!.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Page {
  Page({
    required this.total,
    required this.page,
    required this.lastPage,
  });

  int total;
  int page;
  int lastPage;

  Page copyWith({
    int? total,
    int? page,
    int? lastPage,
  }) =>
      Page(
        total: total ?? this.total,
        page: page ?? this.page,
        lastPage: lastPage ?? this.lastPage,
      );

  factory Page.fromJson(String str) => Page.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Page.fromMap(Map<String, dynamic> json) => Page(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
      };
}

class Statistic {
  Statistic({
    required this.total,
    required this.reject,
    required this.approve,
    required this.pending,
  });

  int total;
  int reject;
  int approve;
  int pending;

  Statistic copyWith({
    int? total,
    int? reject,
    int? approve,
    int? pending,
  }) =>
      Statistic(
        total: total ?? this.total,
        reject: reject ?? this.reject,
        approve: approve ?? this.approve,
        pending: pending ?? this.pending,
      );

  factory Statistic.fromJson(String str) => Statistic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistic.fromMap(Map<String, dynamic> json) => Statistic(
        total: json["total"],
        reject: json["reject"],
        approve: json["approve"],
        pending: json["pending"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "reject": reject,
        "approve": approve,
        "pending": pending,
      };
}
