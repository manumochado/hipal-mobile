import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'document.g.dart';

abstract class Document implements Built<Document, DocumentBuilder> {
  String? get id;
  String? get url;
  DateTime? get createdAt;
  Document._();
  factory Document([void Function(DocumentBuilder) updates]) = _$Document;

  Document copyWith(Document updates) {
    return Document((b) => b
      ..id = updates.id ?? id
      ..url = updates.url ?? url
      ..createdAt = updates.createdAt ?? createdAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Document.serializer, this);
  }

  static Document? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Document.serializer, json);
  }

  static Serializer<Document> get serializer => _$documentSerializer;
}