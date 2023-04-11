// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tower.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Tower> _$towerSerializer = new _$TowerSerializer();

class _$TowerSerializer implements StructuredSerializer<Tower> {
  @override
  final Iterable<Type> types = const [Tower, _$Tower];
  @override
  final String wireName = 'Tower';

  @override
  Iterable<Object?> serialize(Serializers serializers, Tower object,
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
  Tower deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TowerBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Tower extends Tower {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final String? name;

  factory _$Tower([void Function(TowerBuilder)? updates]) =>
      (new TowerBuilder()..update(updates))._build();

  _$Tower._({this.id, this.residential, this.name}) : super._();

  @override
  Tower rebuild(void Function(TowerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TowerBuilder toBuilder() => new TowerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tower &&
        id == other.id &&
        residential == other.residential &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), residential.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Tower')
          ..add('id', id)
          ..add('residential', residential)
          ..add('name', name))
        .toString();
  }
}

class TowerBuilder implements Builder<Tower, TowerBuilder> {
  _$Tower? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  TowerBuilder();

  TowerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tower other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Tower;
  }

  @override
  void update(void Function(TowerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Tower build() => _build();

  _$Tower _build() {
    _$Tower _$result;
    try {
      _$result = _$v ??
          new _$Tower._(id: id, residential: _residential?.build(), name: name);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Tower', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
