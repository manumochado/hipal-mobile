import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/image.dart';

part 'service.g.dart';

abstract class Service implements Built<Service, ServiceBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Apartment? get apartment;
  String? get contract;
  String? get provider;
  String? get type;
  Image? get image;
  DateTime? get createdAt;
  DateTime? get updatedAt;



  Service._();
  factory Service([void Function(ServiceBuilder) updates]) = _$Service;

  Service copyWith(Service updates) {
    return Service((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentBuilder?
      ..contract = updates.contract ?? contract
      ..provider = updates.provider ?? provider
      ..type = updates.type ?? type
      ..image = (updates.image ?? image) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Service.serializer, this);
  }

  static Service? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Service.serializer, json);
  }

  static Serializer<Service> get serializer => _$serviceSerializer;
}