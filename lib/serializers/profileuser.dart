import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/serializers.dart';

part 'profileuser.g.dart';

abstract class ProfileUser implements Built<ProfileUser, ProfileUserBuilder> {
  String? get user;
  String? get residential;

  ProfileUser._();
  factory ProfileUser([void Function(ProfileUserBuilder) updates]) = _$ProfileUser;

  Object? toJson() {
    return serializers.serializeWith(ProfileUser.serializer, this);
  }

  static ProfileUser? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProfileUser.serializer, json);
  }

  static Serializer<ProfileUser> get serializer => _$profileUserSerializer;
}