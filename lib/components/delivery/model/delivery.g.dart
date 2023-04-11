// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Delivery> _$deliverySerializer = new _$DeliverySerializer();

class _$DeliverySerializer implements StructuredSerializer<Delivery> {
  @override
  final Iterable<Type> types = const [Delivery, _$Delivery];
  @override
  final String wireName = 'Delivery';

  @override
  Iterable<Object?> serialize(Serializers serializers, Delivery object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
    return result;
  }

  @override
  Delivery deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliveryBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeFilter))! as TypeFilter);
          break;
      }
    }

    return result.build();
  }
}

class _$Delivery extends Delivery {
  @override
  final String? id;
  @override
  final Image? image;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final TypeFilter? type;

  factory _$Delivery([void Function(DeliveryBuilder)? updates]) =>
      (new DeliveryBuilder()..update(updates))._build();

  _$Delivery._({this.id, this.image, this.name, this.description, this.type})
      : super._();

  @override
  Delivery rebuild(void Function(DeliveryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliveryBuilder toBuilder() => new DeliveryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Delivery &&
        id == other.id &&
        image == other.image &&
        name == other.name &&
        description == other.description &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), image.hashCode), name.hashCode),
            description.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Delivery')
          ..add('id', id)
          ..add('image', image)
          ..add('name', name)
          ..add('description', description)
          ..add('type', type))
        .toString();
  }
}

class DeliveryBuilder implements Builder<Delivery, DeliveryBuilder> {
  _$Delivery? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  TypeFilterBuilder? _type;
  TypeFilterBuilder get type => _$this._type ??= new TypeFilterBuilder();
  set type(TypeFilterBuilder? type) => _$this._type = type;

  DeliveryBuilder();

  DeliveryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image?.toBuilder();
      _name = $v.name;
      _description = $v.description;
      _type = $v.type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Delivery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Delivery;
  }

  @override
  void update(void Function(DeliveryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Delivery build() => _build();

  _$Delivery _build() {
    _$Delivery _$result;
    try {
      _$result = _$v ??
          new _$Delivery._(
              id: id,
              image: _image?.build(),
              name: name,
              description: description,
              type: _type?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();

        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Delivery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
