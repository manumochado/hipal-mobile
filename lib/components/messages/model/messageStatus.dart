import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'messageStatus.g.dart';

class MessageStatus extends EnumClass {
  static const MessageStatus not_sent = _$not_sent;
  static const MessageStatus not_view = _$not_view;
  static const MessageStatus viewed = _$viewed;

  const MessageStatus._(String name) : super(name);
  
  static BuiltSet<MessageStatus> get values => _$messageStatusValues;
  static MessageStatus valueOf(String name) => _$messageStatusValueOf(name);

  Object? serialize() {
    return serializers.serializeWith(MessageStatus.serializer, this);
  }

  static MessageStatus? deserialize(String string) {
    return serializers.deserializeWith(MessageStatus.serializer, string);
  }

  static Serializer<MessageStatus> get serializer => _$messageStatusSerializer;
}