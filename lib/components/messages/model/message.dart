import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/chats/model/chat.dart';
import 'package:hipal/components/messages/model/chatMessageType.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/serializers.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;
  String? get message;
  Chat? get chat;
  BuiltList<String>? get is_views;
  BuiltList<String>? get is_deleted;
  User? get user_send;
  bool? get isSender;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  ChatMessageType? get messageType;
  String? get type;
  // MessageStatus? get messageStatus;

  @BuiltValueField(wireName: '__v')
  int? get v;

  Message._();
  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  Object? toJson() {
    return serializers.serializeWith(Message.serializer, this);
  }

  static Message? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Message.serializer, json);
  }

  static Serializer<Message> get serializer => _$messageSerializer;
}
