// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileAuth.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileAuth> _$profileAuthSerializer = new _$ProfileAuthSerializer();

class _$ProfileAuthSerializer implements StructuredSerializer<ProfileAuth> {
  @override
  final Iterable<Type> types = const [ProfileAuth, _$ProfileAuth];
  @override
  final String wireName = 'ProfileAuth';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileAuth object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ProfileUser)));
    }
    value = object.apartment;
    if (value != null) {
      result
        ..add('apartment')
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
    value = object.roles;
    if (value != null) {
      result
        ..add('roles')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.rolesDetail;
    if (value != null) {
      result
        ..add('rolesDetail')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Rol)])));
    }
    value = object.apartments;
    if (value != null) {
      result
        ..add('apartments')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.apartmentsDetail;
    if (value != null) {
      result
        ..add('apartmentsDetail')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Apartment)])));
    }
    value = object.v;
    if (value != null) {
      result
        ..add('__v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ProfileAuth deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileAuthBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '_id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfileUser))! as ProfileUser);
          break;
        case 'apartment':
          result.apartment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'roles':
          result.roles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'rolesDetail':
          result.rolesDetail.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Rol)]))!
              as BuiltList<Object?>);
          break;
        case 'apartments':
          result.apartments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'apartmentsDetail':
          result.apartmentsDetail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Apartment)]))!
              as BuiltList<Object?>);
          break;
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileAuth extends ProfileAuth {
  @override
  final ProfileUser? id;
  @override
  final String? apartment;
  @override
  final Residential? residential;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<String>? roles;
  @override
  final BuiltList<Rol>? rolesDetail;
  @override
  final BuiltList<String>? apartments;
  @override
  final BuiltList<Apartment>? apartmentsDetail;
  @override
  final int? v;

  factory _$ProfileAuth([void Function(ProfileAuthBuilder)? updates]) =>
      (new ProfileAuthBuilder()..update(updates))._build();

  _$ProfileAuth._(
      {this.id,
      this.apartment,
      this.residential,
      this.createdAt,
      this.updatedAt,
      this.roles,
      this.rolesDetail,
      this.apartments,
      this.apartmentsDetail,
      this.v})
      : super._();

  @override
  ProfileAuth rebuild(void Function(ProfileAuthBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileAuthBuilder toBuilder() => new ProfileAuthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileAuth &&
        id == other.id &&
        apartment == other.apartment &&
        residential == other.residential &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        roles == other.roles &&
        rolesDetail == other.rolesDetail &&
        apartments == other.apartments &&
        apartmentsDetail == other.apartmentsDetail &&
        v == other.v;
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
                                    $jc($jc(0, id.hashCode),
                                        apartment.hashCode),
                                    residential.hashCode),
                                createdAt.hashCode),
                            updatedAt.hashCode),
                        roles.hashCode),
                    rolesDetail.hashCode),
                apartments.hashCode),
            apartmentsDetail.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileAuth')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('residential', residential)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('roles', roles)
          ..add('rolesDetail', rolesDetail)
          ..add('apartments', apartments)
          ..add('apartmentsDetail', apartmentsDetail)
          ..add('v', v))
        .toString();
  }
}

class ProfileAuthBuilder implements Builder<ProfileAuth, ProfileAuthBuilder> {
  _$ProfileAuth? _$v;

  ProfileUserBuilder? _id;
  ProfileUserBuilder get id => _$this._id ??= new ProfileUserBuilder();
  set id(ProfileUserBuilder? id) => _$this._id = id;

  String? _apartment;
  String? get apartment => _$this._apartment;
  set apartment(String? apartment) => _$this._apartment = apartment;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= new ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  ListBuilder<Rol>? _rolesDetail;
  ListBuilder<Rol> get rolesDetail =>
      _$this._rolesDetail ??= new ListBuilder<Rol>();
  set rolesDetail(ListBuilder<Rol>? rolesDetail) =>
      _$this._rolesDetail = rolesDetail;

  ListBuilder<String>? _apartments;
  ListBuilder<String> get apartments =>
      _$this._apartments ??= new ListBuilder<String>();
  set apartments(ListBuilder<String>? apartments) =>
      _$this._apartments = apartments;

  ListBuilder<Apartment>? _apartmentsDetail;
  ListBuilder<Apartment> get apartmentsDetail =>
      _$this._apartmentsDetail ??= new ListBuilder<Apartment>();
  set apartmentsDetail(ListBuilder<Apartment>? apartmentsDetail) =>
      _$this._apartmentsDetail = apartmentsDetail;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  ProfileAuthBuilder();

  ProfileAuthBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id?.toBuilder();
      _apartment = $v.apartment;
      _residential = $v.residential?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _roles = $v.roles?.toBuilder();
      _rolesDetail = $v.rolesDetail?.toBuilder();
      _apartments = $v.apartments?.toBuilder();
      _apartmentsDetail = $v.apartmentsDetail?.toBuilder();
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileAuth other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileAuth;
  }

  @override
  void update(void Function(ProfileAuthBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileAuth build() => _build();

  _$ProfileAuth _build() {
    _$ProfileAuth _$result;
    try {
      _$result = _$v ??
          new _$ProfileAuth._(
              id: _id?.build(),
              apartment: apartment,
              residential: _residential?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              roles: _roles?.build(),
              rolesDetail: _rolesDetail?.build(),
              apartments: _apartments?.build(),
              apartmentsDetail: _apartmentsDetail?.build(),
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        _id?.build();

        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'roles';
        _roles?.build();
        _$failedField = 'rolesDetail';
        _rolesDetail?.build();
        _$failedField = 'apartments';
        _apartments?.build();
        _$failedField = 'apartmentsDetail';
        _apartmentsDetail?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfileAuth', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
