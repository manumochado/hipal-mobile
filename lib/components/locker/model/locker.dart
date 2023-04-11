import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';

part 'locker.g.dart';

abstract class Locker implements Built<Locker, LockerBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Apartment? get apartment;
  String? get state;
  DateTime? get date;
  String? get receivesName;
  String? get recipientPhone;
  String? get recipientName;
  String? get sender;
  Image? get image;
  DateTime? get dateState;
  String? get descriptionState;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  Locker._();
  factory Locker([void Function(LockerBuilder) updates]) = _$Locker;

  Locker copyWith(Locker updates) {
    return Locker((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentBuilder?
      ..state = updates.state ?? state
      ..date = updates.date ?? date
      ..receivesName = updates.receivesName ?? receivesName
      ..recipientPhone = updates.recipientPhone ?? recipientPhone
      ..recipientName = updates.recipientName ?? recipientName
      ..sender = updates.sender ?? sender
      ..image = (updates.image ?? image) as ImageBuilder?
      ..dateState = updates.dateState ?? dateState
      ..descriptionState = updates.descriptionState ?? descriptionState
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Locker.serializer, this);
  }

  static Locker? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Locker.serializer, json);
  }

  static Serializer<Locker> get serializer => _$lockerSerializer;
}