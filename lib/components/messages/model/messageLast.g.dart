// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messageLast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessageLast> _$messageLastSerializer = new _$MessageLastSerializer();

class _$MessageLastSerializer implements StructuredSerializer<MessageLast> {
  @override
  final Iterable<Type> types = const [MessageLast, _$MessageLast];
  @override
  final String wireName = 'MessageLast';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessageLast object,
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
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chat;
    if (value != null) {
      result
        ..add('chat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_views;
    if (value != null) {
      result
        ..add('is_views')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.is_deleted;
    if (value != null) {
      result
        ..add('is_deleted')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.user_send;
    if (value != null) {
      result
        ..add('user_send')
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
        ..add('__v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MessageLast deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageLastBuilder();

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
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chat':
          result.chat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_views':
          result.is_views.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_deleted':
          result.is_deleted.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'user_send':
          result.user_send = serializers.deserialize(value,
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
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$MessageLast extends MessageLast {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? message;
  @override
  final String? chat;
  @override
  final BuiltList<String>? is_views;
  @override
  final BuiltList<String>? is_deleted;
  @override
  final String? user_send;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;

  factory _$MessageLast([void Function(MessageLastBuilder)? updates]) =>
      (new MessageLastBuilder()..update(updates))._build();

  _$MessageLast._(
      {this.id,
      this.name,
      this.message,
      this.chat,
      this.is_views,
      this.is_deleted,
      this.user_send,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  MessageLast rebuild(void Function(MessageLastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageLastBuilder toBuilder() => new MessageLastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageLast &&
        id == other.id &&
        name == other.name &&
        message == other.message &&
        chat == other.chat &&
        is_views == other.is_views &&
        is_deleted == other.is_deleted &&
        user_send == other.user_send &&
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
                                $jc($jc($jc(0, id.hashCode), name.hashCode),
                                    message.hashCode),
                                chat.hashCode),
                            is_views.hashCode),
                        is_deleted.hashCode),
                    user_send.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageLast')
          ..add('id', id)
          ..add('name', name)
          ..add('message', message)
          ..add('chat', chat)
          ..add('is_views', is_views)
          ..add('is_deleted', is_deleted)
          ..add('user_send', user_send)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class MessageLastBuilder implements Builder<MessageLast, MessageLastBuilder> {
  _$MessageLast? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _chat;
  String? get chat => _$this._chat;
  set chat(String? chat) => _$this._chat = chat;

  ListBuilder<String>? _is_views;
  ListBuilder<String> get is_views =>
      _$this._is_views ??= new ListBuilder<String>();
  set is_views(ListBuilder<String>? is_views) => _$this._is_views = is_views;

  ListBuilder<String>? _is_deleted;
  ListBuilder<String> get is_deleted =>
      _$this._is_deleted ??= new ListBuilder<String>();
  set is_deleted(ListBuilder<String>? is_deleted) =>
      _$this._is_deleted = is_deleted;

  String? _user_send;
  String? get user_send => _$this._user_send;
  set user_send(String? user_send) => _$this._user_send = user_send;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  MessageLastBuilder();

  MessageLastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _message = $v.message;
      _chat = $v.chat;
      _is_views = $v.is_views?.toBuilder();
      _is_deleted = $v.is_deleted?.toBuilder();
      _user_send = $v.user_send;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageLast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageLast;
  }

  @override
  void update(void Function(MessageLastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageLast build() => _build();

  _$MessageLast _build() {
    _$MessageLast _$result;
    try {
      _$result = _$v ??
          new _$MessageLast._(
              id: id,
              name: name,
              message: message,
              chat: chat,
              is_views: _is_views?.build(),
              is_deleted: _is_deleted?.build(),
              user_send: user_send,
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'is_views';
        _is_views?.build();
        _$failedField = 'is_deleted';
        _is_deleted?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MessageLast', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
