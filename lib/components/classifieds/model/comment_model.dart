class CommentModel {
  String? sId;
  Likes? likes;
  String? comment;
  User? user;
  String? classified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CommentModel(
      {this.sId,
      this.likes,
      this.comment,
      this.user,
      this.classified,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CommentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    likes = json['likes'] != null ? new Likes.fromJson(json['likes']) : null;
    comment = json['comment'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    classified = json['classified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.likes != null) {
      data['likes'] = this.likes!.toJson();
    }
    data['comment'] = this.comment;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['classified'] = this.classified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Likes {
  List<UsersLikesM>? usersLikes;
  int? likesCount;

  Likes({this.usersLikes, this.likesCount});

  Likes.fromJson(Map<String, dynamic> json) {
    if (json['users_likes'] != null) {
      usersLikes = <UsersLikesM>[];
      json['users_likes'].forEach((v) {
        usersLikes!.add(new UsersLikesM.fromJson(v));
      });
    }
    likesCount = json['likes_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usersLikes != null) {
      data['users_likes'] = this.usersLikes!.map((v) => v.toJson()).toList();
    }
    data['likes_count'] = this.likesCount;
    return data;
  }
}

class UsersLikesM {
  String? sId;
  String? lastname;
  String? firstname;
  Photo? photo;

  UsersLikesM({this.sId, this.lastname, this.firstname, this.photo});

  UsersLikesM.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lastname = json['lastname'];
    firstname = json['firstname'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
  String? url;

  Photo({this.sId, this.url});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['url'] = this.url;
    return data;
  }
}

class User {
  String? sId;
  String? lastname;
  String? firstname;

  User({this.sId, this.lastname, this.firstname});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lastname = json['lastname'];
    firstname = json['firstname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lastname'] = this.lastname;
    data['firstname'] = this.firstname;
    return data;
  }
}