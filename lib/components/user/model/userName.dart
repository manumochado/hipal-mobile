import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';

part 'userName.g.dart';

abstract class UserName implements Built<UserName, UserNameBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;

  UserName._();
  factory UserName([void Function(UserNameBuilder) updates]) = _$UserName;

  UserName copyWith(UserName updates) {
    return UserName((b) => b
      ..id = updates.id ?? id
      ..name = updates.name ?? name
    );
  }

  Object? toJson() {
    return serializers.serializeWith(UserName.serializer, this);
  }

  static UserName? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserName.serializer, json);
  }

  static Serializer<UserName> get serializer => _$userNameSerializer;

}