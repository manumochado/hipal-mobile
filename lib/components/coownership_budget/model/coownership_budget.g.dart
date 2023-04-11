// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coownership_budget.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CoownershipBudget> _$coownershipBudgetSerializer =
    new _$CoownershipBudgetSerializer();

class _$CoownershipBudgetSerializer
    implements StructuredSerializer<CoownershipBudget> {
  @override
  final Iterable<Type> types = const [CoownershipBudget, _$CoownershipBudget];
  @override
  final String wireName = 'CoownershipBudget';

  @override
  Iterable<Object?> serialize(Serializers serializers, CoownershipBudget object,
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
    value = object.provider;
    if (value != null) {
      result
        ..add('provider')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Provider)));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Residential)));
    }
    value = object.worth;
    if (value != null) {
      result
        ..add('worth')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.month;
    if (value != null) {
      result
        ..add('month')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameEgress;
    if (value != null) {
      result
        ..add('nameEgress')
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
  CoownershipBudget deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoownershipBudgetBuilder();

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
        case 'provider':
          result.provider.replace(serializers.deserialize(value,
              specifiedType: const FullType(Provider))! as Provider);
          break;
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'worth':
          result.worth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'month':
          result.month = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameEgress':
          result.nameEgress = serializers.deserialize(value,
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

class _$CoownershipBudget extends CoownershipBudget {
  @override
  final String? id;
  @override
  final Provider? provider;
  @override
  final Residential? residential;
  @override
  final int? worth;
  @override
  final String? year;
  @override
  final String? month;
  @override
  final String? nameEgress;
  @override
  final Image? image;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$CoownershipBudget(
          [void Function(CoownershipBudgetBuilder)? updates]) =>
      (new CoownershipBudgetBuilder()..update(updates))._build();

  _$CoownershipBudget._(
      {this.id,
      this.provider,
      this.residential,
      this.worth,
      this.year,
      this.month,
      this.nameEgress,
      this.image,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  CoownershipBudget rebuild(void Function(CoownershipBudgetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoownershipBudgetBuilder toBuilder() =>
      new CoownershipBudgetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoownershipBudget &&
        id == other.id &&
        provider == other.provider &&
        residential == other.residential &&
        worth == other.worth &&
        year == other.year &&
        month == other.month &&
        nameEgress == other.nameEgress &&
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
                                $jc($jc($jc(0, id.hashCode), provider.hashCode),
                                    residential.hashCode),
                                worth.hashCode),
                            year.hashCode),
                        month.hashCode),
                    nameEgress.hashCode),
                image.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CoownershipBudget')
          ..add('id', id)
          ..add('provider', provider)
          ..add('residential', residential)
          ..add('worth', worth)
          ..add('year', year)
          ..add('month', month)
          ..add('nameEgress', nameEgress)
          ..add('image', image)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CoownershipBudgetBuilder
    implements Builder<CoownershipBudget, CoownershipBudgetBuilder> {
  _$CoownershipBudget? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ProviderBuilder? _provider;
  ProviderBuilder get provider => _$this._provider ??= new ProviderBuilder();
  set provider(ProviderBuilder? provider) => _$this._provider = provider;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  int? _worth;
  int? get worth => _$this._worth;
  set worth(int? worth) => _$this._worth = worth;

  String? _year;
  String? get year => _$this._year;
  set year(String? year) => _$this._year = year;

  String? _month;
  String? get month => _$this._month;
  set month(String? month) => _$this._month = month;

  String? _nameEgress;
  String? get nameEgress => _$this._nameEgress;
  set nameEgress(String? nameEgress) => _$this._nameEgress = nameEgress;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  CoownershipBudgetBuilder();

  CoownershipBudgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _provider = $v.provider?.toBuilder();
      _residential = $v.residential?.toBuilder();
      _worth = $v.worth;
      _year = $v.year;
      _month = $v.month;
      _nameEgress = $v.nameEgress;
      _image = $v.image?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoownershipBudget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoownershipBudget;
  }

  @override
  void update(void Function(CoownershipBudgetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CoownershipBudget build() => _build();

  _$CoownershipBudget _build() {
    _$CoownershipBudget _$result;
    try {
      _$result = _$v ??
          new _$CoownershipBudget._(
              id: id,
              provider: _provider?.build(),
              residential: _residential?.build(),
              worth: worth,
              year: year,
              month: month,
              nameEgress: nameEgress,
              image: _image?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'provider';
        _provider?.build();
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CoownershipBudget', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
