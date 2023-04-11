import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/tower.dart';
import 'package:hipal/serializers/serializers.dart';

part 'apartment.g.dart';

abstract class Apartment implements Built<Apartment, ApartmentBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;
  Tower? get tower;

  Apartment._();
  factory Apartment([void Function(ApartmentBuilder) updates]) = _$Apartment;

  Object? toJson() {
    return serializers.serializeWith(Apartment.serializer, this);
  }

  static Apartment? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Apartment.serializer, json);
  }

  static Serializer<Apartment> get serializer => _$apartmentSerializer;
}
