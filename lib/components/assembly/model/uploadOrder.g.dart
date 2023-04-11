// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploadOrder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UploadOrder> _$uploadOrderSerializer = new _$UploadOrderSerializer();

class _$UploadOrderSerializer implements StructuredSerializer<UploadOrder> {
  @override
  final Iterable<Type> types = const [UploadOrder, _$UploadOrder];
  @override
  final String wireName = 'UploadOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, UploadOrder object,
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
    value = object.key;
    if (value != null) {
      result
        ..add('key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
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
  UploadOrder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UploadOrderBuilder();

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
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
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

class _$UploadOrder extends UploadOrder {
  @override
  final String? id;
  @override
  final String? key;
  @override
  final String? url;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$UploadOrder([void Function(UploadOrderBuilder)? updates]) =>
      (new UploadOrderBuilder()..update(updates))._build();

  _$UploadOrder._({this.id, this.key, this.url, this.createdAt, this.updatedAt})
      : super._();

  @override
  UploadOrder rebuild(void Function(UploadOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadOrderBuilder toBuilder() => new UploadOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadOrder &&
        id == other.id &&
        key == other.key &&
        url == other.url &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), key.hashCode), url.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadOrder')
          ..add('id', id)
          ..add('key', key)
          ..add('url', url)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class UploadOrderBuilder implements Builder<UploadOrder, UploadOrderBuilder> {
  _$UploadOrder? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  UploadOrderBuilder();

  UploadOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _url = $v.url;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadOrder;
  }

  @override
  void update(void Function(UploadOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadOrder build() => _build();

  _$UploadOrder _build() {
    final _$result = _$v ??
        new _$UploadOrder._(
            id: id,
            key: key,
            url: url,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
