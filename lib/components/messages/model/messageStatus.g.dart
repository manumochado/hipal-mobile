// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messageStatus.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MessageStatus _$not_sent = const MessageStatus._('not_sent');
const MessageStatus _$not_view = const MessageStatus._('not_view');
const MessageStatus _$viewed = const MessageStatus._('viewed');

MessageStatus _$messageStatusValueOf(String name) {
  switch (name) {
    case 'not_sent':
      return _$not_sent;
    case 'not_view':
      return _$not_view;
    case 'viewed':
      return _$viewed;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MessageStatus> _$messageStatusValues =
    new BuiltSet<MessageStatus>(const <MessageStatus>[
  _$not_sent,
  _$not_view,
  _$viewed,
]);

Serializer<MessageStatus> _$messageStatusSerializer =
    new _$MessageStatusSerializer();

class _$MessageStatusSerializer implements PrimitiveSerializer<MessageStatus> {
  @override
  final Iterable<Type> types = const <Type>[MessageStatus];
  @override
  final String wireName = 'MessageStatus';

  @override
  Object serialize(Serializers serializers, MessageStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MessageStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MessageStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
