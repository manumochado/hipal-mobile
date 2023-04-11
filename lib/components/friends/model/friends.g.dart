// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Friends> _$friendsSerializer = new _$FriendsSerializer();

class _$FriendsSerializer implements StructuredSerializer<Friends> {
  @override
  final Iterable<Type> types = const [Friends, _$Friends];
  @override
  final String wireName = 'Friends';

  @override
  Iterable<Object?> serialize(Serializers serializers, Friends object,
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
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.identity;
    if (value != null) {
      result
        ..add('identity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
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
    return result;
  }

  @override
  Friends deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendsBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'identity':
          result.identity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$Friends extends Friends {
  @override
  final String? id;
  @override
  final User? user;
  @override
  final String? identity;
  @override
  final String? lastName;
  @override
  final String? name;

  factory _$Friends([void Function(FriendsBuilder)? updates]) =>
      (new FriendsBuilder()..update(updates))._build();

  _$Friends._({this.id, this.user, this.identity, this.lastName, this.name})
      : super._();

  @override
  Friends rebuild(void Function(FriendsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendsBuilder toBuilder() => new FriendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friends &&
        id == other.id &&
        user == other.user &&
        identity == other.identity &&
        lastName == other.lastName &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), user.hashCode), identity.hashCode),
            lastName.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Friends')
          ..add('id', id)
          ..add('user', user)
          ..add('identity', identity)
          ..add('lastName', lastName)
          ..add('name', name))
        .toString();
  }
}

class FriendsBuilder implements Builder<Friends, FriendsBuilder> {
  _$Friends? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  String? _identity;
  String? get identity => _$this._identity;
  set identity(String? identity) => _$this._identity = identity;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FriendsBuilder();

  FriendsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user = $v.user?.toBuilder();
      _identity = $v.identity;
      _lastName = $v.lastName;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Friends other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Friends;
  }

  @override
  void update(void Function(FriendsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Friends build() => _build();

  _$Friends _build() {
    _$Friends _$result;
    try {
      _$result = _$v ??
          new _$Friends._(
              id: id,
              user: _user?.build(),
              identity: identity,
              lastName: lastName,
              name: name);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Friends', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
