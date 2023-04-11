import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/image.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/utils/general.dart';


part 'classified.g.dart';

abstract class Classified implements Built<Classified, ClassifiedBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  int? get totalScore;
  String? get user;
  String? get publish;
  String? get state;
  String? get whatsappSeller;
  String? get emailSeller;
  String? get nameSeller;
  String? get description;
  Map? get residential;
  int? get price;
  String? get title;
  String? get link;
  BuiltList<Image>? get images;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;
  DateTime? get birthDate;

  Classified._();
  factory Classified([void Function(ClassifiedBuilder) updates]) = _$Classified;

  Classified copyWith(Classified updates) {
    return Classified((b) => b
      ..id = updates.id ?? id
      //..usser = updates.usser ?? usser
      ..publish = updates.publish ?? publish
      ..state = updates.state ?? state
      ..whatsappSeller = updates.whatsappSeller ?? whatsappSeller
      ..emailSeller = updates.emailSeller ?? emailSeller
      ..nameSeller = updates.nameSeller ?? nameSeller
      ..description = updates.description ?? description
      ..residential = updates.residential ?? residential
      ..price = updates.price ?? price
      ..title = updates.title ?? title
      ..link = updates.link ?? link
      ..images = (updates.images ?? images) as ListBuilder<Image>?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
      ..v= updates.v ?? v
      ..birthDate= updates.birthDate ?? birthDate
    );
  }

  setResidential(Map residential) {
    return Classified((b) => b
      ..residential = residential
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Classified.serializer, this);
  }

  static Classified? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Classified.serializer, json);
  }

  static Serializer<Classified> get serializer => _$classifiedSerializer;

   String get createdAtLocal => createdAt != null
      ? DateTimeHelper.ddMMyyyyTT(createdAt!.toLocal())
      : 'no definido';
}