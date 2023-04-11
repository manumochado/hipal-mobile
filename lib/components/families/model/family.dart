import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'family.g.dart';

abstract class Family implements Built<Family, FamilyBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  
  Apartment? get apartment;
  Image? get image;
  TypeFilter? get type;
  String? get name;
  String? get identity;
  String? get email;
  String? get phone;
  String? get gender;
  DateTime? get birthDate;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;

  Family._();
  factory Family([void Function(FamilyBuilder) updates]) = _$Family;

  Family copyWith(Family updates) {
    return Family((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentBuilder?
      ..name = updates.name ?? name
      ..type = (updates.type ?? type) as TypeFilterBuilder?
      ..image = (updates.image ?? image) as ImageBuilder?
      ..identity = updates.identity ?? identity
      ..email = updates.email ?? email
      ..phone = updates.phone ?? phone
      ..gender = updates.gender ?? gender
      ..birthDate = updates.birthDate ?? birthDate
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..v= updates.v ?? v
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Family.serializer, this);
  }

  static Family? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Family.serializer, json);
  }

  static Serializer<Family> get serializer => _$familySerializer;
}