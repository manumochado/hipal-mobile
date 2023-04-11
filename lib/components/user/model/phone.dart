import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';

import 'package:hipal/serializers/image.dart';

part 'phone.g.dart';

abstract class Phone implements Built<Phone, PhoneBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get number;
  String? get countryCode;
  String? get nationalNumber;
  String? get internationalNumber;
  String? get e164Number;

  Phone._();
  factory Phone([void Function(PhoneBuilder) updates]) = _$Phone;

  Phone copyWith(Phone updates) {
    return Phone((b) => b
      ..id = updates.id ?? id
      ..number = updates.number ?? number
      ..countryCode = updates.countryCode ?? countryCode
      ..nationalNumber = updates.nationalNumber ?? nationalNumber
      ..internationalNumber = updates.internationalNumber ?? internationalNumber
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Phone.serializer, this);
  }

  static Phone? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Phone.serializer, json);
  }

  static Serializer<Phone> get serializer => _$phoneSerializer;

}