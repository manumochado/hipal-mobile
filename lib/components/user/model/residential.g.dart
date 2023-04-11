// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residential.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Residential> _$residentialSerializer = new _$ResidentialSerializer();

class _$ResidentialSerializer implements StructuredSerializer<Residential> {
  @override
  final Iterable<Type> types = const [Residential, _$Residential];
  @override
  final String wireName = 'Residential';

  @override
  Iterable<Object?> serialize(Serializers serializers, Residential object,
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
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(City)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plan;
    if (value != null) {
      result
        ..add('plan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Residential deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResidentialBuilder();

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
        case 'city':
          result.city.replace(serializers.deserialize(value,
              specifiedType: const FullType(City))! as City);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plan':
          result.plan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Residential extends Residential {
  @override
  final String? id;
  @override
  final City? city;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? plan;

  factory _$Residential([void Function(ResidentialBuilder)? updates]) =>
      (new ResidentialBuilder()..update(updates))._build();

  _$Residential._({this.id, this.city, this.name, this.address, this.plan})
      : super._();

  @override
  Residential rebuild(void Function(ResidentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResidentialBuilder toBuilder() => new ResidentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Residential &&
        id == other.id &&
        city == other.city &&
        name == other.name &&
        address == other.address &&
        plan == other.plan;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), city.hashCode), name.hashCode),
            address.hashCode),
        plan.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Residential')
          ..add('id', id)
          ..add('city', city)
          ..add('name', name)
          ..add('address', address)
          ..add('plan', plan))
        .toString();
  }
}

class ResidentialBuilder implements Builder<Residential, ResidentialBuilder> {
  _$Residential? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CityBuilder? _city;
  CityBuilder get city => _$this._city ??= new CityBuilder();
  set city(CityBuilder? city) => _$this._city = city;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _plan;
  String? get plan => _$this._plan;
  set plan(String? plan) => _$this._plan = plan;

  ResidentialBuilder();

  ResidentialBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _city = $v.city?.toBuilder();
      _name = $v.name;
      _address = $v.address;
      _plan = $v.plan;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Residential other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Residential;
  }

  @override
  void update(void Function(ResidentialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Residential build() => _build();

  _$Residential _build() {
    _$Residential _$result;
    try {
      _$result = _$v ??
          new _$Residential._(
              id: id,
              city: _city?.build(),
              name: name,
              address: address,
              plan: plan);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'city';
        _city?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Residential', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
