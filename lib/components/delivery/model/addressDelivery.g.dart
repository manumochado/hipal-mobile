// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressDelivery.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddressDelivery> _$addressDeliverySerializer =
    new _$AddressDeliverySerializer();

class _$AddressDeliverySerializer
    implements StructuredSerializer<AddressDelivery> {
  @override
  final Iterable<Type> types = const [AddressDelivery, _$AddressDelivery];
  @override
  final String wireName = 'AddressDelivery';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddressDelivery object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
    }
    value = object.qualifiers;
    if (value != null) {
      result
        ..add('qualifiers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.score;
    if (value != null) {
      result
        ..add('score')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  AddressDelivery deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressDeliveryBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo':
          result.photo.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
        case 'qualifiers':
          result.qualifiers = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$AddressDelivery extends AddressDelivery {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final Image? photo;
  @override
  final double? qualifiers;
  @override
  final double? score;

  factory _$AddressDelivery([void Function(AddressDeliveryBuilder)? updates]) =>
      (new AddressDeliveryBuilder()..update(updates))._build();

  _$AddressDelivery._(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.photo,
      this.qualifiers,
      this.score})
      : super._();

  @override
  AddressDelivery rebuild(void Function(AddressDeliveryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressDeliveryBuilder toBuilder() =>
      new AddressDeliveryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressDelivery &&
        id == other.id &&
        name == other.name &&
        phone == other.phone &&
        address == other.address &&
        photo == other.photo &&
        qualifiers == other.qualifiers &&
        score == other.score;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                        phone.hashCode),
                    address.hashCode),
                photo.hashCode),
            qualifiers.hashCode),
        score.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressDelivery')
          ..add('id', id)
          ..add('name', name)
          ..add('phone', phone)
          ..add('address', address)
          ..add('photo', photo)
          ..add('qualifiers', qualifiers)
          ..add('score', score))
        .toString();
  }
}

class AddressDeliveryBuilder
    implements Builder<AddressDelivery, AddressDeliveryBuilder> {
  _$AddressDelivery? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ImageBuilder? _photo;
  ImageBuilder get photo => _$this._photo ??= new ImageBuilder();
  set photo(ImageBuilder? photo) => _$this._photo = photo;

  double? _qualifiers;
  double? get qualifiers => _$this._qualifiers;
  set qualifiers(double? qualifiers) => _$this._qualifiers = qualifiers;

  double? _score;
  double? get score => _$this._score;
  set score(double? score) => _$this._score = score;

  AddressDeliveryBuilder();

  AddressDeliveryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _phone = $v.phone;
      _address = $v.address;
      _photo = $v.photo?.toBuilder();
      _qualifiers = $v.qualifiers;
      _score = $v.score;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressDelivery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressDelivery;
  }

  @override
  void update(void Function(AddressDeliveryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressDelivery build() => _build();

  _$AddressDelivery _build() {
    _$AddressDelivery _$result;
    try {
      _$result = _$v ??
          new _$AddressDelivery._(
              id: id,
              name: name,
              phone: phone,
              address: address,
              photo: _photo?.build(),
              qualifiers: qualifiers,
              score: score);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photo';
        _photo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddressDelivery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
