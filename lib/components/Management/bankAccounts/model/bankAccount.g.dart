// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankAccount.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BankAccount> _$bankAccountSerializer = new _$BankAccountSerializer();

class _$BankAccountSerializer implements StructuredSerializer<BankAccount> {
  @override
  final Iterable<Type> types = const [BankAccount, _$BankAccount];
  @override
  final String wireName = 'BankAccount';

  @override
  Iterable<Object?> serialize(Serializers serializers, BankAccount object,
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
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Residential)));
    }
    value = object.ownerName;
    if (value != null) {
      result
        ..add('ownerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountNumber;
    if (value != null) {
      result
        ..add('accountNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountType;
    if (value != null) {
      result
        ..add('accountType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AccountType)));
    }
    value = object.bank;
    if (value != null) {
      result
        ..add('bank')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Bank)));
    }
    value = object.idBank;
    if (value != null) {
      result
        ..add('idBank')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
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
  BankAccount deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BankAccountBuilder();

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
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'ownerName':
          result.ownerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountNumber':
          result.accountNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountType':
          result.accountType.replace(serializers.deserialize(value,
              specifiedType: const FullType(AccountType))! as AccountType);
          break;
        case 'bank':
          result.bank.replace(serializers.deserialize(value,
              specifiedType: const FullType(Bank))! as Bank);
          break;
        case 'idBank':
          result.idBank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
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

class _$BankAccount extends BankAccount {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final String? ownerName;
  @override
  final String? accountNumber;
  @override
  final AccountType? accountType;
  @override
  final Bank? bank;
  @override
  final String? idBank;
  @override
  final Image? image;
  @override
  final int? v;

  factory _$BankAccount([void Function(BankAccountBuilder)? updates]) =>
      (new BankAccountBuilder()..update(updates))._build();

  _$BankAccount._(
      {this.id,
      this.residential,
      this.ownerName,
      this.accountNumber,
      this.accountType,
      this.bank,
      this.idBank,
      this.image,
      this.v})
      : super._();

  @override
  BankAccount rebuild(void Function(BankAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankAccountBuilder toBuilder() => new BankAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankAccount &&
        id == other.id &&
        residential == other.residential &&
        ownerName == other.ownerName &&
        accountNumber == other.accountNumber &&
        accountType == other.accountType &&
        bank == other.bank &&
        idBank == other.idBank &&
        image == other.image &&
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
                            $jc($jc($jc(0, id.hashCode), residential.hashCode),
                                ownerName.hashCode),
                            accountNumber.hashCode),
                        accountType.hashCode),
                    bank.hashCode),
                idBank.hashCode),
            image.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankAccount')
          ..add('id', id)
          ..add('residential', residential)
          ..add('ownerName', ownerName)
          ..add('accountNumber', accountNumber)
          ..add('accountType', accountType)
          ..add('bank', bank)
          ..add('idBank', idBank)
          ..add('image', image)
          ..add('v', v))
        .toString();
  }
}

class BankAccountBuilder implements Builder<BankAccount, BankAccountBuilder> {
  _$BankAccount? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _ownerName;
  String? get ownerName => _$this._ownerName;
  set ownerName(String? ownerName) => _$this._ownerName = ownerName;

  String? _accountNumber;
  String? get accountNumber => _$this._accountNumber;
  set accountNumber(String? accountNumber) =>
      _$this._accountNumber = accountNumber;

  AccountTypeBuilder? _accountType;
  AccountTypeBuilder get accountType =>
      _$this._accountType ??= new AccountTypeBuilder();
  set accountType(AccountTypeBuilder? accountType) =>
      _$this._accountType = accountType;

  BankBuilder? _bank;
  BankBuilder get bank => _$this._bank ??= new BankBuilder();
  set bank(BankBuilder? bank) => _$this._bank = bank;

  String? _idBank;
  String? get idBank => _$this._idBank;
  set idBank(String? idBank) => _$this._idBank = idBank;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  BankAccountBuilder();

  BankAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _ownerName = $v.ownerName;
      _accountNumber = $v.accountNumber;
      _accountType = $v.accountType?.toBuilder();
      _bank = $v.bank?.toBuilder();
      _idBank = $v.idBank;
      _image = $v.image?.toBuilder();
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankAccount;
  }

  @override
  void update(void Function(BankAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankAccount build() => _build();

  _$BankAccount _build() {
    _$BankAccount _$result;
    try {
      _$result = _$v ??
          new _$BankAccount._(
              id: id,
              residential: _residential?.build(),
              ownerName: ownerName,
              accountNumber: accountNumber,
              accountType: _accountType?.build(),
              bank: _bank?.build(),
              idBank: idBank,
              image: _image?.build(),
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'accountType';
        _accountType?.build();
        _$failedField = 'bank';
        _bank?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
