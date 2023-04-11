import 'dart:convert';

class UnviewedNofificationsResponse {
    UnviewedNofificationsResponse({
        required this.unviewed,
        required this.total,
    });

    List<UnviewedNotifications> unviewed;
    int total;

    factory UnviewedNofificationsResponse.fromJson(String str) => UnviewedNofificationsResponse.fromMap(json.decode(str));

    factory UnviewedNofificationsResponse.fromMap(Map<String, dynamic> json) => UnviewedNofificationsResponse(
        unviewed: List<UnviewedNotifications>.from(json["unviewed"].map((x) => UnviewedNotifications.fromMap(x))),
        total: json["total"],
    );
}

class UnviewedNotifications {
    UnviewedNotifications({
        required this.count,
        required this.type,
    });

    int count;
    String type;

    UnviewedNotifications copyWith({
        int? count,
        String? type,
    }) => 
        UnviewedNotifications(
            count: count ?? this.count,
            type: type ?? this.type,
        );

    factory UnviewedNotifications.empty() => UnviewedNotifications(count: 0, type: '');
    
    factory UnviewedNotifications.fromJson(String str) => UnviewedNotifications.fromMap(json.decode(str));

    factory UnviewedNotifications.fromMap(Map<String, dynamic> json) => UnviewedNotifications(
        count: json["count"],
        type: json["type"],
    );
}
