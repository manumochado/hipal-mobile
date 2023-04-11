// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileuser.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileUser> _$profileUserSerializer = new _$ProfileUserSerializer();

class _$ProfileUserSerializer implements StructuredSerializer<ProfileUser> {
  @override
  final Iterable<Type> types = const [ProfileUser, _$ProfileUser];
  @override
  final String wireName = 'ProfileUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProfileUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'residential':
          result.residential = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileUser extends ProfileUser {
  @override
  final String? user;
  @override
  final String? residential;

  factory _$ProfileUser([void Function(ProfileUserBuilder)? updates]) =>
      (new ProfileUserBuilder()..update(updates))._build();

  _$ProfileUser._({this.user, this.residential}) : super._();

  @override
  ProfileUser rebuild(void Function(ProfileUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileUserBuilder toBuilder() => new ProfileUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileUser &&
        user == other.user &&
        residential == other.residential;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), residential.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileUser')
          ..add('user', user)
          ..add('residential', residential))
        .toString();
  }
}

class ProfileUserBuilder implements Builder<ProfileUser, ProfileUserBuilder> {
  _$ProfileUser? _$v;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  String? _residential;
  String? get residential => _$this._residential;
  set residential(String? residential) => _$this._residential = residential;

  ProfileUserBuilder();

  ProfileUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _residential = $v.residential;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileUser;
  }

  @override
  void update(void Function(ProfileUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileUser build() => _build();

  _$ProfileUser _build() {
    final _$result =
        _$v ?? new _$ProfileUser._(user: user, residential: residential);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
