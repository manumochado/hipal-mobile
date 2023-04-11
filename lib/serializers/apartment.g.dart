// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Apartment> _$apartmentSerializer = new _$ApartmentSerializer();

class _$ApartmentSerializer implements StructuredSerializer<Apartment> {
  @override
  final Iterable<Type> types = const [Apartment, _$Apartment];
  @override
  final String wireName = 'Apartment';

  @override
  Iterable<Object?> serialize(Serializers serializers, Apartment object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tower;
    if (value != null) {
      result
        ..add('tower')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Tower)));
    }
    return result;
  }

  @override
  Apartment deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApartmentBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tower':
          result.tower.replace(serializers.deserialize(value,
              specifiedType: const FullType(Tower))! as Tower);
          break;
      }
    }

    return result.build();
  }
}

class _$Apartment extends Apartment {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final Tower? tower;

  factory _$Apartment([void Function(ApartmentBuilder)? updates]) =>
      (new ApartmentBuilder()..update(updates))._build();

  _$Apartment._({this.id, this.name, this.tower}) : super._();

  @override
  Apartment rebuild(void Function(ApartmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApartmentBuilder toBuilder() => new ApartmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Apartment &&
        id == other.id &&
        name == other.name &&
        tower == other.tower;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), tower.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Apartment')
          ..add('id', id)
          ..add('name', name)
          ..add('tower', tower))
        .toString();
  }
}

class ApartmentBuilder implements Builder<Apartment, ApartmentBuilder> {
  _$Apartment? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  TowerBuilder? _tower;
  TowerBuilder get tower => _$this._tower ??= new TowerBuilder();
  set tower(TowerBuilder? tower) => _$this._tower = tower;

  ApartmentBuilder();

  ApartmentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _tower = $v.tower?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Apartment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Apartment;
  }

  @override
  void update(void Function(ApartmentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Apartment build() => _build();

  _$Apartment _build() {
    _$Apartment _$result;
    try {
      _$result =
          _$v ?? new _$Apartment._(id: id, name: name, tower: _tower?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tower';
        _tower?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Apartment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
