import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/document.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';

part 'advertisements.g.dart';

abstract class Advertisements
    implements Built<Advertisements, AdvertisementsBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  User? get users;
  Residential? get residential;
  BuiltList<Document>? get documents;
  String? get description;
  DateTime? get date;
  String? get theme;
  String? get link;
  String? get typeAds;
  Image? get image;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;

  Advertisements._();
  factory Advertisements([void Function(AdvertisementsBuilder) updates]) =
      _$Advertisements;

  Object? toJson() {
    return serializers.serializeWith(Advertisements.serializer, this);
  }

  static Advertisements? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Advertisements.serializer, json);
  }

  static Serializer<Advertisements> get serializer =>
      _$advertisementsSerializer;
}
