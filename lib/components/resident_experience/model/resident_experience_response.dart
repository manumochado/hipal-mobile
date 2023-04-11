import 'dart:convert';

class ResidentExperiencesResponse {
    ResidentExperiencesResponse({
        required this.data,
        required this.page,
    });

    List<ResidentExperience> data;
    Page page;

    ResidentExperiencesResponse copyWith({
        List<ResidentExperience>? data,
        Page? page,
    }) => 
        ResidentExperiencesResponse(
            data: data ?? this.data,
            page: page ?? this.page,
        );

    factory ResidentExperiencesResponse.fromJson(String str) => ResidentExperiencesResponse.fromMap(json.decode(str));

    factory ResidentExperiencesResponse.fromMap(Map<String, dynamic> json) => ResidentExperiencesResponse(
        data: List<ResidentExperience>.from(json["data"].map((x) => ResidentExperience.fromMap(x))),
        page: Page.fromMap(json["page"]),
    );
}

class ResidentExperience {
    ResidentExperience({
        required this.id,
        required this.score,
        required this.date,
        required this.stated,
        required this.user,
        required this.tower,
        required this.residential,
        required this.apartment,
        required this.description,
        this.response,
        required this.business,
        required this.category,
        required this.type,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    int score;
    DateTime date;
    String stated;
    _User user;
    _Identifier tower;
    _Identifier residential;
    _Identifier apartment;
    String description;
    _Response? response;
    String business;
    _Identifier category;
    _Identifier type;
    DateTime createdAt;
    DateTime updatedAt;

    ResidentExperience copyWith({
        String? id,
        int? score,
        DateTime? date,
        String? stated,
        _User? user,
        _Identifier? tower,
        _Identifier? residential,
        _Identifier? apartment,
        String? description,
        _Response? response,
        String? business,
        _Identifier? category,
        _Identifier? type,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        ResidentExperience(
            id: id ?? this.id,
            score: score ?? this.score,
            date: date ?? this.date,
            stated: stated ?? this.stated,
            user: user ?? this.user,
            tower: tower ?? this.tower,
            residential: residential ?? this.residential,
            apartment: apartment ?? this.apartment,
            description: description ?? this.description,
            response: response ?? this.response,
            business: business ?? this.business,
            category: category ?? this.category,
            type: type ?? this.type,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt
        );

    factory ResidentExperience.fromJson(String str) => ResidentExperience.fromMap(json.decode(str));

    factory ResidentExperience.fromMap(Map<String, dynamic> json) => ResidentExperience(
        id: json["_id"],
        score: json["score"],
        date: DateTime.parse(json["date"]),
        stated: json["stated"],
        user: _User.fromMap(json["user"]),
        tower: _Identifier.fromMap(json["tower"]),
        residential: _Identifier.fromMap(json["residential"]),
        apartment: _Identifier.fromMap(json["apartment"]),
        description: json["description"],
        response: json["response"] == null ? null : _Response.fromMap(json["response"]),
        business: json["business"],
        category: _Identifier.fromMap(json["category"]),
        type: _Identifier.fromMap(json["type"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );
}

class _Identifier {
    _Identifier({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    _Identifier copyWith({
        String? id,
        String? name,
    }) => 
        _Identifier(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory _Identifier.fromMap(Map<String, dynamic> json) => _Identifier(
        id: json["_id"],
        name: json["name"],
    );
}

class _Response {
    _Response({
        required this.date,
        required this.response,
        required this.user,
    });

    DateTime date;
    String response;
    _User user;
    
    _Response copyWith({
        DateTime? date,
        String? response,
        _User? user,
        String? id,
    }) => 
        _Response(
            date: date ?? this.date,
            response: response ?? this.response,
            user: user ?? this.user,
        );

    factory _Response.fromJson(String str) => _Response.fromMap(json.decode(str));

    factory _Response.fromMap(Map<String, dynamic> json) => _Response(
        date: DateTime.parse(json["date"]),
        response: json["response"],
        user: _User.fromMap(json["user"]),
    );
}

class _User {
    _User({
        required this.id,
        required this.firstname,
        this.lastname,
        this.photo,
    });

    String id;
    String firstname;
    String? lastname;
    _Photo? photo;

    _User copyWith({
        String? id,
        String? firstname,
        String? lastname,
        _Photo? photo,
    }) => 
        _User(
            id: id ?? this.id,
            lastname: lastname ?? this.lastname,
            firstname: firstname ?? this.firstname,
            photo: photo ?? this.photo,
        );

    factory _User.fromJson(String str) => _User.fromMap(json.decode(str));

    factory _User.fromMap(Map<String, dynamic> json) => _User(
        id: json["_id"],
        lastname: json["lastname"],
        firstname: json["firstname"],
        photo: json["photo"] == null ? null : _Photo.fromMap(json["photo"]),
    );
}

class _Photo {
    _Photo({
        required this.id,
        required this.url,
    });

    String id;
    String url;

    factory _Photo.fromJson(String str) => _Photo.fromMap(json.decode(str));

    factory _Photo.fromMap(Map<String, dynamic> json) => _Photo(
        id: json["_id"],
        url: json["url"],
    );

        Map<String, dynamic> toMap() => {
        "_id": id,
        "url": url,
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

    factory Page.fromMap(Map<String, dynamic> json) => Page(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
    );

     String toJson() => json.encode(toMap());

     Map<String, dynamic> toMap() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
    };

}
