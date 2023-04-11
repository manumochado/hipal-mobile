import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/assembly/model/currentlyAssembly.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/apartment.dart';

import 'package:hipal/serializers/serializers.dart';

part 'powerAssembly.g.dart';

abstract class PowerAssembly
    implements Built<PowerAssembly, PowerAssemblyBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Apartment? get apartment;
  String? get name;
  String? get identity;
  String? get email;
  CurrentlyAssembly? get assembly;
  User? get user;
  String? get cost;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  PowerAssembly._();
  factory PowerAssembly([void Function(PowerAssemblyBuilder) updates]) =
      _$PowerAssembly;

  PowerAssembly copyWith(PowerAssembly updates) {
    return PowerAssembly((b) => b
      ..id = updates.id ?? id
      ..name = updates.name ?? name
      ..identity = updates.identity ?? identity
      ..email = updates.email ?? email
      ..assembly = (updates.assembly ?? assembly) as CurrentlyAssemblyBuilder?
      ..user = (updates.user ?? user) as UserBuilder?
      ..cost = updates.cost ?? cost
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt = updates.updatedAt ?? updatedAt);
  }

  Object? toJson() {
    return serializers.serializeWith(PowerAssembly.serializer, this);
  }

  static PowerAssembly? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PowerAssembly.serializer, json);
  }

  static Serializer<PowerAssembly> get serializer => _$powerAssemblySerializer;
}
