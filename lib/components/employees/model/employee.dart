import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'employee.g.dart';

abstract class Employee implements Built<Employee, EmployeeBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  
  Apartment? get apartment;
  Image? get image;
  String? get name;
  String? get identity;
  String? get phone;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;

  Employee._();
  factory Employee([void Function(EmployeeBuilder) updates]) = _$Employee;

  Employee copyWith(Employee updates) {
    return Employee((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentBuilder?
      ..name = updates.name ?? name
      ..image = (updates.image ?? image) as ImageBuilder?
      ..identity = updates.identity ?? identity
      ..phone = updates.phone ?? phone
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..v= updates.v ?? v
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Employee.serializer, this);
  }

  static Employee? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Employee.serializer, json);
  }

  static Serializer<Employee> get serializer => _$employeeSerializer;
}