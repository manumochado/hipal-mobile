import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';

part 'lost_object.g.dart';

abstract class LostObject implements Built<LostObject, LostObjectBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  String? get state;
  String? get fullName;
  DateTime? get dateEntry;
  String? get description;
  String? get color;
  String? get mark;
  String? get nameObject;
  BuiltList<Image>? get images;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  LostObject._();
  factory LostObject([void Function(LostObjectBuilder) updates]) = _$LostObject;

  LostObject copyWith(LostObject updates) {
    return LostObject((b) => b
      ..id = updates.id ?? id
      ..residential = (updates.residential ?? residential) as ResidentialBuilder?
      ..state = updates.state ?? state
      ..fullName = updates.fullName ?? fullName
      ..dateEntry = updates.dateEntry ?? dateEntry
      ..description = updates.description ?? description
      ..color = updates.color ?? color
      ..mark = updates.mark ?? mark
      ..nameObject = updates.nameObject ?? nameObject
      ..images = (updates.images ?? images) as ListBuilder<Image>?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(LostObject.serializer, this);
  }

  static LostObject? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LostObject.serializer, json);
  }

  static Serializer<LostObject> get serializer => _$lostObjectSerializer;
}