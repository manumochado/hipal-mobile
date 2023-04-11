

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';

part 'city.g.dart';

abstract class City implements Built<City, CityBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;

  City._();
  factory City([void Function(CityBuilder) updates]) = _$City;

  City copyWith(City updates) {
    return City((b) => b
      ..id = updates.id ?? id
      ..name = updates.name ?? name
    );
  }

  Object? toJson() {
    return serializers.serializeWith(City.serializer, this);
  }

  static City? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(City.serializer, json);
  }

  static Serializer<City> get serializer => _$citySerializer;

}