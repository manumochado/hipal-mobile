// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managementReport.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ManagementReport> _$managementReportSerializer =
    new _$ManagementReportSerializer();

class _$ManagementReportSerializer
    implements StructuredSerializer<ManagementReport> {
  @override
  final Iterable<Type> types = const [ManagementReport, _$ManagementReport];
  @override
  final String wireName = 'ManagementReport';

  @override
  Iterable<Object?> serialize(Serializers serializers, ManagementReport object,
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
    value = object.documents;
    if (value != null) {
      result
        ..add('documents')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Document)])));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Residential)));
    }
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ManagementReport deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ManagementReportBuilder();

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
        case 'documents':
          result.documents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Document)]))!
              as BuiltList<Object?>);
          break;
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ManagementReport extends ManagementReport {
  @override
  final String? id;
  @override
  final BuiltList<Document>? documents;
  @override
  final Residential? residential;
  @override
  final String? from;
  @override
  final String? name;

  factory _$ManagementReport(
          [void Function(ManagementReportBuilder)? updates]) =>
      (new ManagementReportBuilder()..update(updates))._build();

  _$ManagementReport._(
      {this.id, this.documents, this.residential, this.from, this.name})
      : super._();

  @override
  ManagementReport rebuild(void Function(ManagementReportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManagementReportBuilder toBuilder() =>
      new ManagementReportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ManagementReport &&
        id == other.id &&
        documents == other.documents &&
        residential == other.residential &&
        from == other.from &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), documents.hashCode),
                residential.hashCode),
            from.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ManagementReport')
          ..add('id', id)
          ..add('documents', documents)
          ..add('residential', residential)
          ..add('from', from)
          ..add('name', name))
        .toString();
  }
}

class ManagementReportBuilder
    implements Builder<ManagementReport, ManagementReportBuilder> {
  _$ManagementReport? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<Document>? _documents;
  ListBuilder<Document> get documents =>
      _$this._documents ??= new ListBuilder<Document>();
  set documents(ListBuilder<Document>? documents) =>
      _$this._documents = documents;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _from;
  String? get from => _$this._from;
  set from(String? from) => _$this._from = from;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ManagementReportBuilder();

  ManagementReportBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _documents = $v.documents?.toBuilder();
      _residential = $v.residential?.toBuilder();
      _from = $v.from;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ManagementReport other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ManagementReport;
  }

  @override
  void update(void Function(ManagementReportBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ManagementReport build() => _build();

  _$ManagementReport _build() {
    _$ManagementReport _$result;
    try {
      _$result = _$v ??
          new _$ManagementReport._(
              id: id,
              documents: _documents?.build(),
              residential: _residential?.build(),
              from: from,
              name: name);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'documents';
        _documents?.build();
        _$failedField = 'residential';
        _residential?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ManagementReport', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
