// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Chat> _$chatSerializer = new _$ChatSerializer();

class _$ChatSerializer implements StructuredSerializer<Chat> {
  @override
  final Iterable<Type> types = const [Chat, _$Chat];
  @override
  final String wireName = 'Chat';

  @override
  Iterable<Object?> serialize(Serializers serializers, Chat object,
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fullname;
    if (value != null) {
      result
        ..add('fullname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
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
    value = object.is_empty;
    if (value != null) {
      result
        ..add('is_empty')
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
    value = object.messageNotView;
    if (value != null) {
      result
        ..add('messageNotView')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.messageLast;
    if (value != null) {
      result
        ..add('messageLast')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MessageLast)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(User)])));
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
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Chat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullname':
          result.fullname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'residential':
          result.residential = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_views':
          result.is_views.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_empty':
          result.is_empty.replace(serializers.deserialize(value,
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
        case 'messageNotView':
          result.messageNotView = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'messageLast':
          result.messageLast.replace(serializers.deserialize(value,
              specifiedType: const FullType(MessageLast))! as MessageLast);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(User)]))!
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
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Chat extends Chat {
  @override
  final String? id;
  @override
  final String? type;
  @override
  final String? fullname;
  @override
  final String? residential;
  @override
  final BuiltList<String>? is_views;
  @override
  final BuiltList<String>? is_empty;
  @override
  final BuiltList<String>? is_deleted;
  @override
  final int? messageNotView;
  @override
  final MessageLast? messageLast;
  @override
  final User? user;
  @override
  final BuiltList<User>? users;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;
  @override
  final String? order;

  factory _$Chat([void Function(ChatBuilder)? updates]) =>
      (new ChatBuilder()..update(updates))._build();

  _$Chat._(
      {this.id,
      this.type,
      this.fullname,
      this.residential,
      this.is_views,
      this.is_empty,
      this.is_deleted,
      this.messageNotView,
      this.messageLast,
      this.user,
      this.users,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.order})
      : super._();

  @override
  Chat rebuild(void Function(ChatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatBuilder toBuilder() => new ChatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Chat &&
        id == other.id &&
        type == other.type &&
        fullname == other.fullname &&
        residential == other.residential &&
        is_views == other.is_views &&
        is_empty == other.is_empty &&
        is_deleted == other.is_deleted &&
        messageNotView == other.messageNotView &&
        messageLast == other.messageLast &&
        user == other.user &&
        users == other.users &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v &&
        order == other.order;
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
                                                $jc(
                                                    $jc(
                                                        $jc($jc(0, id.hashCode),
                                                            type.hashCode),
                                                        fullname.hashCode),
                                                    residential.hashCode),
                                                is_views.hashCode),
                                            is_empty.hashCode),
                                        is_deleted.hashCode),
                                    messageNotView.hashCode),
                                messageLast.hashCode),
                            user.hashCode),
                        users.hashCode),
                    createdAt.hashCode),
                updatedAt.hashCode),
            v.hashCode),
        order.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Chat')
          ..add('id', id)
          ..add('type', type)
          ..add('fullname', fullname)
          ..add('residential', residential)
          ..add('is_views', is_views)
          ..add('is_empty', is_empty)
          ..add('is_deleted', is_deleted)
          ..add('messageNotView', messageNotView)
          ..add('messageLast', messageLast)
          ..add('user', user)
          ..add('users', users)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v)
          ..add('order', order))
        .toString();
  }
}

class ChatBuilder implements Builder<Chat, ChatBuilder> {
  _$Chat? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _fullname;
  String? get fullname => _$this._fullname;
  set fullname(String? fullname) => _$this._fullname = fullname;

  String? _residential;
  String? get residential => _$this._residential;
  set residential(String? residential) => _$this._residential = residential;

  ListBuilder<String>? _is_views;
  ListBuilder<String> get is_views =>
      _$this._is_views ??= new ListBuilder<String>();
  set is_views(ListBuilder<String>? is_views) => _$this._is_views = is_views;

  ListBuilder<String>? _is_empty;
  ListBuilder<String> get is_empty =>
      _$this._is_empty ??= new ListBuilder<String>();
  set is_empty(ListBuilder<String>? is_empty) => _$this._is_empty = is_empty;

  ListBuilder<String>? _is_deleted;
  ListBuilder<String> get is_deleted =>
      _$this._is_deleted ??= new ListBuilder<String>();
  set is_deleted(ListBuilder<String>? is_deleted) =>
      _$this._is_deleted = is_deleted;

  int? _messageNotView;
  int? get messageNotView => _$this._messageNotView;
  set messageNotView(int? messageNotView) =>
      _$this._messageNotView = messageNotView;

  MessageLastBuilder? _messageLast;
  MessageLastBuilder get messageLast =>
      _$this._messageLast ??= new MessageLastBuilder();
  set messageLast(MessageLastBuilder? messageLast) =>
      _$this._messageLast = messageLast;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  ListBuilder<User>? _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User>? users) => _$this._users = users;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  String? _order;
  String? get order => _$this._order;
  set order(String? order) => _$this._order = order;

  ChatBuilder();

  ChatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _fullname = $v.fullname;
      _residential = $v.residential;
      _is_views = $v.is_views?.toBuilder();
      _is_empty = $v.is_empty?.toBuilder();
      _is_deleted = $v.is_deleted?.toBuilder();
      _messageNotView = $v.messageNotView;
      _messageLast = $v.messageLast?.toBuilder();
      _user = $v.user?.toBuilder();
      _users = $v.users?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _order = $v.order;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Chat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Chat;
  }

  @override
  void update(void Function(ChatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Chat build() => _build();

  _$Chat _build() {
    _$Chat _$result;
    try {
      _$result = _$v ??
          new _$Chat._(
              id: id,
              type: type,
              fullname: fullname,
              residential: residential,
              is_views: _is_views?.build(),
              is_empty: _is_empty?.build(),
              is_deleted: _is_deleted?.build(),
              messageNotView: messageNotView,
              messageLast: _messageLast?.build(),
              user: _user?.build(),
              users: _users?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v,
              order: order);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'is_views';
        _is_views?.build();
        _$failedField = 'is_empty';
        _is_empty?.build();
        _$failedField = 'is_deleted';
        _is_deleted?.build();

        _$failedField = 'messageLast';
        _messageLast?.build();
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Chat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
