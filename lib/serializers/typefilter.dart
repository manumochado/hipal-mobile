import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'typefilter.g.dart';

abstract class TypeFilter implements Built<TypeFilter, TypeFilterBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;

  TypeFilter._();
  factory TypeFilter([void Function(TypeFilterBuilder) updates]) = _$TypeFilter;

  Object? toJson() {
    return serializers.serializeWith(TypeFilter.serializer, this);
  }

  static TypeFilter? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TypeFilter.serializer, json);
  }

  static Serializer<TypeFilter> get serializer => _$typeFilterSerializer;
}