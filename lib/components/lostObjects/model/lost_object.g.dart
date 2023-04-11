// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lost_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LostObject> _$lostObjectSerializer = new _$LostObjectSerializer();

class _$LostObjectSerializer implements StructuredSerializer<LostObject> {
  @override
  final Iterable<Type> types = const [LostObject, _$LostObject];
  @override
  final String wireName = 'LostObject';

  @override
  Iterable<Object?> serialize(Serializers serializers, LostObject object,
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
    value = object.state;
    if (value != null) {
      result
        ..add('state')
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
    value = object.dateEntry;
    if (value != null) {
      result
        ..add('dateEntry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
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
    value = object.nameObject;
    if (value != null) {
      result
        ..add('nameObject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Image)])));
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
  LostObject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LostObjectBuilder();

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
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateEntry':
          result.dateEntry = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mark':
          result.mark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameObject':
          result.nameObject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Image)]))!
              as BuiltList<Object?>);
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

class _$LostObject extends LostObject {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final String? state;
  @override
  final String? fullName;
  @override
  final DateTime? dateEntry;
  @override
  final String? description;
  @override
  final String? color;
  @override
  final String? mark;
  @override
  final String? nameObject;
  @override
  final BuiltList<Image>? images;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$LostObject([void Function(LostObjectBuilder)? updates]) =>
      (new LostObjectBuilder()..update(updates))._build();

  _$LostObject._(
      {this.id,
      this.residential,
      this.state,
      this.fullName,
      this.dateEntry,
      this.description,
      this.color,
      this.mark,
      this.nameObject,
      this.images,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  LostObject rebuild(void Function(LostObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LostObjectBuilder toBuilder() => new LostObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LostObject &&
        id == other.id &&
        residential == other.residential &&
        state == other.state &&
        fullName == other.fullName &&
        dateEntry == other.dateEntry &&
        description == other.description &&
        color == other.color &&
        mark == other.mark &&
        nameObject == other.nameObject &&
        images == other.images &&
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
                                            $jc($jc(0, id.hashCode),
                                                residential.hashCode),
                                            state.hashCode),
                                        fullName.hashCode),
                                    dateEntry.hashCode),
                                description.hashCode),
                            color.hashCode),
                        mark.hashCode),
                    nameObject.hashCode),
                images.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LostObject')
          ..add('id', id)
          ..add('residential', residential)
          ..add('state', state)
          ..add('fullName', fullName)
          ..add('dateEntry', dateEntry)
          ..add('description', description)
          ..add('color', color)
          ..add('mark', mark)
          ..add('nameObject', nameObject)
          ..add('images', images)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class LostObjectBuilder implements Builder<LostObject, LostObjectBuilder> {
  _$LostObject? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  DateTime? _dateEntry;
  DateTime? get dateEntry => _$this._dateEntry;
  set dateEntry(DateTime? dateEntry) => _$this._dateEntry = dateEntry;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _mark;
  String? get mark => _$this._mark;
  set mark(String? mark) => _$this._mark = mark;

  String? _nameObject;
  String? get nameObject => _$this._nameObject;
  set nameObject(String? nameObject) => _$this._nameObject = nameObject;

  ListBuilder<Image>? _images;
  ListBuilder<Image> get images => _$this._images ??= new ListBuilder<Image>();
  set images(ListBuilder<Image>? images) => _$this._images = images;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  LostObjectBuilder();

  LostObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _state = $v.state;
      _fullName = $v.fullName;
      _dateEntry = $v.dateEntry;
      _description = $v.description;
      _color = $v.color;
      _mark = $v.mark;
      _nameObject = $v.nameObject;
      _images = $v.images?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LostObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LostObject;
  }

  @override
  void update(void Function(LostObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LostObject build() => _build();

  _$LostObject _build() {
    _$LostObject _$result;
    try {
      _$result = _$v ??
          new _$LostObject._(
              id: id,
              residential: _residential?.build(),
              state: state,
              fullName: fullName,
              dateEntry: dateEntry,
              description: description,
              color: color,
              mark: mark,
              nameObject: nameObject,
              images: _images?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LostObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
