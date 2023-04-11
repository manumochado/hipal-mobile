import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/serializers.dart';

part 'profiledetail.g.dart';

abstract class ProfileDetail implements Built<ProfileDetail, ProfileDetailBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get apartment;
  BuiltList<String>? get rol;
  String? get residential;
  String? get user;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  @BuiltValueField(wireName: '__v')
  int? get v;


  ProfileDetail._();
  factory ProfileDetail([void Function(ProfileDetailBuilder) updates]) = _$ProfileDetail;

  Object? toJson() {
    return serializers.serializeWith(ProfileDetail.serializer, this);
  }

  static ProfileDetail? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProfileDetail.serializer, json);
  }

  static Serializer<ProfileDetail> get serializer => _$profileDetailSerializer;
}