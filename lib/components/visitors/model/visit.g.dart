// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Visit> _$visitSerializer = new _$VisitSerializer();

class _$VisitSerializer implements StructuredSerializer<Visit> {
  @override
  final Iterable<Type> types = const [Visit, _$Visit];
  @override
  final String wireName = 'Visit';

  @override
  Iterable<Object?> serialize(Serializers serializers, Visit object,
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
            specifiedType: const FullType(ApartmentUser)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.licensePlate;
    if (value != null) {
      result
        ..add('licensePlate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mark;
    if (value != null) {
      result
        ..add('mark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.NumberPeople;
    if (value != null) {
      result
        ..add('NumberPeople')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeVisit;
    if (value != null) {
      result
        ..add('typeVisit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeArrival;
    if (value != null) {
      result
        ..add('typeArrival')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hour;
    if (value != null) {
      result
        ..add('hour')
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
    value = object.driverName;
    if (value != null) {
      result
        ..add('driverName')
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
    value = object.fullName;
    if (value != null) {
      result
        ..add('fullName')
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
  Visit deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitBuilder();

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
              specifiedType: const FullType(ApartmentUser))! as ApartmentUser);
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'licensePlate':
          result.licensePlate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mark':
          result.mark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'NumberPeople':
          result.NumberPeople = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'typeVisit':
          result.typeVisit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'typeArrival':
          result.typeArrival = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hour':
          result.hour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'driverName':
          result.driverName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'identity':
          result.identity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
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

class _$Visit extends Visit {
  @override
  final String? id;
  @override
  final ApartmentUser? apartment;
  @override
  final String? color;
  @override
  final String? licensePlate;
  @override
  final String? mark;
  @override
  final int? NumberPeople;
  @override
  final String? state;
  @override
  final String? typeVisit;
  @override
  final String? typeArrival;
  @override
  final String? hour;
  @override
  final DateTime? date;
  @override
  final String? driverName;
  @override
  final String? identity;
  @override
  final String? fullName;
  @override
  final Image? image;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$Visit([void Function(VisitBuilder)? updates]) =>
      (new VisitBuilder()..update(updates))._build();

  _$Visit._(
      {this.id,
      this.apartment,
      this.color,
      this.licensePlate,
      this.mark,
      this.NumberPeople,
      this.state,
      this.typeVisit,
      this.typeArrival,
      this.hour,
      this.date,
      this.driverName,
      this.identity,
      this.fullName,
      this.image,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  Visit rebuild(void Function(VisitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitBuilder toBuilder() => new VisitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Visit &&
        id == other.id &&
        apartment == other.apartment &&
        color == other.color &&
        licensePlate == other.licensePlate &&
        mark == other.mark &&
        NumberPeople == other.NumberPeople &&
        state == other.state &&
        typeVisit == other.typeVisit &&
        typeArrival == other.typeArrival &&
        hour == other.hour &&
        date == other.date &&
        driverName == other.driverName &&
        identity == other.identity &&
        fullName == other.fullName &&
        image == other.image &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        id
                                                                            .hashCode),
                                                                    apartment
                                                                        .hashCode),
                                                                color.hashCode),
                                                            licensePlate
                                                                .hashCode),
                                                        mark.hashCode),
                                                    NumberPeople.hashCode),
                                                state.hashCode),
                                            typeVisit.hashCode),
                                        typeArrival.hashCode),
                                    hour.hashCode),
                                date.hashCode),
                            driverName.hashCode),
                        identity.hashCode),
                    fullName.hashCode),
                image.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Visit')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('color', color)
          ..add('licensePlate', licensePlate)
          ..add('mark', mark)
          ..add('NumberPeople', NumberPeople)
          ..add('state', state)
          ..add('typeVisit', typeVisit)
          ..add('typeArrival', typeArrival)
          ..add('hour', hour)
          ..add('date', date)
          ..add('driverName', driverName)
          ..add('identity', identity)
          ..add('fullName', fullName)
          ..add('image', image)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class VisitBuilder implements Builder<Visit, VisitBuilder> {
  _$Visit? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApartmentUserBuilder? _apartment;
  ApartmentUserBuilder get apartment =>
      _$this._apartment ??= new ApartmentUserBuilder();
  set apartment(ApartmentUserBuilder? apartment) =>
      _$this._apartment = apartment;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _licensePlate;
  String? get licensePlate => _$this._licensePlate;
  set licensePlate(String? licensePlate) => _$this._licensePlate = licensePlate;

  String? _mark;
  String? get mark => _$this._mark;
  set mark(String? mark) => _$this._mark = mark;

  int? _NumberPeople;
  int? get NumberPeople => _$this._NumberPeople;
  set NumberPeople(int? NumberPeople) => _$this._NumberPeople = NumberPeople;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _typeVisit;
  String? get typeVisit => _$this._typeVisit;
  set typeVisit(String? typeVisit) => _$this._typeVisit = typeVisit;

  String? _typeArrival;
  String? get typeArrival => _$this._typeArrival;
  set typeArrival(String? typeArrival) => _$this._typeArrival = typeArrival;

  String? _hour;
  String? get hour => _$this._hour;
  set hour(String? hour) => _$this._hour = hour;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _driverName;
  String? get driverName => _$this._driverName;
  set driverName(String? driverName) => _$this._driverName = driverName;

  String? _identity;
  String? get identity => _$this._identity;
  set identity(String? identity) => _$this._identity = identity;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  VisitBuilder();

  VisitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment?.toBuilder();
      _color = $v.color;
      _licensePlate = $v.licensePlate;
      _mark = $v.mark;
      _NumberPeople = $v.NumberPeople;
      _state = $v.state;
      _typeVisit = $v.typeVisit;
      _typeArrival = $v.typeArrival;
      _hour = $v.hour;
      _date = $v.date;
      _driverName = $v.driverName;
      _identity = $v.identity;
      _fullName = $v.fullName;
      _image = $v.image?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Visit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Visit;
  }

  @override
  void update(void Function(VisitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Visit build() => _build();

  _$Visit _build() {
    _$Visit _$result;
    try {
      _$result = _$v ??
          new _$Visit._(
              id: id,
              apartment: _apartment?.build(),
              color: color,
              licensePlate: licensePlate,
              mark: mark,
              NumberPeople: NumberPeople,
              state: state,
              typeVisit: typeVisit,
              typeArrival: typeArrival,
              hour: hour,
              date: date,
              driverName: driverName,
              identity: identity,
              fullName: fullName,
              image: _image?.build(),
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
            r'Visit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
