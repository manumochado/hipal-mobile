// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locker.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Locker> _$lockerSerializer = new _$LockerSerializer();

class _$LockerSerializer implements StructuredSerializer<Locker> {
  @override
  final Iterable<Type> types = const [Locker, _$Locker];
  @override
  final String wireName = 'Locker';

  @override
  Iterable<Object?> serialize(Serializers serializers, Locker object,
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
            specifiedType: const FullType(Apartment)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.receivesName;
    if (value != null) {
      result
        ..add('receivesName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipientPhone;
    if (value != null) {
      result
        ..add('recipientPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipientName;
    if (value != null) {
      result
        ..add('recipientName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
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
    value = object.dateState;
    if (value != null) {
      result
        ..add('dateState')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.descriptionState;
    if (value != null) {
      result
        ..add('descriptionState')
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
    return result;
  }

  @override
  Locker deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LockerBuilder();

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
          result.apartment.replace(serializers.deserialize(value,
              specifiedType: const FullType(Apartment))! as Apartment);
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'receivesName':
          result.receivesName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipientPhone':
          result.recipientPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipientName':
          result.recipientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
        case 'dateState':
          result.dateState = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'descriptionState':
          result.descriptionState = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$Locker extends Locker {
  @override
  final String? id;
  @override
  final Apartment? apartment;
  @override
  final String? state;
  @override
  final DateTime? date;
  @override
  final String? receivesName;
  @override
  final String? recipientPhone;
  @override
  final String? recipientName;
  @override
  final String? sender;
  @override
  final Image? image;
  @override
  final DateTime? dateState;
  @override
  final String? descriptionState;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$Locker([void Function(LockerBuilder)? updates]) =>
      (new LockerBuilder()..update(updates))._build();

  _$Locker._(
      {this.id,
      this.apartment,
      this.state,
      this.date,
      this.receivesName,
      this.recipientPhone,
      this.recipientName,
      this.sender,
      this.image,
      this.dateState,
      this.descriptionState,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  Locker rebuild(void Function(LockerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LockerBuilder toBuilder() => new LockerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Locker &&
        id == other.id &&
        apartment == other.apartment &&
        state == other.state &&
        date == other.date &&
        receivesName == other.receivesName &&
        recipientPhone == other.recipientPhone &&
        recipientName == other.recipientName &&
        sender == other.sender &&
        image == other.image &&
        dateState == other.dateState &&
        descriptionState == other.descriptionState &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
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
                                                $jc($jc(0, id.hashCode),
                                                    apartment.hashCode),
                                                state.hashCode),
                                            date.hashCode),
                                        receivesName.hashCode),
                                    recipientPhone.hashCode),
                                recipientName.hashCode),
                            sender.hashCode),
                        image.hashCode),
                    dateState.hashCode),
                descriptionState.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Locker')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('state', state)
          ..add('date', date)
          ..add('receivesName', receivesName)
          ..add('recipientPhone', recipientPhone)
          ..add('recipientName', recipientName)
          ..add('sender', sender)
          ..add('image', image)
          ..add('dateState', dateState)
          ..add('descriptionState', descriptionState)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class LockerBuilder implements Builder<Locker, LockerBuilder> {
  _$Locker? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApartmentBuilder? _apartment;
  ApartmentBuilder get apartment =>
      _$this._apartment ??= new ApartmentBuilder();
  set apartment(ApartmentBuilder? apartment) => _$this._apartment = apartment;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _receivesName;
  String? get receivesName => _$this._receivesName;
  set receivesName(String? receivesName) => _$this._receivesName = receivesName;

  String? _recipientPhone;
  String? get recipientPhone => _$this._recipientPhone;
  set recipientPhone(String? recipientPhone) =>
      _$this._recipientPhone = recipientPhone;

  String? _recipientName;
  String? get recipientName => _$this._recipientName;
  set recipientName(String? recipientName) =>
      _$this._recipientName = recipientName;

  String? _sender;
  String? get sender => _$this._sender;
  set sender(String? sender) => _$this._sender = sender;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _dateState;
  DateTime? get dateState => _$this._dateState;
  set dateState(DateTime? dateState) => _$this._dateState = dateState;

  String? _descriptionState;
  String? get descriptionState => _$this._descriptionState;
  set descriptionState(String? descriptionState) =>
      _$this._descriptionState = descriptionState;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  LockerBuilder();

  LockerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment?.toBuilder();
      _state = $v.state;
      _date = $v.date;
      _receivesName = $v.receivesName;
      _recipientPhone = $v.recipientPhone;
      _recipientName = $v.recipientName;
      _sender = $v.sender;
      _image = $v.image?.toBuilder();
      _dateState = $v.dateState;
      _descriptionState = $v.descriptionState;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Locker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Locker;
  }

  @override
  void update(void Function(LockerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Locker build() => _build();

  _$Locker _build() {
    _$Locker _$result;
    try {
      _$result = _$v ??
          new _$Locker._(
              id: id,
              apartment: _apartment?.build(),
              state: state,
              date: date,
              receivesName: receivesName,
              recipientPhone: recipientPhone,
              recipientName: recipientName,
              sender: sender,
              image: _image?.build(),
              dateState: dateState,
              descriptionState: descriptionState,
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apartment';
        _apartment?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Locker', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
