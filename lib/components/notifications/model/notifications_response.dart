import 'dart:convert';

class NotificationsResponse {
    NotificationsResponse({
        required this.data,
        required this.page,
    });

    List<NotificationApp> data;
    Page page;

    factory NotificationsResponse.fromJson(String str) => NotificationsResponse.fromMap(json.decode(str));

    factory NotificationsResponse.fromMap(Map<String, dynamic> json) => NotificationsResponse(
        data: List<NotificationApp>.from(json["data"].map((x) => NotificationApp.fromMap(x))),
        page: Page.fromMap(json["page"]),
    );

}

class NotificationApp {
    NotificationApp({
        required this.id,
        required this.residential,
        required this.anotherVariable,
        required this.viewed,
        required this.message,
        required this.subtitle,
        required this.title,
        required this.type,
        required this.notificationsableType,
        required this.notificationsableId,
        required this.user,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.image,
    });

    String id;
    String residential;
    String anotherVariable;
    bool viewed;
    String message;
    String subtitle;
    String title;
    String type;
    String notificationsableType;
    String notificationsableId;
    String user;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String? image;

    NotificationApp copyWith({
        String? id,
        String? residential,
        String? anotherVariable,
        bool? viewed,
        String? message,
        String? subtitle,
        String? title,
        String? type,
        String? notificationsableType,
        String? notificationsableId,
        String? user,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
        String? image,
    }) => 
        NotificationApp(
            id: id ?? this.id,
            residential: residential ?? this.residential,
            anotherVariable: anotherVariable ?? this.anotherVariable,
            viewed: viewed ?? this.viewed,
            message: message ?? this.message,
            subtitle: subtitle ?? this.subtitle,
            title: title ?? this.title,
            type: type ?? this.type,
            notificationsableType: notificationsableType ?? this.notificationsableType,
            notificationsableId: notificationsableId ?? this.notificationsableId,
            user: user ?? this.user,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
            image: image ?? this.image,
        );

    factory NotificationApp.fromJson(String str) => NotificationApp.fromMap(json.decode(str));

    factory NotificationApp.fromMap(Map<String, dynamic> json) => NotificationApp(
        id: json["_id"],
        residential: json["residential"],
        anotherVariable: json["another_variable"],
        viewed: json["viewed"],
        message: json["message"],
        subtitle: json["subtitle"],
        title: json["title"],
        type: json["type"],
        notificationsableType: json["notificationsableType"],
        notificationsableId: json["notificationsableId"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        image: json["image"] == null ? null : json["image"],
    );
}

class Page {
    Page({
        required this.total,
        required this.notviewed,
        required this.page,
        required this.lastPage,
    });

    int total;
    int notviewed;
    int page;
    int lastPage;

    Page copyWith({
        int? total,
        int? notviewed,
        int? page,
        int? lastPage,
    }) => 
        Page(
            total: total ?? this.total,
            notviewed: notviewed ?? this.notviewed,
            page: page ?? this.page,
            lastPage: lastPage ?? this.lastPage,
        );

    factory Page.fromJson(String str) => Page.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Page.fromMap(Map<String, dynamic> json) => Page(
        total: json["total"],
        notviewed: json["notviewed"],
        page: json["page"],
        lastPage: json["lastPage"],
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "notviewed": notviewed,
        "page": page,
        "lastPage": lastPage,
    };
}
