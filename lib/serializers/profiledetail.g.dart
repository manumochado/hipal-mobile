// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiledetail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileDetail> _$profileDetailSerializer =
    new _$ProfileDetailSerializer();

class _$ProfileDetailSerializer implements StructuredSerializer<ProfileDetail> {
  @override
  final Iterable<Type> types = const [ProfileDetail, _$ProfileDetail];
  @override
  final String wireName = 'ProfileDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileDetail object,
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
    value = object.apartment;
    if (value != null) {
      result
        ..add('apartment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rol;
    if (value != null) {
      result
        ..add('rol')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
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
    value = object.v;
    if (value != null) {
      result
        ..add('__v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ProfileDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileDetailBuilder();

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
        case 'apartment':
          result.apartment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rol':
          result.rol.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'residential':
          result.residential = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
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
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileDetail extends ProfileDetail {
  @override
  final String? id;
  @override
  final String? apartment;
  @override
  final BuiltList<String>? rol;
  @override
  final String? residential;
  @override
  final String? user;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;

  factory _$ProfileDetail([void Function(ProfileDetailBuilder)? updates]) =>
      (new ProfileDetailBuilder()..update(updates))._build();

  _$ProfileDetail._(
      {this.id,
      this.apartment,
      this.rol,
      this.residential,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  ProfileDetail rebuild(void Function(ProfileDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDetailBuilder toBuilder() => new ProfileDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileDetail &&
        id == other.id &&
        apartment == other.apartment &&
        rol == other.rol &&
        residential == other.residential &&
        user == other.user &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), apartment.hashCode),
                            rol.hashCode),
                        residential.hashCode),
                    user.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileDetail')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('rol', rol)
          ..add('residential', residential)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class ProfileDetailBuilder
    implements Builder<ProfileDetail, ProfileDetailBuilder> {
  _$ProfileDetail? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _apartment;
  String? get apartment => _$this._apartment;
  set apartment(String? apartment) => _$this._apartment = apartment;

  ListBuilder<String>? _rol;
  ListBuilder<String> get rol => _$this._rol ??= new ListBuilder<String>();
  set rol(ListBuilder<String>? rol) => _$this._rol = rol;

  String? _residential;
  String? get residential => _$this._residential;
  set residential(String? residential) => _$this._residential = residential;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  ProfileDetailBuilder();

  ProfileDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment;
      _rol = $v.rol?.toBuilder();
      _residential = $v.residential;
      _user = $v.user;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileDetail;
  }

  @override
  void update(void Function(ProfileDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileDetail build() => _build();

  _$ProfileDetail _build() {
    _$ProfileDetail _$result;
    try {
      _$result = _$v ??
          new _$ProfileDetail._(
              id: id,
              apartment: apartment,
              rol: _rol?.build(),
              residential: residential,
              user: user,
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rol';
        _rol?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfileDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
