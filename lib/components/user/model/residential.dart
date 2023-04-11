

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';

import 'city.dart';

part 'residential.g.dart';

abstract class Residential implements Built<Residential, ResidentialBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  City? get city;
  String? get name;
  String? get address;
  String? get plan;

  Residential._();
  factory Residential([void Function(ResidentialBuilder) updates]) = _$Residential;

  Residential copyWith(Residential updates) {
    return Residential((b) => b
      ..id = updates.id ?? id
      ..city = (updates.city ?? city) as CityBuilder?
      ..name = updates.name ?? name
      ..address = updates.address ?? address
      ..plan = updates.plan ?? plan
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Residential.serializer, this);
  }

  static Residential? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Residential.serializer, json);
  }

  static Serializer<Residential> get serializer => _$residentialSerializer;

}