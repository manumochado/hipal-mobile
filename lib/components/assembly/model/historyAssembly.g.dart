// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historyAssembly.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HistoryAssembly> _$historyAssemblySerializer =
    new _$HistoryAssemblySerializer();

class _$HistoryAssemblySerializer
    implements StructuredSerializer<HistoryAssembly> {
  @override
  final Iterable<Type> types = const [HistoryAssembly, _$HistoryAssembly];
  @override
  final String wireName = 'HistoryAssembly';

  @override
  Iterable<Object?> serialize(Serializers serializers, HistoryAssembly object,
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
    value = object.linkMeeting;
    if (value != null) {
      result
        ..add('linkMeeting')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hour;
    if (value != null) {
      result
        ..add('hour')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('startDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uploadOrder;
    if (value != null) {
      result
        ..add('uploadOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(UploadOrder)])));
    }
    value = object.descriptionAnnouncement;
    if (value != null) {
      result
        ..add('descriptionAnnouncement')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameAnnouncement;
    if (value != null) {
      result
        ..add('nameAnnouncement')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameAssembly;
    if (value != null) {
      result
        ..add('nameAssembly')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  HistoryAssembly deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryAssemblyBuilder();

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
        case 'linkMeeting':
          result.linkMeeting = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hour':
          result.hour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'uploadOrder':
          result.uploadOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UploadOrder)]))!
              as BuiltList<Object?>);
          break;
        case 'descriptionAnnouncement':
          result.descriptionAnnouncement = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameAnnouncement':
          result.nameAnnouncement = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameAssembly':
          result.nameAssembly = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$HistoryAssembly extends HistoryAssembly {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final String? linkMeeting;
  @override
  final String? hour;
  @override
  final DateTime? startDate;
  @override
  final BuiltList<UploadOrder>? uploadOrder;
  @override
  final String? descriptionAnnouncement;
  @override
  final String? nameAnnouncement;
  @override
  final String? nameAssembly;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$HistoryAssembly([void Function(HistoryAssemblyBuilder)? updates]) =>
      (new HistoryAssemblyBuilder()..update(updates))._build();

  _$HistoryAssembly._(
      {this.id,
      this.residential,
      this.linkMeeting,
      this.hour,
      this.startDate,
      this.uploadOrder,
      this.descriptionAnnouncement,
      this.nameAnnouncement,
      this.nameAssembly,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  HistoryAssembly rebuild(void Function(HistoryAssemblyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryAssemblyBuilder toBuilder() =>
      new HistoryAssemblyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryAssembly &&
        id == other.id &&
        residential == other.residential &&
        linkMeeting == other.linkMeeting &&
        hour == other.hour &&
        startDate == other.startDate &&
        uploadOrder == other.uploadOrder &&
        descriptionAnnouncement == other.descriptionAnnouncement &&
        nameAnnouncement == other.nameAnnouncement &&
        nameAssembly == other.nameAssembly &&
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
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, id.hashCode),
                                            residential.hashCode),
                                        linkMeeting.hashCode),
                                    hour.hashCode),
                                startDate.hashCode),
                            uploadOrder.hashCode),
                        descriptionAnnouncement.hashCode),
                    nameAnnouncement.hashCode),
                nameAssembly.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HistoryAssembly')
          ..add('id', id)
          ..add('residential', residential)
          ..add('linkMeeting', linkMeeting)
          ..add('hour', hour)
          ..add('startDate', startDate)
          ..add('uploadOrder', uploadOrder)
          ..add('descriptionAnnouncement', descriptionAnnouncement)
          ..add('nameAnnouncement', nameAnnouncement)
          ..add('nameAssembly', nameAssembly)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class HistoryAssemblyBuilder
    implements Builder<HistoryAssembly, HistoryAssemblyBuilder> {
  _$HistoryAssembly? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _linkMeeting;
  String? get linkMeeting => _$this._linkMeeting;
  set linkMeeting(String? linkMeeting) => _$this._linkMeeting = linkMeeting;

  String? _hour;
  String? get hour => _$this._hour;
  set hour(String? hour) => _$this._hour = hour;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  ListBuilder<UploadOrder>? _uploadOrder;
  ListBuilder<UploadOrder> get uploadOrder =>
      _$this._uploadOrder ??= new ListBuilder<UploadOrder>();
  set uploadOrder(ListBuilder<UploadOrder>? uploadOrder) =>
      _$this._uploadOrder = uploadOrder;

  String? _descriptionAnnouncement;
  String? get descriptionAnnouncement => _$this._descriptionAnnouncement;
  set descriptionAnnouncement(String? descriptionAnnouncement) =>
      _$this._descriptionAnnouncement = descriptionAnnouncement;

  String? _nameAnnouncement;
  String? get nameAnnouncement => _$this._nameAnnouncement;
  set nameAnnouncement(String? nameAnnouncement) =>
      _$this._nameAnnouncement = nameAnnouncement;

  String? _nameAssembly;
  String? get nameAssembly => _$this._nameAssembly;
  set nameAssembly(String? nameAssembly) => _$this._nameAssembly = nameAssembly;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  HistoryAssemblyBuilder();

  HistoryAssemblyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _linkMeeting = $v.linkMeeting;
      _hour = $v.hour;
      _startDate = $v.startDate;
      _uploadOrder = $v.uploadOrder?.toBuilder();
      _descriptionAnnouncement = $v.descriptionAnnouncement;
      _nameAnnouncement = $v.nameAnnouncement;
      _nameAssembly = $v.nameAssembly;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryAssembly other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HistoryAssembly;
  }

  @override
  void update(void Function(HistoryAssemblyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HistoryAssembly build() => _build();

  _$HistoryAssembly _build() {
    _$HistoryAssembly _$result;
    try {
      _$result = _$v ??
          new _$HistoryAssembly._(
              id: id,
              residential: _residential?.build(),
              linkMeeting: linkMeeting,
              hour: hour,
              startDate: startDate,
              uploadOrder: _uploadOrder?.build(),
              descriptionAnnouncement: descriptionAnnouncement,
              nameAnnouncement: nameAnnouncement,
              nameAssembly: nameAssembly,
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'uploadOrder';
        _uploadOrder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HistoryAssembly', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
