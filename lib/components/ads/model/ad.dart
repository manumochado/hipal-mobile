import 'dart:convert';

class Ads {
  String? sId;
  bool? state;
  String? hourFinish;
  String? hourStart;
  String? date;
  String? theme;
  String? description;
  String? link;
  String? typeAds;
  String? createdAt;
  String? updatedAt;
  Map? image; 
  int? iV;
  Statistic? statistic;

  Ads({
    this.sId,
      this.state,
      this.hourFinish,
      this.hourStart,
      this.date,
      this.theme,
      this.description,
      this.link,
      this.typeAds,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.iV,
    this.statistic
  });

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
    sId: json["_id"],
    state: json["state"],
    hourFinish: json["hourFinish"],
    hourStart: json["hourStart"],
    date: json["date"],
    theme: json["theme"],
    description: json["description"],
    link: json["link"],
    typeAds: json["type_ads"],
    image: json["image"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    iV: json["__v"],
    //statistic: Statistic.fromJson(json["statistic"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": sId,
    "state": state,
    "hourFinish": hourFinish,
    "hourStart": hourStart,
    "date": date,
    "theme": theme,
    "description": description,
    "link": link,
    "type_ads": typeAds,
    "image": image,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": iV,
    //"statistic": statistic!.toJson(),
  };
}

class Users {
  String? sId;
  String? email;
  String? lastname;
  String? firstname;
  Photo? photo;

  Users({this.sId, this.email, this.lastname, this.firstname, this.photo});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    lastname = json['lastname'];
    firstname = json['firstname'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['lastname'] = this.lastname;
    data['firstname'] = this.firstname;
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    return data;
  }
}

class Photo {
  String? sId;
  String? key;
  String? url;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Photo(
      {this.sId, this.key, this.url, this.createdAt, this.updatedAt, this.iV});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    key = json['key'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['key'] = this.key;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Residential {
  String? sId;
  String? name;

  Residential({this.sId, this.name});

  Residential.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Page {
  int? total;
  int? page;
  int? lastPage;

  Page({this.total, this.page, this.lastPage});

  Page.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['lastPage'] = this.lastPage;
    return data;
  }
}

class Statistic {
  int? total;

  Statistic({this.total});

  Statistic.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

