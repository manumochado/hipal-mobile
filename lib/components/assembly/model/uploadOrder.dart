import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'uploadOrder.g.dart';

abstract class UploadOrder implements Built<UploadOrder, UploadOrderBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get key;
  String? get url;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  UploadOrder._();
  factory UploadOrder([void Function(UploadOrderBuilder) updates]) = _$UploadOrder;

  UploadOrder copyWith(UploadOrder updates) {
    return UploadOrder((b) => b
      ..id = updates.id ?? id
      ..key = updates.key ?? key
      ..url = updates.url ?? url
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(UploadOrder.serializer, this);
  }

  static UploadOrder? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UploadOrder.serializer, json);
  }

  static Serializer<UploadOrder> get serializer => _$uploadOrderSerializer;
}