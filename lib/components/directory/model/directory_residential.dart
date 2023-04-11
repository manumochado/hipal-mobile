import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';

part 'directory_residential.g.dart';

abstract class DirectoryResidential implements Built<DirectoryResidential, DirectoryResidentialBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get residential;
  String? get position;
  String? get nameCompany;
  String? get stated;
  String? get phone;
  String? get email;
  String? get lastName;
  String? get name;
  Image? get photo;
  DateTime? get createdAt;
  DateTime? get updatedAt;


  DirectoryResidential._();
  factory DirectoryResidential([void Function(DirectoryResidentialBuilder) updates]) = _$DirectoryResidential;

  DirectoryResidential copyWith(DirectoryResidential updates) {
    return DirectoryResidential((b) => b
      ..id = updates.id ?? id
      ..residential = updates.residential ?? residential
      ..position = updates.position ?? position
      ..nameCompany = updates.nameCompany ?? nameCompany
      ..stated = updates.stated ?? stated
      ..phone = updates.phone ?? phone
      ..email = updates.email ?? email
      ..lastName = updates.lastName ?? lastName
      ..name = updates.name ?? name
      ..photo = (updates.photo ?? photo) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt

    );
  }

  Object? toJson() {
    return serializers.serializeWith(DirectoryResidential.serializer, this);
  }

  static DirectoryResidential? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DirectoryResidential.serializer, json);
  }

  static Serializer<DirectoryResidential> get serializer => _$directoryResidentialSerializer;
}