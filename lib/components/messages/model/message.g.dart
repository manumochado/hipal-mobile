// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Message> _$messageSerializer = new _$MessageSerializer();

class _$MessageSerializer implements StructuredSerializer<Message> {
  @override
  final Iterable<Type> types = const [Message, _$Message];
  @override
  final String wireName = 'Message';

  @override
  Iterable<Object?> serialize(Serializers serializers, Message object,
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
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Chat)));
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
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.isSender;
    if (value != null) {
      result
        ..add('isSender')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.messageType;
    if (value != null) {
      result
        ..add('messageType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ChatMessageType)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  Message deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageBuilder();

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
          result.chat.replace(serializers.deserialize(value,
              specifiedType: const FullType(Chat))! as Chat);
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
          result.user_send.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'isSender':
          result.isSender = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'messageType':
          result.messageType = serializers.deserialize(value,
                  specifiedType: const FullType(ChatMessageType))
              as ChatMessageType?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$Message extends Message {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? message;
  @override
  final Chat? chat;
  @override
  final BuiltList<String>? is_views;
  @override
  final BuiltList<String>? is_deleted;
  @override
  final User? user_send;
  @override
  final bool? isSender;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final ChatMessageType? messageType;
  @override
  final String? type;
  @override
  final int? v;

  factory _$Message([void Function(MessageBuilder)? updates]) =>
      (new MessageBuilder()..update(updates))._build();

  _$Message._(
      {this.id,
      this.name,
      this.message,
      this.chat,
      this.is_views,
      this.is_deleted,
      this.user_send,
      this.isSender,
      this.createdAt,
      this.updatedAt,
      this.messageType,
      this.type,
      this.v})
      : super._();

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        name == other.name &&
        message == other.message &&
        chat == other.chat &&
        is_views == other.is_views &&
        is_deleted == other.is_deleted &&
        user_send == other.user_send &&
        isSender == other.isSender &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        messageType == other.messageType &&
        type == other.type &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    name.hashCode),
                                                message.hashCode),
                                            chat.hashCode),
                                        is_views.hashCode),
                                    is_deleted.hashCode),
                                user_send.hashCode),
                            isSender.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                messageType.hashCode),
            type.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Message')
          ..add('id', id)
          ..add('name', name)
          ..add('message', message)
          ..add('chat', chat)
          ..add('is_views', is_views)
          ..add('is_deleted', is_deleted)
          ..add('user_send', user_send)
          ..add('isSender', isSender)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('messageType', messageType)
          ..add('type', type)
          ..add('v', v))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ChatBuilder? _chat;
  ChatBuilder get chat => _$this._chat ??= new ChatBuilder();
  set chat(ChatBuilder? chat) => _$this._chat = chat;

  ListBuilder<String>? _is_views;
  ListBuilder<String> get is_views =>
      _$this._is_views ??= new ListBuilder<String>();
  set is_views(ListBuilder<String>? is_views) => _$this._is_views = is_views;

  ListBuilder<String>? _is_deleted;
  ListBuilder<String> get is_deleted =>
      _$this._is_deleted ??= new ListBuilder<String>();
  set is_deleted(ListBuilder<String>? is_deleted) =>
      _$this._is_deleted = is_deleted;

  UserBuilder? _user_send;
  UserBuilder get user_send => _$this._user_send ??= new UserBuilder();
  set user_send(UserBuilder? user_send) => _$this._user_send = user_send;

  bool? _isSender;
  bool? get isSender => _$this._isSender;
  set isSender(bool? isSender) => _$this._isSender = isSender;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ChatMessageType? _messageType;
  ChatMessageType? get messageType => _$this._messageType;
  set messageType(ChatMessageType? messageType) =>
      _$this._messageType = messageType;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  MessageBuilder();

  MessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _message = $v.message;
      _chat = $v.chat?.toBuilder();
      _is_views = $v.is_views?.toBuilder();
      _is_deleted = $v.is_deleted?.toBuilder();
      _user_send = $v.user_send?.toBuilder();
      _isSender = $v.isSender;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _messageType = $v.messageType;
      _type = $v.type;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Message build() => _build();

  _$Message _build() {
    _$Message _$result;
    try {
      _$result = _$v ??
          new _$Message._(
              id: id,
              name: name,
              message: message,
              chat: _chat?.build(),
              is_views: _is_views?.build(),
              is_deleted: _is_deleted?.build(),
              user_send: _user_send?.build(),
              isSender: isSender,
              createdAt: createdAt,
              updatedAt: updatedAt,
              messageType: messageType,
              type: type,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chat';
        _chat?.build();
        _$failedField = 'is_views';
        _is_views?.build();
        _$failedField = 'is_deleted';
        _is_deleted?.build();
        _$failedField = 'user_send';
        _user_send?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Message', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
