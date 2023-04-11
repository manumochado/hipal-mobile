
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/apartmentUser.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/serializers/serializers.dart';



part 'streaming.g.dart';

abstract class Streaming implements Built<Streaming, StreamingBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get topic;
  String? get description;
  BuiltList<ApartmentUser>? get apartments;
  DateTime? get date;
  String? get time;
  String? get hour;
  String? get minutes;
  String? get host;
  String? get link;
  String? get passwordLink;
  User get users;


  Streaming._();
  factory Streaming([void Function(StreamingBuilder) updates]) = _$Streaming;

  Streaming copyWith(Streaming updates) {
    return Streaming((b) => b
      ..topic = updates.topic ?? topic
      ..description = updates.description ?? description
      ..apartments = (updates.apartments ?? apartments) as ListBuilder<ApartmentUser>?
      ..date = updates.date ?? date
      ..time = updates.time ?? time
      ..hour = updates.hour ?? hour
      ..minutes = updates.minutes ?? minutes
      ..host = updates.host ?? host
      ..link = updates.link ?? link
      ..passwordLink = updates.passwordLink ?? passwordLink
      
      
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Streaming.serializer, this);
  }

  static Streaming? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Streaming.serializer, json);
  }

  static Serializer<Streaming> get serializer => _$streamingSerializer;
}