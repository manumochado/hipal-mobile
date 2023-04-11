import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/chats/model/chat.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/serializers.dart';

part 'messageLast.g.dart';

abstract class MessageLast implements Built<MessageLast, MessageLastBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;
  String? get message;
  String? get chat;
  BuiltList<String>? get is_views;
  BuiltList<String>? get is_deleted;
  String? get user_send;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  
  @BuiltValueField(wireName: '__v')
  int? get v;

  MessageLast._();
  factory MessageLast([void Function(MessageLastBuilder) updates]) = _$MessageLast;

  Object? toJson() {
    return serializers.serializeWith(MessageLast.serializer, this);
  }

  static MessageLast? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MessageLast.serializer, json);
  }

  static Serializer<MessageLast> get serializer => _$messageLastSerializer;
}