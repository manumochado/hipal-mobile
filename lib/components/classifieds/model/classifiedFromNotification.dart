import 'dart:convert';

class ClassifieldFromNotification {
  ClassifieldFromNotification({
    required this.id,
    required this.commentsCount,
    required this.likes,
    required this.residential,
    required this.usser,
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
    required this.link,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  int? commentsCount;
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
  int? price;
  String? title;
  dynamic link;
  List<ImageClassifield>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ClassifieldFromNotification copyWith({
    String? id,
    int? commentsCount,
    required Likes likes,
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
    int? price,
    String? title,
    dynamic link,
    List<ImageClassifield>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      ClassifieldFromNotification(
        id: id ?? this.id,
        commentsCount: commentsCount ?? this.commentsCount,
        likes: likes,
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

  factory ClassifieldFromNotification.fromJson(Map<String, dynamic> json) =>
      ClassifieldFromNotification(
        id: json["_id"] == null ? null : json["_id"],
        commentsCount:
            json["comments_count"] == null ? null : json["comments_count"],
        likes: json["likes"] == null ? null : Likes.fromJson(json["likes"]),
        residential: json["residential"] == null
            ? null
            : Residential.fromJson(json["residential"]),
        usser: json["usser"] == null ? null : Usser.fromJson(json["usser"]),
        publish: json["publish"] == null ? null : json["publish"],
        authorType: json["authorType"] == null ? null : json["authorType"],
        state: json["state"] == null ? null : json["state"],
        phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
        whatsappSeller:
            json["whatsappSeller"] == null ? null : json["whatsappSeller"],
        emailSeller: json["emailSeller"] == null ? null : json["emailSeller"],
        nameSeller: json["nameSeller"] == null ? null : json["nameSeller"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        title: json["title"] == null ? null : json["title"],
        link: json["link"],
        images: json["images"] == null
            ? null
            : List<ImageClassifield>.from(
                json["images"].map((x) => ImageClassifield.fromJson(x))),
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
        "comments_count": commentsCount == null ? null : commentsCount,
        "likes": likes == null ? null : likes?.toJson(),
        "residential": residential == null ? null : residential?.toJson(),
        "usser": usser == null ? null : usser?.toJson(),
        "publish": publish == null ? null : publish,
        "authorType": authorType == null ? null : authorType,
        "state": state == null ? null : state,
        "phone": phone == null ? null : phone?.toJson(),
        "whatsappSeller": whatsappSeller == null ? null : whatsappSeller,
        "emailSeller": emailSeller == null ? null : emailSeller,
        "nameSeller": nameSeller == null ? null : nameSeller,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "title": title == null ? null : title,
        "link": link,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class ImageClassifield {
  ImageClassifield({
    required this.id,
    required this.key,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? key;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ImageClassifield copyWith({
    String? id,
    String? key,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      ImageClassifield(
        id: id ?? this.id,
        key: key ?? this.key,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory ImageClassifield.fromJson(Map<String, dynamic> json) =>
      ImageClassifield(
        id: json["_id"] == null ? null : json["_id"],
        key: json["key"] == null ? null : json["key"],
        url: json["url"] == null ? null : json["url"],
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
        "key": key == null ? null : key,
        "url": url == null ? null : url,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
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

class Phone {
  Phone({
    required this.number,
    required this.nationalNumber,
    required this.internationalNumber,
    required this.e164Number,
    required this.dialCode,
    required this.countryCode,
  });

  String? number;
  String? nationalNumber;
  String? internationalNumber;
  String? e164Number;
  String? dialCode;
  String? countryCode;

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

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        number: json["number"] == null ? null : json["number"],
        nationalNumber:
            json["nationalNumber"] == null ? null : json["nationalNumber"],
        internationalNumber: json["internationalNumber"] == null
            ? null
            : json["internationalNumber"],
        e164Number: json["e164Number"] == null ? null : json["e164Number"],
        dialCode: json["dialCode"] == null ? null : json["dialCode"],
        countryCode: json["countryCode"] == null ? null : json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "nationalNumber": nationalNumber == null ? null : nationalNumber,
        "internationalNumber":
            internationalNumber == null ? null : internationalNumber,
        "e164Number": e164Number == null ? null : e164Number,
        "dialCode": dialCode == null ? null : dialCode,
        "countryCode": countryCode == null ? null : countryCode,
      };
}

class Residential {
  Residential({
    required this.id,
    required this.name,
  });

  String? id;
  String? name;

  Residential copyWith({
    String? id,
    String? name,
  }) =>
      Residential(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
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

class Usser {
  Usser({
    required this.isEnabledChats,
    required this.userJujuId,
    required this.codeTempExpiration,
    required this.codeTemp,
    required this.urlWebsite,
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
    required this.createdAt,
    required this.updatedAt,
    required this.photo,
    required this.v,
    required this.isEnabled,
  });

  bool? isEnabledChats;
  dynamic userJujuId;
  dynamic codeTempExpiration;
  dynamic codeTemp;
  dynamic urlWebsite;
  String? id;
  bool? fullProfile;
  bool? firstMessage;
  bool? firstTime;
  String? phone;
  Photo? photo;
  List<dynamic>? socialNetworks;
  String? username;
  String? gender;
  dynamic city;
  dynamic birthDate;
  String? email;
  String? lastname;
  String? firstname;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isEnabled;

  Usser copyWith({
    bool? isEnabledChats,
    dynamic userJujuId,
    dynamic codeTempExpiration,
    dynamic codeTemp,
    dynamic urlWebsite,
    String? id,
    bool? fullProfile,
    bool? firstMessage,
    bool? firstTime,
    String? phone,
    Photo? photo,
    List<dynamic>? socialNetworks,
    String? username,
    String? gender,
    dynamic city,
    dynamic birthDate,
    String? email,
    String? lastname,
    String? firstname,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? isEnabled,
  }) =>
      Usser(
        isEnabledChats: isEnabledChats ?? this.isEnabledChats,
        userJujuId: userJujuId ?? this.userJujuId,
        codeTempExpiration: codeTempExpiration ?? this.codeTempExpiration,
        codeTemp: codeTemp ?? this.codeTemp,
        urlWebsite: urlWebsite ?? this.urlWebsite,
        id: id ?? this.id,
        fullProfile: fullProfile ?? this.fullProfile,
        firstMessage: firstMessage ?? this.firstMessage,
        firstTime: firstTime ?? this.firstTime,
        phone: phone ?? this.phone,
        photo: photo ?? this.photo,
        socialNetworks: socialNetworks ?? this.socialNetworks,
        username: username ?? this.username,
        gender: gender ?? this.gender,
        city: city ?? this.city,
        birthDate: birthDate ?? this.birthDate,
        email: email ?? this.email,
        lastname: lastname ?? this.lastname,
        firstname: firstname ?? this.firstname,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        isEnabled: isEnabled ?? this.isEnabled,
      );

  factory Usser.fromJson(Map<String, dynamic> json) => Usser(
        isEnabledChats:
            json["is_enabled_chats"] == null ? null : json["is_enabled_chats"],
        userJujuId: json["userJujuId"],
        codeTempExpiration: json["codeTempExpiration"],
        codeTemp: json["codeTemp"],
        urlWebsite: json["urlWebsite"],
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
        birthDate: json["birthDate"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        email: json["email"] == null ? null : json["email"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        isEnabled: json["is_enabled"] == null ? null : json["is_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "is_enabled_chats": isEnabledChats == null ? null : isEnabledChats,
        "userJujuId": userJujuId,
        "codeTempExpiration": codeTempExpiration,
        "codeTemp": codeTemp,
        "urlWebsite": urlWebsite,
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
        "birthDate": birthDate,
        "email": email == null ? null : email,
        "lastname": lastname == null ? null : lastname,
        "firstname": firstname == null ? null : firstname,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
        "is_enabled": isEnabled == null ? null : isEnabled,
      };
}
