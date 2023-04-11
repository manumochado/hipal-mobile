import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';

import 'package:hipal/serializers/serializers.dart';

part 'tower.g.dart';

abstract class Tower implements Built<Tower, TowerBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  String? get name;

  Tower._();
  factory Tower([void Function(TowerBuilder) updates]) = _$Tower;

  Tower copyWith(Tower updates) {
    return Tower((b) => b
      ..id = updates.id ?? id
      ..name = updates.name ?? name
      ..residential = (updates.residential ?? residential) as ResidentialBuilder
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Tower.serializer, this);
  }

  static Tower? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Tower.serializer, json);
  }

  static Serializer<Tower> get serializer => _$towerSerializer;

}