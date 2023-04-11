
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/document.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';


part 'management.g.dart';

abstract class Management implements Built<Management, ManagementBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  BuiltList<Document>? get documents;
  String? get mayoralPermit;
  String? get nameBussiness;
  DateTime? get termCharge;
  String? get rut;
  String? get registrationProfession;
  String? get profession;
  String? get profile;
  DateTime? get dateBirth;
  String? get phone;
  String? get email;
  String? get lastNames;
  String? get names;
  Image? get image;
  DateTime? get updatedAt;
  int? get v;

  Management._();
  factory Management([void Function(ManagementBuilder) updates]) = _$Management;

 
  Object? toJson() {
    return serializers.serializeWith(Management.serializer, this);
  }

  static Management? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Management.serializer, json);
  }

  static Serializer<Management> get serializer => _$managementSerializer;
}