import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/profileuser.dart';
import 'package:hipal/serializers/residential.dart';
import 'package:hipal/serializers/rol.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/serializers.dart';

part 'profileAuth.g.dart';

abstract class ProfileAuth implements Built<ProfileAuth, ProfileAuthBuilder> {
  @BuiltValueField(wireName: '_id')
  ProfileUser? get id;
  String? get apartment;
  Residential? get residential;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  BuiltList<String>? get roles;
  BuiltList<Rol>? get rolesDetail;
  BuiltList<String>? get apartments;
  BuiltList<Apartment>? get apartmentsDetail;

  @BuiltValueField(wireName: '__v')
  int? get v;


  ProfileAuth._();
  factory ProfileAuth([void Function(ProfileAuthBuilder) updates]) = _$ProfileAuth;

  Object? toJson() {
    return serializers.serializeWith(ProfileAuth.serializer, this);
  }

  static ProfileAuth? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProfileAuth.serializer, json);
  }

  static Serializer<ProfileAuth> get serializer => _$profileAuthSerializer;
}