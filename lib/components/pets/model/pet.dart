import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'pet.g.dart';

abstract class Pet implements Built<Pet, PetBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  
  Apartment? get apartment;
  bool? get vaccinated;
  String? get color;
  int? get age;
  String? get race;
  String? get name;
  TypeFilter? get type;
  Image? get image;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;
  DateTime? get birthDate;

  Pet._();
  factory Pet([void Function(PetBuilder) updates]) = _$Pet;

  Pet copyWith(Pet updates) {
    return Pet((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentBuilder?
      ..vaccinated = updates.vaccinated ?? vaccinated
      ..color = updates.color ?? color
      ..race = updates.race ?? race
      ..name = updates.name ?? name
      ..type = (updates.type ?? type) as TypeFilterBuilder?
      ..image = (updates.image ?? image) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..v= updates.v ?? v
      ..birthDate= updates.birthDate ?? birthDate
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Pet.serializer, this);
  }

  static Pet? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Pet.serializer, json);
  }

  static Serializer<Pet> get serializer => _$petSerializer;
}