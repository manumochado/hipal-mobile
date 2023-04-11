// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Profile> _$profileSerializer = new _$ProfileSerializer();

class _$ProfileSerializer implements StructuredSerializer<Profile> {
  @override
  final Iterable<Type> types = const [Profile, _$Profile];
  @override
  final String wireName = 'Profile';

  @override
  Iterable<Object?> serialize(Serializers serializers, Profile object,
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
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fullname;
    if (value != null) {
      result
        ..add('fullname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.profiles;
    if (value != null) {
      result
        ..add('profiles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ProfileDetail)));
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
  Profile deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileBuilder();

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
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullname':
          result.fullname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'profiles':
          result.profiles.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfileDetail))! as ProfileDetail);
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

class _$Profile extends Profile {
  @override
  final ProfileUser? id;
  @override
  final String? order;
  @override
  final String? fullname;
  @override
  final User? user;
  @override
  final ProfileDetail? profiles;
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

  factory _$Profile([void Function(ProfileBuilder)? updates]) =>
      (new ProfileBuilder()..update(updates))._build();

  _$Profile._(
      {this.id,
      this.order,
      this.fullname,
      this.user,
      this.profiles,
      this.createdAt,
      this.updatedAt,
      this.roles,
      this.rolesDetail,
      this.apartments,
      this.apartmentsDetail,
      this.v})
      : super._();

  @override
  Profile rebuild(void Function(ProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileBuilder toBuilder() => new ProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
        id == other.id &&
        order == other.order &&
        fullname == other.fullname &&
        user == other.user &&
        profiles == other.profiles &&
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
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                order.hashCode),
                                            fullname.hashCode),
                                        user.hashCode),
                                    profiles.hashCode),
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
    return (newBuiltValueToStringHelper(r'Profile')
          ..add('id', id)
          ..add('order', order)
          ..add('fullname', fullname)
          ..add('user', user)
          ..add('profiles', profiles)
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

class ProfileBuilder implements Builder<Profile, ProfileBuilder> {
  _$Profile? _$v;

  ProfileUserBuilder? _id;
  ProfileUserBuilder get id => _$this._id ??= new ProfileUserBuilder();
  set id(ProfileUserBuilder? id) => _$this._id = id;

  String? _order;
  String? get order => _$this._order;
  set order(String? order) => _$this._order = order;

  String? _fullname;
  String? get fullname => _$this._fullname;
  set fullname(String? fullname) => _$this._fullname = fullname;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  ProfileDetailBuilder? _profiles;
  ProfileDetailBuilder get profiles =>
      _$this._profiles ??= new ProfileDetailBuilder();
  set profiles(ProfileDetailBuilder? profiles) => _$this._profiles = profiles;

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

  ProfileBuilder();

  ProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id?.toBuilder();
      _order = $v.order;
      _fullname = $v.fullname;
      _user = $v.user?.toBuilder();
      _profiles = $v.profiles?.toBuilder();
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
  void replace(Profile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Profile;
  }

  @override
  void update(void Function(ProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Profile build() => _build();

  _$Profile _build() {
    _$Profile _$result;
    try {
      _$result = _$v ??
          new _$Profile._(
              id: _id?.build(),
              order: order,
              fullname: fullname,
              user: _user?.build(),
              profiles: _profiles?.build(),
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

        _$failedField = 'user';
        _user?.build();
        _$failedField = 'profiles';
        _profiles?.build();

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
            r'Profile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
