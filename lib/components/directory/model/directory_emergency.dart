import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/city.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';

part 'directory_emergency.g.dart';

abstract class DirectoryEmergency implements Built<DirectoryEmergency, DirectoryEmergencyBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  City? get city;
  bool? get status;
  String? get webPage;
  String? get phone;
  String? get name;
  Image? get photo;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  DirectoryEmergency._();
  factory DirectoryEmergency([void Function(DirectoryEmergencyBuilder) updates]) = _$DirectoryEmergency;

  DirectoryEmergency copyWith(DirectoryEmergency updates) {
    return DirectoryEmergency((b) => b
      ..id = updates.id ?? id
      ..city = (updates.city ?? city) as CityBuilder?
      ..status = updates.status ?? status
      ..webPage = updates.webPage ?? webPage
      ..phone = updates.phone ?? phone
      ..name = updates.name ?? name
      ..photo = (updates.photo ?? photo) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(DirectoryEmergency.serializer, this);
  }

  static DirectoryEmergency? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DirectoryEmergency.serializer, json);
  }

  static Serializer<DirectoryEmergency> get serializer => _$directoryEmergencySerializer;
}