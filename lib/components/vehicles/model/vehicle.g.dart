// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Vehicle> _$vehicleSerializer = new _$VehicleSerializer();

class _$VehicleSerializer implements StructuredSerializer<Vehicle> {
  @override
  final Iterable<Type> types = const [Vehicle, _$Vehicle];
  @override
  final String wireName = 'Vehicle';

  @override
  Iterable<Object?> serialize(Serializers serializers, Vehicle object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TypeFilter)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plate;
    if (value != null) {
      result
        ..add('plate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
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
    value = object.v;
    if (value != null) {
      result
        ..add('v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Vehicle deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VehicleBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeFilter))! as TypeFilter);
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plate':
          result.plate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mark':
          result.mark = serializers.deserialize(value,
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
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Vehicle extends Vehicle {
  @override
  final String? id;
  @override
  final Apartment? apartment;
  @override
  final Image? image;
  @override
  final TypeFilter? type;
  @override
  final String? color;
  @override
  final String? plate;
  @override
  final int? year;
  @override
  final String? model;
  @override
  final String? mark;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;

  factory _$Vehicle([void Function(VehicleBuilder)? updates]) =>
      (new VehicleBuilder()..update(updates))._build();

  _$Vehicle._(
      {this.id,
      this.apartment,
      this.image,
      this.type,
      this.color,
      this.plate,
      this.year,
      this.model,
      this.mark,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  Vehicle rebuild(void Function(VehicleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VehicleBuilder toBuilder() => new VehicleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vehicle &&
        id == other.id &&
        apartment == other.apartment &&
        image == other.image &&
        type == other.type &&
        color == other.color &&
        plate == other.plate &&
        year == other.year &&
        model == other.model &&
        mark == other.mark &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
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
                                            $jc($jc(0, id.hashCode),
                                                apartment.hashCode),
                                            image.hashCode),
                                        type.hashCode),
                                    color.hashCode),
                                plate.hashCode),
                            year.hashCode),
                        model.hashCode),
                    mark.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Vehicle')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('image', image)
          ..add('type', type)
          ..add('color', color)
          ..add('plate', plate)
          ..add('year', year)
          ..add('model', model)
          ..add('mark', mark)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class VehicleBuilder implements Builder<Vehicle, VehicleBuilder> {
  _$Vehicle? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApartmentBuilder? _apartment;
  ApartmentBuilder get apartment =>
      _$this._apartment ??= new ApartmentBuilder();
  set apartment(ApartmentBuilder? apartment) => _$this._apartment = apartment;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  TypeFilterBuilder? _type;
  TypeFilterBuilder get type => _$this._type ??= new TypeFilterBuilder();
  set type(TypeFilterBuilder? type) => _$this._type = type;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _plate;
  String? get plate => _$this._plate;
  set plate(String? plate) => _$this._plate = plate;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _mark;
  String? get mark => _$this._mark;
  set mark(String? mark) => _$this._mark = mark;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  VehicleBuilder();

  VehicleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment?.toBuilder();
      _image = $v.image?.toBuilder();
      _type = $v.type?.toBuilder();
      _color = $v.color;
      _plate = $v.plate;
      _year = $v.year;
      _model = $v.model;
      _mark = $v.mark;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Vehicle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Vehicle;
  }

  @override
  void update(void Function(VehicleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Vehicle build() => _build();

  _$Vehicle _build() {
    _$Vehicle _$result;
    try {
      _$result = _$v ??
          new _$Vehicle._(
              id: id,
              apartment: _apartment?.build(),
              image: _image?.build(),
              type: _type?.build(),
              color: color,
              plate: plate,
              year: year,
              model: model,
              mark: mark,
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apartment';
        _apartment?.build();
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Vehicle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
