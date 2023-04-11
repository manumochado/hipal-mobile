import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'chatMessageType.g.dart';

class ChatMessageType extends EnumClass {
  @BuiltValueEnumConst(wireName: 'text')
  static const ChatMessageType text =  _$text;
  static const ChatMessageType message =  _$message;
  static const ChatMessageType emergency =  _$emergency;
  static const ChatMessageType audio = _$audio;
  static const ChatMessageType video = _$video;
  static const ChatMessageType image = _$image;
  

  const ChatMessageType._(String name) : super(name);
  
  static BuiltSet<ChatMessageType> get values => _$chatMessageTypeValues;
  static ChatMessageType valueOf(String name) => _$chatMessageTypeValueOf(name);

  String? serialize() {
    return serializers.serializeWith(ChatMessageType.serializer, this).toString();
  }

  static ChatMessageType? deserialize(String string) {
    return serializers.deserializeWith(ChatMessageType.serializer, string);
  }

  static Serializer<ChatMessageType> get serializer => _$chatMessageTypeSerializer;
}