// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartmentUser.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApartmentUser> _$apartmentUserSerializer =
    new _$ApartmentUserSerializer();

class _$ApartmentUserSerializer implements StructuredSerializer<ApartmentUser> {
  @override
  final Iterable<Type> types = const [ApartmentUser, _$ApartmentUser];
  @override
  final String wireName = 'ApartmentUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApartmentUser object,
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
    value = object.tower;
    if (value != null) {
      result
        ..add('tower')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Tower)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.area;
    if (value != null) {
      result
        ..add('area')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.deposit;
    if (value != null) {
      result
        ..add('deposit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.realEstateRegistration;
    if (value != null) {
      result
        ..add('realEstateRegistration')
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
    value = object.parkings;
    if (value != null) {
      result
        ..add('parkings')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(List, const [const FullType(Parking)])));
    }
    return result;
  }

  @override
  ApartmentUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApartmentUserBuilder();

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
        case 'tower':
          result.tower.replace(serializers.deserialize(value,
              specifiedType: const FullType(Tower))! as Tower);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'deposit':
          result.deposit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'realEstateRegistration':
          result.realEstateRegistration = serializers.deserialize(value,
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
        case 'parkings':
          result.parkings = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Parking)]))
              as List<Parking>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ApartmentUser extends ApartmentUser {
  @override
  final String? id;
  @override
  final Tower? tower;
  @override
  final String? name;
  @override
  final int? area;
  @override
  final String? deposit;
  @override
  final String? realEstateRegistration;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final List<Parking>? parkings;

  factory _$ApartmentUser([void Function(ApartmentUserBuilder)? updates]) =>
      (new ApartmentUserBuilder()..update(updates))._build();

  _$ApartmentUser._(
      {this.id,
      this.tower,
      this.name,
      this.area,
      this.deposit,
      this.realEstateRegistration,
      this.createdAt,
      this.updatedAt,
      this.parkings})
      : super._();

  @override
  ApartmentUser rebuild(void Function(ApartmentUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApartmentUserBuilder toBuilder() => new ApartmentUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApartmentUser &&
        id == other.id &&
        tower == other.tower &&
        name == other.name &&
        area == other.area &&
        deposit == other.deposit &&
        realEstateRegistration == other.realEstateRegistration &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        parkings == other.parkings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), tower.hashCode),
                                name.hashCode),
                            area.hashCode),
                        deposit.hashCode),
                    realEstateRegistration.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        parkings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApartmentUser')
          ..add('id', id)
          ..add('tower', tower)
          ..add('name', name)
          ..add('area', area)
          ..add('deposit', deposit)
          ..add('realEstateRegistration', realEstateRegistration)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('parkings', parkings))
        .toString();
  }
}

class ApartmentUserBuilder
    implements Builder<ApartmentUser, ApartmentUserBuilder> {
  _$ApartmentUser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  TowerBuilder? _tower;
  TowerBuilder get tower => _$this._tower ??= new TowerBuilder();
  set tower(TowerBuilder? tower) => _$this._tower = tower;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _area;
  int? get area => _$this._area;
  set area(int? area) => _$this._area = area;

  String? _deposit;
  String? get deposit => _$this._deposit;
  set deposit(String? deposit) => _$this._deposit = deposit;

  String? _realEstateRegistration;
  String? get realEstateRegistration => _$this._realEstateRegistration;
  set realEstateRegistration(String? realEstateRegistration) =>
      _$this._realEstateRegistration = realEstateRegistration;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  List<Parking>? _parkings;
  List<Parking>? get parkings => _$this._parkings;
  set parkings(List<Parking>? parkings) => _$this._parkings = parkings;

  ApartmentUserBuilder();

  ApartmentUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _tower = $v.tower?.toBuilder();
      _name = $v.name;
      _area = $v.area;
      _deposit = $v.deposit;
      _realEstateRegistration = $v.realEstateRegistration;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _parkings = $v.parkings;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApartmentUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApartmentUser;
  }

  @override
  void update(void Function(ApartmentUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApartmentUser build() => _build();

  _$ApartmentUser _build() {
    _$ApartmentUser _$result;
    try {
      _$result = _$v ??
          new _$ApartmentUser._(
              id: id,
              tower: _tower?.build(),
              name: name,
              area: area,
              deposit: deposit,
              realEstateRegistration: realEstateRegistration,
              createdAt: createdAt,
              updatedAt: updatedAt,
              parkings: parkings);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tower';
        _tower?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApartmentUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
