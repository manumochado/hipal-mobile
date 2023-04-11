import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/apartmentUser.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/components/user/model/userName.dart';
import 'package:hipal/serializers/profileAuth.dart';

import 'package:hipal/serializers/serializers.dart';

part 'userInfo.g.dart';

abstract class UserInfo implements Built<UserInfo, UserInfoBuilder> {

  User? get user;
  ApartmentUser? get apartment;
  UserName? get userName;
  ProfileAuth? get profile;

  UserInfo._();
  factory UserInfo([void Function(UserInfoBuilder) updates]) = _$UserInfo;

  UserInfo copyWith(UserInfoBuilder updates) {
    return UserInfo((b) => b
      ..user = (updates.user )
      ..apartment = (updates.apartment)
      ..userName = (updates.userName)
    );
  }

  Object? toJson() {
    return serializers.serializeWith(UserInfo.serializer, this);
  }

  static UserInfo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserInfo.serializer, json);
  }

  static Serializer<UserInfo> get serializer => _$userInfoSerializer;

}