// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documentaryCenter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DocumentaryCenter> _$documentaryCenterSerializer =
    new _$DocumentaryCenterSerializer();

class _$DocumentaryCenterSerializer
    implements StructuredSerializer<DocumentaryCenter> {
  @override
  final Iterable<Type> types = const [DocumentaryCenter, _$DocumentaryCenter];
  @override
  final String wireName = 'DocumentaryCenter';

  @override
  Iterable<Object?> serialize(Serializers serializers, DocumentaryCenter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Residential)));
    }
    value = object.numberDocuments;
    if (value != null) {
      result
        ..add('numberDocuments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.documents;
    if (value != null) {
      result
        ..add('documents')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Document)])));
    }
    value = object.nameCategory;
    if (value != null) {
      result
        ..add('nameCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  DocumentaryCenter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DocumentaryCenterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'numberDocuments':
          result.numberDocuments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'documents':
          result.documents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Document)]))!
              as BuiltList<Object?>);
          break;
        case 'nameCategory':
          result.nameCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$DocumentaryCenter extends DocumentaryCenter {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final int? numberDocuments;
  @override
  final BuiltList<Document>? documents;
  @override
  final String? nameCategory;
  @override
  final Image? image;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$DocumentaryCenter(
          [void Function(DocumentaryCenterBuilder)? updates]) =>
      (new DocumentaryCenterBuilder()..update(updates))._build();

  _$DocumentaryCenter._(
      {this.id,
      this.residential,
      this.numberDocuments,
      this.documents,
      this.nameCategory,
      this.image,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  DocumentaryCenter rebuild(void Function(DocumentaryCenterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentaryCenterBuilder toBuilder() =>
      new DocumentaryCenterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentaryCenter &&
        id == other.id &&
        residential == other.residential &&
        numberDocuments == other.numberDocuments &&
        documents == other.documents &&
        nameCategory == other.nameCategory &&
        image == other.image &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), residential.hashCode),
                            numberDocuments.hashCode),
                        documents.hashCode),
                    nameCategory.hashCode),
                image.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentaryCenter')
          ..add('id', id)
          ..add('residential', residential)
          ..add('numberDocuments', numberDocuments)
          ..add('documents', documents)
          ..add('nameCategory', nameCategory)
          ..add('image', image)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class DocumentaryCenterBuilder
    implements Builder<DocumentaryCenter, DocumentaryCenterBuilder> {
  _$DocumentaryCenter? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  int? _numberDocuments;
  int? get numberDocuments => _$this._numberDocuments;
  set numberDocuments(int? numberDocuments) =>
      _$this._numberDocuments = numberDocuments;

  ListBuilder<Document>? _documents;
  ListBuilder<Document> get documents =>
      _$this._documents ??= new ListBuilder<Document>();
  set documents(ListBuilder<Document>? documents) =>
      _$this._documents = documents;

  String? _nameCategory;
  String? get nameCategory => _$this._nameCategory;
  set nameCategory(String? nameCategory) => _$this._nameCategory = nameCategory;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DocumentaryCenterBuilder();

  DocumentaryCenterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _numberDocuments = $v.numberDocuments;
      _documents = $v.documents?.toBuilder();
      _nameCategory = $v.nameCategory;
      _image = $v.image?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentaryCenter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DocumentaryCenter;
  }

  @override
  void update(void Function(DocumentaryCenterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentaryCenter build() => _build();

  _$DocumentaryCenter _build() {
    _$DocumentaryCenter _$result;
    try {
      _$result = _$v ??
          new _$DocumentaryCenter._(
              id: id,
              residential: _residential?.build(),
              numberDocuments: numberDocuments,
              documents: _documents?.build(),
              nameCategory: nameCategory,
              image: _image?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'documents';
        _documents?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DocumentaryCenter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
