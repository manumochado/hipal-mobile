
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';

part 'addressDelivery.g.dart';

abstract class AddressDelivery implements Built<AddressDelivery, AddressDeliveryBuilder> { 

  
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get name;
  String? get phone;
  String? get address;
  Image? get photo;
  double? get qualifiers;
  double? get score;

  AddressDelivery._();
  factory AddressDelivery([void Function(AddressDeliveryBuilder) updates]) = _$AddressDelivery;

  Object? toJson() {
    return serializers.serializeWith(AddressDelivery.serializer, this);
  }

  static AddressDelivery? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AddressDelivery.serializer, json);
  }

  static Serializer<AddressDelivery> get serializer => _$addressDeliverySerializer;
  

}