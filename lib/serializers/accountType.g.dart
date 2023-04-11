// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountType.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountType> _$accountTypeSerializer = new _$AccountTypeSerializer();

class _$AccountTypeSerializer implements StructuredSerializer<AccountType> {
  @override
  final Iterable<Type> types = const [AccountType, _$AccountType];
  @override
  final String wireName = 'AccountType';

  @override
  Iterable<Object?> serialize(Serializers serializers, AccountType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
  AccountType deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
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

class _$AccountType extends AccountType {
  @override
  final String? id;
  @override
  final String? name;

  factory _$AccountType([void Function(AccountTypeBuilder)? updates]) =>
      (new AccountTypeBuilder()..update(updates))._build();

  _$AccountType._({this.id, this.name}) : super._();

  @override
  AccountType rebuild(void Function(AccountTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountTypeBuilder toBuilder() => new AccountTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountType && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountType')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class AccountTypeBuilder implements Builder<AccountType, AccountTypeBuilder> {
  _$AccountType? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AccountTypeBuilder();

  AccountTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountType;
  }

  @override
  void update(void Function(AccountTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountType build() => _build();

  _$AccountType _build() {
    final _$result = _$v ?? new _$AccountType._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
