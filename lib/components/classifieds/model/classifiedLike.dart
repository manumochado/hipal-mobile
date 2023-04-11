import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/classifieds/model/classified.dart';
import 'package:hipal/components/user/model/user.dart';


import 'package:hipal/serializers/serializers.dart';


part 'classifiedLike.g.dart';

abstract class ClassifiedLike implements Built<ClassifiedLike, ClassifiedLikeBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get classified;
  String? get users;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  

  ClassifiedLike._();
  factory ClassifiedLike([void Function(ClassifiedLikeBuilder) updates]) = _$ClassifiedLike;

  ClassifiedLike copyWith(ClassifiedLike updates) {
    return ClassifiedLike((b) => b
      ..id = updates.id ?? id
      ..classified = updates.classified ?? classified
      ..users = updates.users ?? users
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(ClassifiedLike.serializer, this);
  }

  static ClassifiedLike? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ClassifiedLike.serializer, json);
  }

  static Serializer<ClassifiedLike> get serializer => _$classifiedLikeSerializer;
}