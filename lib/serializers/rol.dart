import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'rol.g.dart';

abstract class Rol implements Built<Rol, RolBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;

  Rol._();
  factory Rol([void Function(RolBuilder) updates]) = _$Rol;

  Object? toJson() {
    return serializers.serializeWith(Rol.serializer, this);
  }

  static Rol? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Rol.serializer, json);
  }

  static Serializer<Rol> get serializer => _$rolSerializer;
}