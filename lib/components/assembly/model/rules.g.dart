// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Rules> _$rulesSerializer = new _$RulesSerializer();

class _$RulesSerializer implements StructuredSerializer<Rules> {
  @override
  final Iterable<Type> types = const [Rules, _$Rules];
  @override
  final String wireName = 'Rules';

  @override
  Iterable<Object?> serialize(Serializers serializers, Rules object,
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
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Residential)));
    }
    value = object.isVisible;
    if (value != null) {
      result
        ..add('isVisible')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rulesName;
    if (value != null) {
      result
        ..add('rulesName')
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
    return result;
  }

  @override
  Rules deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RulesBuilder();

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
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'isVisible':
          result.isVisible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rulesName':
          result.rulesName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
      }
    }

    return result.build();
  }
}

class _$Rules extends Rules {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final bool? isVisible;
  @override
  final String? rulesName;
  @override
  final Image? image;

  factory _$Rules([void Function(RulesBuilder)? updates]) =>
      (new RulesBuilder()..update(updates))._build();

  _$Rules._(
      {this.id, this.residential, this.isVisible, this.rulesName, this.image})
      : super._();

  @override
  Rules rebuild(void Function(RulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RulesBuilder toBuilder() => new RulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Rules &&
        id == other.id &&
        residential == other.residential &&
        isVisible == other.isVisible &&
        rulesName == other.rulesName &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), residential.hashCode),
                isVisible.hashCode),
            rulesName.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Rules')
          ..add('id', id)
          ..add('residential', residential)
          ..add('isVisible', isVisible)
          ..add('rulesName', rulesName)
          ..add('image', image))
        .toString();
  }
}

class RulesBuilder implements Builder<Rules, RulesBuilder> {
  _$Rules? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  String? _rulesName;
  String? get rulesName => _$this._rulesName;
  set rulesName(String? rulesName) => _$this._rulesName = rulesName;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  RulesBuilder();

  RulesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _isVisible = $v.isVisible;
      _rulesName = $v.rulesName;
      _image = $v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Rules other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Rules;
  }

  @override
  void update(void Function(RulesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Rules build() => _build();

  _$Rules _build() {
    _$Rules _$result;
    try {
      _$result = _$v ??
          new _$Rules._(
              id: id,
              residential: _residential?.build(),
              isVisible: isVisible,
              rulesName: rulesName,
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Rules', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
