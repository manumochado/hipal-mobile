// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Bank> _$bankSerializer = new _$BankSerializer();

class _$BankSerializer implements StructuredSerializer<Bank> {
  @override
  final Iterable<Type> types = const [Bank, _$Bank];
  @override
  final String wireName = 'Bank';

  @override
  Iterable<Object?> serialize(Serializers serializers, Bank object,
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
  Bank deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BankBuilder();

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

class _$Bank extends Bank {
  @override
  final String? id;
  @override
  final String? name;

  factory _$Bank([void Function(BankBuilder)? updates]) =>
      (new BankBuilder()..update(updates))._build();

  _$Bank._({this.id, this.name}) : super._();

  @override
  Bank rebuild(void Function(BankBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankBuilder toBuilder() => new BankBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bank && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Bank')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class BankBuilder implements Builder<Bank, BankBuilder> {
  _$Bank? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  BankBuilder();

  BankBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Bank other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Bank;
  }

  @override
  void update(void Function(BankBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Bank build() => _build();

  _$Bank _build() {
    final _$result = _$v ?? new _$Bank._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
