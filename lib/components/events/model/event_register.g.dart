// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_register.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventRegister> _$eventRegisterSerializer =
    new _$EventRegisterSerializer();

class _$EventRegisterSerializer implements StructuredSerializer<EventRegister> {
  @override
  final Iterable<Type> types = const [EventRegister, _$EventRegister];
  @override
  final String wireName = 'EventRegister';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventRegister object,
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
    value = object.event;
    if (value != null) {
      result
        ..add('event')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Events)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
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
  EventRegister deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventRegisterBuilder();

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
        case 'event':
          result.event.replace(serializers.deserialize(value,
              specifiedType: const FullType(Events))! as Events);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
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

class _$EventRegister extends EventRegister {
  @override
  final String? id;
  @override
  final Events? event;
  @override
  final User? user;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$EventRegister([void Function(EventRegisterBuilder)? updates]) =>
      (new EventRegisterBuilder()..update(updates))._build();

  _$EventRegister._(
      {this.id, this.event, this.user, this.createdAt, this.updatedAt})
      : super._();

  @override
  EventRegister rebuild(void Function(EventRegisterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventRegisterBuilder toBuilder() => new EventRegisterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventRegister &&
        id == other.id &&
        event == other.event &&
        user == other.user &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), event.hashCode), user.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventRegister')
          ..add('id', id)
          ..add('event', event)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class EventRegisterBuilder
    implements Builder<EventRegister, EventRegisterBuilder> {
  _$EventRegister? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  EventsBuilder? _event;
  EventsBuilder get event => _$this._event ??= new EventsBuilder();
  set event(EventsBuilder? event) => _$this._event = event;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  EventRegisterBuilder();

  EventRegisterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _event = $v.event?.toBuilder();
      _user = $v.user?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventRegister other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventRegister;
  }

  @override
  void update(void Function(EventRegisterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventRegister build() => _build();

  _$EventRegister _build() {
    _$EventRegister _$result;
    try {
      _$result = _$v ??
          new _$EventRegister._(
              id: id,
              event: _event?.build(),
              user: _user?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event';
        _event?.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventRegister', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
