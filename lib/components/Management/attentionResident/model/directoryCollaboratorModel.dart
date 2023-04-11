class DirectoryCollaboratorModel {
  DirectoryCollaboratorModel({
    this.id,
    this.users,
    this.schedule,
    this.residential,
    this.position,
    this.stated,
    this.phone,
    this.email,
    this.lastName,
    this.name,
    this.photo,
  });

  String? id;
  String? users;
  List<Schedule>? schedule;
  Residential? residential;
  String? position;
  String? stated;
  String? phone;
  String? email;
  String? lastName;
  String? name;
  Photo? photo;

  factory DirectoryCollaboratorModel.fromJson(Map<String, dynamic> json) =>
      DirectoryCollaboratorModel(
        id: json["_id"],
        users: json["users"],
        schedule: json["schedule"] != null
            ? List<Schedule>.from(
                json["schedule"].map((x) => Schedule.fromJson(x)))
            : null,
        residential: json["residential"] != null
            ? Residential.fromJson(json["residential"])
            : null,
        position: json["position"],
        stated: json["stated"],
        phone: json["phone"],
        email: json["email"],
        lastName: json["lastName"],
        name: json["name"],
        photo: json["photo"] != null ? Photo.fromJson(json["photo"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "users": users,
        "schedule": schedule != null
            ? List<dynamic>.from(schedule!.map((x) => x.toJson()))
            : null,
        "residential": residential?.toJson(),
        "position": position,
        "stated": stated,
        "phone": phone,
        "email": email,
        "lastName": lastName,
        "name": name,
        "photo": photo?.toJson(),
      };
}

class Photo {
  Photo({
    this.id,
    this.key,
    this.url,
  });

  String? id;
  String? key;
  String? url;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["_id"],
        key: json["key"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {"_id": id, "key": key, "url": url};
}

class Residential {
  Residential({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class Schedule {
  Schedule({
    this.id,
    this.times,
    this.day,
  });

  String? id;
  List<Time>? times;
  String? day;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["_id"],
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "times": List<dynamic>.from(times!.map((x) => x.toJson())),
        "day": day,
      };
}

class Time {
  Time({
    this.id,
    this.end,
    this.start,
  });

  String? id;
  String? end;
  String? start;

  factory Time.fromJson(Map<String, dynamic> json) =>
      Time(id: json["_id"], end: json["end"], start: json["start"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "end": end,
        "start": start,
      };
}
