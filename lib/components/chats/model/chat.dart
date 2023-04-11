import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/messages/model/messageLast.dart';
import 'package:hipal/components/user/model/residential.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/components/user/model/user.dart';

part 'chat.g.dart';

abstract class Chat implements Built<Chat, ChatBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get type;
  String? get fullname;
  String? get residential;
  BuiltList<String>? get is_views;
  BuiltList<String>? get is_empty;
  BuiltList<String>? get is_deleted;
  int? get messageNotView;
  MessageLast? get messageLast;
  User? get user;
  BuiltList<User>? get users;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  
  @BuiltValueField(wireName: '__v')
  int? get v;
  String? get order;

  Chat._();
  factory Chat([void Function(ChatBuilder) updates]) = _$Chat;

  Chat copyWith(Chat updates) {
    return Chat((b) => b
      ..id = updates.id ?? id
      ..type = updates.type ?? type
      ..fullname = updates.fullname ?? fullname
      ..residential = updates.residential ?? residential
      ..is_views = (updates.is_views ?? is_views) as ListBuilder<String>?
      ..is_empty = (updates.is_empty ?? is_empty) as ListBuilder<String>?
      ..is_deleted = (updates.is_deleted ?? is_deleted) as ListBuilder<String>?
      ..messageNotView = updates.messageNotView ?? messageNotView
      ..messageLast = (updates.messageLast ?? messageLast) as MessageLastBuilder?
      ..user = (updates.user ?? user) as UserBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..v= updates.v ?? v
      ..order = updates.order ?? order
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Chat.serializer, this);
  }

  static Chat? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Chat.serializer, json);
  }

  static Serializer<Chat> get serializer => _$chatSerializer;
}