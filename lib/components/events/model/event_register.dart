import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/events/model/events.dart';
import 'package:hipal/components/user/model/user.dart';

import 'package:hipal/serializers/serializers.dart';

part 'event_register.g.dart';

abstract class EventRegister implements Built<EventRegister, EventRegisterBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Events? get event;
  User? get user;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  EventRegister._();
  factory EventRegister([void Function(EventRegisterBuilder) updates]) = _$EventRegister;

  EventRegister copyWith(EventRegister updates) {
    return EventRegister((b) => b
      ..id = updates.id ?? id
      ..event = (updates.event ?? event) as EventsBuilder?
      ..user = (updates.user ?? user) as UserBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(EventRegister.serializer, this);
  }

  static EventRegister? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(EventRegister.serializer, json);
  }

  static Serializer<EventRegister> get serializer => _$eventRegisterSerializer;
}