import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/serializers.dart';

part 'friends.g.dart';

abstract class Friends implements Built<Friends, FriendsBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  User? get user;
  String? get identity;
  String? get lastName;
  String? get name;


  Friends._();
  factory Friends([void Function(FriendsBuilder) updates]) = _$Friends;

  Friends copyWith(Friends updates) {
    return Friends((b) => b
      ..id = updates.id ?? id
      ..user = (updates.user ?? user) as UserBuilder?
      ..identity = updates.identity ?? identity
      ..lastName = updates.lastName ?? lastName
      ..name = updates.name ?? name
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Friends.serializer, this);
  }

  static Friends? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Friends.serializer, json);
  }

  static Serializer<Friends> get serializer => _$friendsSerializer;
}