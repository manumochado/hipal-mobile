import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'image.g.dart';

abstract class Image implements Built<Image, ImageBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get url;

  Image._();
  factory Image([void Function(ImageBuilder) updates]) = _$Image;

  Object? toJson() {
    return serializers.serializeWith(Image.serializer, this);
  }

  static Image? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Image.serializer, json);
  }

  static Serializer<Image> get serializer => _$imageSerializer;
}