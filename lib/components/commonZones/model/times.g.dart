// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'times.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Times> _$timesSerializer = new _$TimesSerializer();

class _$TimesSerializer implements StructuredSerializer<Times> {
  @override
  final Iterable<Type> types = const [Times, _$Times];
  @override
  final String wireName = 'Times';

  @override
  Iterable<Object?> serialize(Serializers serializers, Times object,
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
    value = object.end;
    if (value != null) {
      result
        ..add('end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.start;
    if (value != null) {
      result
        ..add('start')
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
  Times deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TimesBuilder();

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
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start':
          result.start = serializers.deserialize(value,
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

class _$Times extends Times {
  @override
  final String? id;
  @override
  final String? end;
  @override
  final String? start;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$Times([void Function(TimesBuilder)? updates]) =>
      (new TimesBuilder()..update(updates))._build();

  _$Times._({this.id, this.end, this.start, this.createdAt, this.updatedAt})
      : super._();

  @override
  Times rebuild(void Function(TimesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimesBuilder toBuilder() => new TimesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Times &&
        id == other.id &&
        end == other.end &&
        start == other.start &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), end.hashCode), start.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Times')
          ..add('id', id)
          ..add('end', end)
          ..add('start', start)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class TimesBuilder implements Builder<Times, TimesBuilder> {
  _$Times? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _end;
  String? get end => _$this._end;
  set end(String? end) => _$this._end = end;

  String? _start;
  String? get start => _$this._start;
  set start(String? start) => _$this._start = start;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  TimesBuilder();

  TimesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _end = $v.end;
      _start = $v.start;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Times other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Times;
  }

  @override
  void update(void Function(TimesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Times build() => _build();

  _$Times _build() {
    final _$result = _$v ??
        new _$Times._(
            id: id,
            end: end,
            start: start,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
