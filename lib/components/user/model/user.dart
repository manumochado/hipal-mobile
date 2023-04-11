import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/phone.dart';
import 'package:hipal/components/user/model/photo.dart';
import 'package:hipal/serializers/serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get email;
  Phone? get phone;
  String? get gender;
  String? get lastname;
  String? get firstname;
  String? get identity;
  DateTime? get birthDate;
  Photo? get photo;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  BuiltList<String>? get socialNetworks;
  bool? get is_enabled_chats;
  int? get v;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;

  User copyWith(User updates) {
    return User((b) => b
      ..id = updates.id ?? id
      ..is_enabled_chats = updates.is_enabled_chats ?? is_enabled_chats
      ..email = updates.email ?? email
      ..phone = (updates.phone) as PhoneBuilder?
      ..gender = updates.gender ?? gender
      ..lastname = updates.lastname ?? lastname
      ..firstname = updates.firstname ?? firstname
      ..photo = updates.photo as PhotoBuilder?
      ..socialNetworks =
          (updates.socialNetworks ?? socialNetworks) as ListBuilder<String>?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt = updates.updatedAt ?? updatedAt
      ..v = updates.v ?? v
      ..birthDate = updates.birthDate ?? birthDate);
  }

  Object? toJson() {
    return serializers.serializeWith(User.serializer, this);
  }

  static User? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(User.serializer, json);
  }

  static Serializer<User> get serializer => _$userSerializer;
}
