import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'vehicle.g.dart';

abstract class Vehicle implements Built<Vehicle, VehicleBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  
  Apartment? get apartment;
  Image? get image;
  TypeFilter? get type;
  String? get color;
  String? get plate;
  int? get year;
  String? get model;
  String? get mark;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;

  Vehicle._();
  factory Vehicle([void Function(VehicleBuilder) updates]) = _$Vehicle;

  Vehicle copyWith(Vehicle updates) {
    return Vehicle((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentBuilder?
      ..color = updates.color ?? color
      ..type = (updates.type ?? type) as TypeFilterBuilder?
      ..image = (updates.image ?? image) as ImageBuilder?
      ..plate = updates.plate ?? plate
      ..year = updates.year ?? year
      ..model = updates.model ?? model
      ..mark = updates.mark ?? mark
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..v= updates.v ?? v
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Vehicle.serializer, this);
  }

  static Vehicle? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Vehicle.serializer, json);
  }

  static Serializer<Vehicle> get serializer => _$vehicleSerializer;
}