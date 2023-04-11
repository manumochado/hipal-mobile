import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/image.dart';

part 'events.g.dart';

abstract class Events implements Built<Events, EventsBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  String? get phoneOrganizer;
  String? get nameOrganizer;
  Image? get imageOrganizer;
  String? get description;
  String? get hour;
  DateTime? get date;
  String? get site;
  String? get name;
  String? get stated;
  Image? get imageEvent;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  Events._();
  factory Events([void Function(EventsBuilder) updates]) = _$Events;

  Events copyWith(Events updates) {
    return Events((b) => b
      ..id = updates.id ?? id
      ..residential = (updates.residential ?? residential) as ResidentialBuilder?
      ..phoneOrganizer = updates.phoneOrganizer ?? phoneOrganizer
      ..nameOrganizer = updates.nameOrganizer ?? nameOrganizer
      ..imageOrganizer = (updates.imageOrganizer ?? imageOrganizer) as ImageBuilder?
      ..description = updates.description ?? description
      ..hour = updates.hour ?? hour
      ..date = updates.date ?? date
      ..site = updates.site ?? site
      ..name = updates.name ?? name
      ..stated = updates.stated ?? stated
      ..imageEvent = (updates.imageEvent ?? imageEvent) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..stated= updates.stated ?? stated
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Events.serializer, this);
  }

  static Events? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Events.serializer, json);
  }

  static Serializer<Events> get serializer => _$eventsSerializer;
}