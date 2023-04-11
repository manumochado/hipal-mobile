import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/document.dart';
import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/image.dart';

part 'documentaryCenter.g.dart';

abstract class DocumentaryCenter implements Built<DocumentaryCenter, DocumentaryCenterBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  int? get numberDocuments;
  BuiltList<Document>? get documents;
  String? get nameCategory;
  Image? get image;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  DocumentaryCenter._();
  factory DocumentaryCenter([void Function(DocumentaryCenterBuilder) updates]) = _$DocumentaryCenter;

  DocumentaryCenter copyWith(DocumentaryCenter updates) {
    return DocumentaryCenter((b) => b
      ..id = updates.id ?? id
      ..residential = (updates.residential ?? residential) as ResidentialBuilder?
      ..numberDocuments = updates.numberDocuments ?? numberDocuments
      ..documents = (updates.documents ?? documents) as ListBuilder<Document>?
      ..nameCategory = updates.nameCategory ?? nameCategory
      ..image = (updates.image ?? image) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt = updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(DocumentaryCenter.serializer, this);
  }

  static DocumentaryCenter? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DocumentaryCenter.serializer, json);
  }

  static Serializer<DocumentaryCenter> get serializer => _$documentaryCenterSerializer;
}