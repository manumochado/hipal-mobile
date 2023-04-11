// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Provider> _$providerSerializer = new _$ProviderSerializer();

class _$ProviderSerializer implements StructuredSerializer<Provider> {
  @override
  final Iterable<Type> types = const [Provider, _$Provider];
  @override
  final String wireName = 'Provider';

  @override
  Iterable<Object?> serialize(Serializers serializers, Provider object,
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
    value = object.bussinnes;
    if (value != null) {
      result
        ..add('bussinnes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameCompany;
    if (value != null) {
      result
        ..add('nameCompany')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Provider deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProviderBuilder();

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
        case 'bussinnes':
          result.bussinnes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameCompany':
          result.nameCompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Provider extends Provider {
  @override
  final String? id;
  @override
  final String? bussinnes;
  @override
  final String? nameCompany;

  factory _$Provider([void Function(ProviderBuilder)? updates]) =>
      (new ProviderBuilder()..update(updates))._build();

  _$Provider._({this.id, this.bussinnes, this.nameCompany}) : super._();

  @override
  Provider rebuild(void Function(ProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderBuilder toBuilder() => new ProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Provider &&
        id == other.id &&
        bussinnes == other.bussinnes &&
        nameCompany == other.nameCompany;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, id.hashCode), bussinnes.hashCode), nameCompany.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Provider')
          ..add('id', id)
          ..add('bussinnes', bussinnes)
          ..add('nameCompany', nameCompany))
        .toString();
  }
}

class ProviderBuilder implements Builder<Provider, ProviderBuilder> {
  _$Provider? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _bussinnes;
  String? get bussinnes => _$this._bussinnes;
  set bussinnes(String? bussinnes) => _$this._bussinnes = bussinnes;

  String? _nameCompany;
  String? get nameCompany => _$this._nameCompany;
  set nameCompany(String? nameCompany) => _$this._nameCompany = nameCompany;

  ProviderBuilder();

  ProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _bussinnes = $v.bussinnes;
      _nameCompany = $v.nameCompany;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Provider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Provider;
  }

  @override
  void update(void Function(ProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Provider build() => _build();

  _$Provider _build() {
    final _$result = _$v ??
        new _$Provider._(
            id: id, bussinnes: bussinnes, nameCompany: nameCompany);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
