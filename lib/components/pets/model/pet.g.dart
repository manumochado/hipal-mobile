// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pet> _$petSerializer = new _$PetSerializer();

class _$PetSerializer implements StructuredSerializer<Pet> {
  @override
  final Iterable<Type> types = const [Pet, _$Pet];
  @override
  final String wireName = 'Pet';

  @override
  Iterable<Object?> serialize(Serializers serializers, Pet object,
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
    value = object.vaccinated;
    if (value != null) {
      result
        ..add('vaccinated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.race;
    if (value != null) {
      result
        ..add('race')
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TypeFilter)));
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
    value = object.v;
    if (value != null) {
      result
        ..add('v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birthDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Pet deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetBuilder();

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
        case 'vaccinated':
          result.vaccinated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'race':
          result.race = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeFilter))! as TypeFilter);
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
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Pet extends Pet {
  @override
  final String? id;
  @override
  final Apartment? apartment;
  @override
  final bool? vaccinated;
  @override
  final String? color;
  @override
  final int? age;
  @override
  final String? race;
  @override
  final String? name;
  @override
  final TypeFilter? type;
  @override
  final Image? image;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;
  @override
  final DateTime? birthDate;

  factory _$Pet([void Function(PetBuilder)? updates]) =>
      (new PetBuilder()..update(updates))._build();

  _$Pet._(
      {this.id,
      this.apartment,
      this.vaccinated,
      this.color,
      this.age,
      this.race,
      this.name,
      this.type,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.birthDate})
      : super._();

  @override
  Pet rebuild(void Function(PetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetBuilder toBuilder() => new PetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pet &&
        id == other.id &&
        apartment == other.apartment &&
        vaccinated == other.vaccinated &&
        color == other.color &&
        age == other.age &&
        race == other.race &&
        name == other.name &&
        type == other.type &&
        image == other.image &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v &&
        birthDate == other.birthDate;
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
                                                vaccinated.hashCode),
                                            color.hashCode),
                                        age.hashCode),
                                    race.hashCode),
                                name.hashCode),
                            type.hashCode),
                        image.hashCode),
                    createdAt.hashCode),
                updatedAt.hashCode),
            v.hashCode),
        birthDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Pet')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('vaccinated', vaccinated)
          ..add('color', color)
          ..add('age', age)
          ..add('race', race)
          ..add('name', name)
          ..add('type', type)
          ..add('image', image)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v)
          ..add('birthDate', birthDate))
        .toString();
  }
}

class PetBuilder implements Builder<Pet, PetBuilder> {
  _$Pet? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApartmentBuilder? _apartment;
  ApartmentBuilder get apartment =>
      _$this._apartment ??= new ApartmentBuilder();
  set apartment(ApartmentBuilder? apartment) => _$this._apartment = apartment;

  bool? _vaccinated;
  bool? get vaccinated => _$this._vaccinated;
  set vaccinated(bool? vaccinated) => _$this._vaccinated = vaccinated;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _race;
  String? get race => _$this._race;
  set race(String? race) => _$this._race = race;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  TypeFilterBuilder? _type;
  TypeFilterBuilder get type => _$this._type ??= new TypeFilterBuilder();
  set type(TypeFilterBuilder? type) => _$this._type = type;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  PetBuilder();

  PetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment?.toBuilder();
      _vaccinated = $v.vaccinated;
      _color = $v.color;
      _age = $v.age;
      _race = $v.race;
      _name = $v.name;
      _type = $v.type?.toBuilder();
      _image = $v.image?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _birthDate = $v.birthDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Pet;
  }

  @override
  void update(void Function(PetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Pet build() => _build();

  _$Pet _build() {
    _$Pet _$result;
    try {
      _$result = _$v ??
          new _$Pet._(
              id: id,
              apartment: _apartment?.build(),
              vaccinated: vaccinated,
              color: color,
              age: age,
              race: race,
              name: name,
              type: _type?.build(),
              image: _image?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v,
              birthDate: birthDate);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apartment';
        _apartment?.build();

        _$failedField = 'type';
        _type?.build();
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Pet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
