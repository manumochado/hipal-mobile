import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/typefilter.dart';
part 'delivery.g.dart';

abstract class Delivery implements Built<Delivery, DeliveryBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Image? get image;
  String? get name;
  String? get description;
  TypeFilter? get type;

  Delivery._();
  factory Delivery([void Function(DeliveryBuilder) updates]) = _$Delivery;

  Object? toJson() {
    return serializers.serializeWith(Delivery.serializer, this);
  }

  static Delivery? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Delivery.serializer, json);
  }

  static Serializer<Delivery> get serializer => _$deliverySerializer;
}
