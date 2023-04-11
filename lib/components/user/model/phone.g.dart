// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Phone> _$phoneSerializer = new _$PhoneSerializer();

class _$PhoneSerializer implements StructuredSerializer<Phone> {
  @override
  final Iterable<Type> types = const [Phone, _$Phone];
  @override
  final String wireName = 'Phone';

  @override
  Iterable<Object?> serialize(Serializers serializers, Phone object,
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
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countryCode;
    if (value != null) {
      result
        ..add('countryCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nationalNumber;
    if (value != null) {
      result
        ..add('nationalNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.internationalNumber;
    if (value != null) {
      result
        ..add('internationalNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.e164Number;
    if (value != null) {
      result
        ..add('e164Number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Phone deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhoneBuilder();

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
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nationalNumber':
          result.nationalNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'internationalNumber':
          result.internationalNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'e164Number':
          result.e164Number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Phone extends Phone {
  @override
  final String? id;
  @override
  final String? number;
  @override
  final String? countryCode;
  @override
  final String? nationalNumber;
  @override
  final String? internationalNumber;
  @override
  final String? e164Number;

  factory _$Phone([void Function(PhoneBuilder)? updates]) =>
      (new PhoneBuilder()..update(updates))._build();

  _$Phone._(
      {this.id,
      this.number,
      this.countryCode,
      this.nationalNumber,
      this.internationalNumber,
      this.e164Number})
      : super._();

  @override
  Phone rebuild(void Function(PhoneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneBuilder toBuilder() => new PhoneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Phone &&
        id == other.id &&
        number == other.number &&
        countryCode == other.countryCode &&
        nationalNumber == other.nationalNumber &&
        internationalNumber == other.internationalNumber &&
        e164Number == other.e164Number;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), number.hashCode),
                    countryCode.hashCode),
                nationalNumber.hashCode),
            internationalNumber.hashCode),
        e164Number.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Phone')
          ..add('id', id)
          ..add('number', number)
          ..add('countryCode', countryCode)
          ..add('nationalNumber', nationalNumber)
          ..add('internationalNumber', internationalNumber)
          ..add('e164Number', e164Number))
        .toString();
  }
}

class PhoneBuilder implements Builder<Phone, PhoneBuilder> {
  _$Phone? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _nationalNumber;
  String? get nationalNumber => _$this._nationalNumber;
  set nationalNumber(String? nationalNumber) =>
      _$this._nationalNumber = nationalNumber;

  String? _internationalNumber;
  String? get internationalNumber => _$this._internationalNumber;
  set internationalNumber(String? internationalNumber) =>
      _$this._internationalNumber = internationalNumber;

  String? _e164Number;
  String? get e164Number => _$this._e164Number;
  set e164Number(String? e164Number) => _$this._e164Number = e164Number;

  PhoneBuilder();

  PhoneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _number = $v.number;
      _countryCode = $v.countryCode;
      _nationalNumber = $v.nationalNumber;
      _internationalNumber = $v.internationalNumber;
      _e164Number = $v.e164Number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Phone other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Phone;
  }

  @override
  void update(void Function(PhoneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Phone build() => _build();

  _$Phone _build() {
    final _$result = _$v ??
        new _$Phone._(
            id: id,
            number: number,
            countryCode: countryCode,
            nationalNumber: nationalNumber,
            internationalNumber: internationalNumber,
            e164Number: e164Number);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
