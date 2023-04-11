// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatMessageType.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ChatMessageType _$text = const ChatMessageType._('text');
const ChatMessageType _$message = const ChatMessageType._('message');
const ChatMessageType _$emergency = const ChatMessageType._('emergency');
const ChatMessageType _$audio = const ChatMessageType._('audio');
const ChatMessageType _$video = const ChatMessageType._('video');
const ChatMessageType _$image = const ChatMessageType._('image');

ChatMessageType _$chatMessageTypeValueOf(String name) {
  switch (name) {
    case 'text':
      return _$text;
    case 'message':
      return _$message;
    case 'emergency':
      return _$emergency;
    case 'audio':
      return _$audio;
    case 'video':
      return _$video;
    case 'image':
      return _$image;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ChatMessageType> _$chatMessageTypeValues =
    new BuiltSet<ChatMessageType>(const <ChatMessageType>[
  _$text,
  _$message,
  _$emergency,
  _$audio,
  _$video,
  _$image,
]);

Serializer<ChatMessageType> _$chatMessageTypeSerializer =
    new _$ChatMessageTypeSerializer();

class _$ChatMessageTypeSerializer
    implements PrimitiveSerializer<ChatMessageType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'text': 'text',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'text': 'text',
  };

  @override
  final Iterable<Type> types = const <Type>[ChatMessageType];
  @override
  final String wireName = 'ChatMessageType';

  @override
  Object serialize(Serializers serializers, ChatMessageType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ChatMessageType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ChatMessageType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
