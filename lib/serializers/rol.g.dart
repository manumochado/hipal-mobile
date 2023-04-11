// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rol.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Rol> _$rolSerializer = new _$RolSerializer();

class _$RolSerializer implements StructuredSerializer<Rol> {
  @override
  final Iterable<Type> types = const [Rol, _$Rol];
  @override
  final String wireName = 'Rol';

  @override
  Iterable<Object?> serialize(Serializers serializers, Rol object,
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
    return result;
  }

  @override
  Rol deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RolBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Rol extends Rol {
  @override
  final String? id;
  @override
  final String? name;

  factory _$Rol([void Function(RolBuilder)? updates]) =>
      (new RolBuilder()..update(updates))._build();

  _$Rol._({this.id, this.name}) : super._();

  @override
  Rol rebuild(void Function(RolBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RolBuilder toBuilder() => new RolBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Rol && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Rol')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class RolBuilder implements Builder<Rol, RolBuilder> {
  _$Rol? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RolBuilder();

  RolBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Rol other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Rol;
  }

  @override
  void update(void Function(RolBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Rol build() => _build();

  _$Rol _build() {
    final _$result = _$v ?? new _$Rol._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
