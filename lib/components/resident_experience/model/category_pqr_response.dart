
import 'dart:convert';

class CategoryPqrResponse {
    CategoryPqrResponse({
        required this.data,
    });

    List<CategoryPQR> data;

    factory CategoryPqrResponse.fromJson(String str) => CategoryPqrResponse.fromMap(json.decode(str));

    factory CategoryPqrResponse.fromMap(Map<String, dynamic> json) => CategoryPqrResponse(
        data: List<CategoryPQR>.from(json["data"].map((x) => CategoryPQR.fromMap(x)))
    );

}

class CategoryPQR {
    CategoryPQR({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory CategoryPQR.fromJson(String str) => CategoryPQR.fromMap(json.decode(str));

    factory CategoryPQR.fromMap(Map<String, dynamic> json) => CategoryPQR(
        id: json["_id"],
        name: json["name"],
    );
}

