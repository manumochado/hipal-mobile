import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/serializers/apartment.dart';

import 'package:hipal/serializers/serializers.dart';

part 'commentAssembly.g.dart';

abstract class CommentAssembly
    implements Built<CommentAssembly, CommentAssemblyBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Apartment? get apartment;
  String? get assembly;
  User? get user;
  String? get message;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  CommentAssembly._();
  factory CommentAssembly([void Function(CommentAssemblyBuilder) updates]) =
      _$CommentAssembly;

  Object? toJson() {
    return serializers.serializeWith(CommentAssembly.serializer, this);
  }

  static CommentAssembly? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CommentAssembly.serializer, json);
  }

  static Serializer<CommentAssembly> get serializer =>
      _$commentAssemblySerializer;
}
