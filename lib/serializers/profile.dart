import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/profiledetail.dart';
import 'package:hipal/serializers/profileuser.dart';
import 'package:hipal/serializers/rol.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/serializers.dart';

part 'profile.g.dart';

abstract class Profile implements Built<Profile, ProfileBuilder> {
  @BuiltValueField(wireName: '_id')
  ProfileUser? get id;
  String? get order;
  String? get fullname;
  User? get user;
  ProfileDetail? get profiles;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  BuiltList<String>? get roles;
  BuiltList<Rol>? get rolesDetail;
  BuiltList<String>? get apartments;
  BuiltList<Apartment>? get apartmentsDetail;

  @BuiltValueField(wireName: '__v')
  int? get v;


  Profile._();
  factory Profile([void Function(ProfileBuilder) updates]) = _$Profile;

  Object? toJson() {
    return serializers.serializeWith(Profile.serializer, this);
  }

  static Profile? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Profile.serializer, json);
  }

  static Serializer<Profile> get serializer => _$profileSerializer;
}