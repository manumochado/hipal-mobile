

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get key;
  String? get url;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  Photo._();
  factory Photo([void Function(PhotoBuilder) updates]) = _$Photo;

  Photo copyWith(Photo updates) {
    return Photo((b) => b
      ..id = updates.id ?? id
      ..key = updates.key ?? key
      ..url = updates.url ?? url
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Photo.serializer, this);
  }

  static Photo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Photo.serializer, json);
  }

  static Serializer<Photo> get serializer => _$photoSerializer;

}