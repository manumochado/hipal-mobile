
import 'dart:convert';

class TypePqrResponse {
    TypePqrResponse({
        required this.data
    });

    List<TypePQR> data;

    factory TypePqrResponse.fromJson(String str) => TypePqrResponse.fromMap(json.decode(str));

    factory TypePqrResponse.fromMap(Map<String, dynamic> json) => TypePqrResponse(
        data: List<TypePQR>.from(json["data"].map((x) => TypePQR.fromMap(x))),
    );

}

class TypePQR {
    TypePQR({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory TypePQR.fromJson(String str) => TypePQR.fromMap(json.decode(str));

    factory TypePQR.fromMap(Map<String, dynamic> json) => TypePQR(
        id: json["_id"],
        name: json["name"],
    );

}
