import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/tower.dart';
import 'package:hipal/serializers/serializers.dart';

import '../../apartment/model/ApartamentUpdate.dart';

part 'apartmentUser.g.dart';

abstract class ApartmentUser
    implements Built<ApartmentUser, ApartmentUserBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Tower? get tower;
  String? get name;
  int? get area;
  String? get deposit;
  String? get realEstateRegistration;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  List<Parking>? get parkings;

  ApartmentUser._();
  factory ApartmentUser([void Function(ApartmentUserBuilder) updates]) =
      _$ApartmentUser;

  ApartmentUser copyWith(ApartmentUser updates) {
    return ApartmentUser((b) => b
      ..id = updates.id ?? id
      ..tower = (updates.tower ?? tower) as TowerBuilder
      ..parkings = (updates.parkings ?? parkings) as List<Parking>
      ..name = updates.name ?? name
      ..area = updates.area ?? area
      ..deposit = updates.deposit ?? deposit
      ..realEstateRegistration =
          updates.realEstateRegistration ?? realEstateRegistration
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt = updates.updatedAt ?? updatedAt);
  }

  Object? toJson() {
    return serializers.serializeWith(ApartmentUser.serializer, this);
  }

  static ApartmentUser? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ApartmentUser.serializer, json);
  }

  static Serializer<ApartmentUser> get serializer => _$apartmentUserSerializer;
}
