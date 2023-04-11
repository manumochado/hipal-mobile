// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Phone)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastname;
    if (value != null) {
      result
        ..add('lastname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstname;
    if (value != null) {
      result
        ..add('firstname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.identity;
    if (value != null) {
      result
        ..add('identity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birthDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Photo)));
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
    value = object.socialNetworks;
    if (value != null) {
      result
        ..add('socialNetworks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.is_enabled_chats;
    if (value != null) {
      result
        ..add('is_enabled_chats')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.v;
    if (value != null) {
      result
        ..add('v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone.replace(serializers.deserialize(value,
              specifiedType: const FullType(Phone))! as Phone);
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastname':
          result.lastname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'identity':
          result.identity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'photo':
          result.photo.replace(serializers.deserialize(value,
              specifiedType: const FullType(Photo))! as Photo);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'socialNetworks':
          result.socialNetworks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_enabled_chats':
          result.is_enabled_chats = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String? id;
  @override
  final String? email;
  @override
  final Phone? phone;
  @override
  final String? gender;
  @override
  final String? lastname;
  @override
  final String? firstname;
  @override
  final String? identity;
  @override
  final DateTime? birthDate;
  @override
  final Photo? photo;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final BuiltList<String>? socialNetworks;
  @override
  final bool? is_enabled_chats;
  @override
  final int? v;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.id,
      this.email,
      this.phone,
      this.gender,
      this.lastname,
      this.firstname,
      this.identity,
      this.birthDate,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.socialNetworks,
      this.is_enabled_chats,
      this.v})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        email == other.email &&
        phone == other.phone &&
        gender == other.gender &&
        lastname == other.lastname &&
        firstname == other.firstname &&
        identity == other.identity &&
        birthDate == other.birthDate &&
        photo == other.photo &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        socialNetworks == other.socialNetworks &&
        is_enabled_chats == other.is_enabled_chats &&
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
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, id.hashCode),
                                                        email.hashCode),
                                                    phone.hashCode),
                                                gender.hashCode),
                                            lastname.hashCode),
                                        firstname.hashCode),
                                    identity.hashCode),
                                birthDate.hashCode),
                            photo.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                socialNetworks.hashCode),
            is_enabled_chats.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('email', email)
          ..add('phone', phone)
          ..add('gender', gender)
          ..add('lastname', lastname)
          ..add('firstname', firstname)
          ..add('identity', identity)
          ..add('birthDate', birthDate)
          ..add('photo', photo)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('socialNetworks', socialNetworks)
          ..add('is_enabled_chats', is_enabled_chats)
          ..add('v', v))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  PhoneBuilder? _phone;
  PhoneBuilder get phone => _$this._phone ??= new PhoneBuilder();
  set phone(PhoneBuilder? phone) => _$this._phone = phone;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _lastname;
  String? get lastname => _$this._lastname;
  set lastname(String? lastname) => _$this._lastname = lastname;

  String? _firstname;
  String? get firstname => _$this._firstname;
  set firstname(String? firstname) => _$this._firstname = firstname;

  String? _identity;
  String? get identity => _$this._identity;
  set identity(String? identity) => _$this._identity = identity;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  PhotoBuilder? _photo;
  PhotoBuilder get photo => _$this._photo ??= new PhotoBuilder();
  set photo(PhotoBuilder? photo) => _$this._photo = photo;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<String>? _socialNetworks;
  ListBuilder<String> get socialNetworks =>
      _$this._socialNetworks ??= new ListBuilder<String>();
  set socialNetworks(ListBuilder<String>? socialNetworks) =>
      _$this._socialNetworks = socialNetworks;

  bool? _is_enabled_chats;
  bool? get is_enabled_chats => _$this._is_enabled_chats;
  set is_enabled_chats(bool? is_enabled_chats) =>
      _$this._is_enabled_chats = is_enabled_chats;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _phone = $v.phone?.toBuilder();
      _gender = $v.gender;
      _lastname = $v.lastname;
      _firstname = $v.firstname;
      _identity = $v.identity;
      _birthDate = $v.birthDate;
      _photo = $v.photo?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _socialNetworks = $v.socialNetworks?.toBuilder();
      _is_enabled_chats = $v.is_enabled_chats;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: id,
              email: email,
              phone: _phone?.build(),
              gender: gender,
              lastname: lastname,
              firstname: firstname,
              identity: identity,
              birthDate: birthDate,
              photo: _photo?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              socialNetworks: _socialNetworks?.build(),
              is_enabled_chats: is_enabled_chats,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'phone';
        _phone?.build();

        _$failedField = 'photo';
        _photo?.build();

        _$failedField = 'socialNetworks';
        _socialNetworks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
