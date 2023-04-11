import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'residential.g.dart';

abstract class Residential implements Built<Residential, ResidentialBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;
  String? get address;

  Residential._();
  factory Residential([void Function(ResidentialBuilder) updates]) = _$Residential;

  Object? toJson() {
    return serializers.serializeWith(Residential.serializer, this);
  }

  static Residential? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Residential.serializer, json);
  }

  static Serializer<Residential> get serializer => _$residentialSerializer;
}