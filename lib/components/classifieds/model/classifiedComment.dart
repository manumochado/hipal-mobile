import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';


import 'package:hipal/serializers/serializers.dart';


part 'classifiedComment.g.dart';

abstract class ClassifiedComment implements Built<ClassifiedComment, ClassifiedCommentBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get classified;
  User? get user;
  String? get message;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  

  ClassifiedComment._();
  factory ClassifiedComment([void Function(ClassifiedCommentBuilder) updates]) = _$ClassifiedComment;


  Object? toJson() {
    return serializers.serializeWith(ClassifiedComment.serializer, this);
  }

  static ClassifiedComment? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ClassifiedComment.serializer, json);
  }

  static Serializer<ClassifiedComment> get serializer => _$classifiedCommentSerializer;
}