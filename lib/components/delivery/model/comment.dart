

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';

import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';

part 'comment.g.dart';

abstract class Comment implements Built<Comment, CommentBuilder> { 

  
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get directoryAddress;
  String? get message;
  User? get user;
  double? get qualification;
  String? get lastname;
  String? get firstname;
  DateTime? get createdAt;
  DateTime? get updatedAt;


  Comment._();
  factory Comment([void Function(CommentBuilder) updates]) = _$Comment;

  Comment copyWith(Comment updates) {
    return Comment((b) => b
      ..id = updates.id ?? id
      ..directoryAddress = updates.directoryAddress ?? directoryAddress
      ..message = updates.message ?? message
      ..qualification = updates.qualification ?? qualification
      ..firstname = updates.firstname ?? firstname
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Comment.serializer, this);
  }

  static Comment? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Comment.serializer, json);
  }

  static Serializer<Comment> get serializer => _$commentSerializer;
  
}