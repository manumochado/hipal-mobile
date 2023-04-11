// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classifiedComment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClassifiedComment> _$classifiedCommentSerializer =
    new _$ClassifiedCommentSerializer();

class _$ClassifiedCommentSerializer
    implements StructuredSerializer<ClassifiedComment> {
  @override
  final Iterable<Type> types = const [ClassifiedComment, _$ClassifiedComment];
  @override
  final String wireName = 'ClassifiedComment';

  @override
  Iterable<Object?> serialize(Serializers serializers, ClassifiedComment object,
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
    value = object.classified;
    if (value != null) {
      result
        ..add('classified')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
  ClassifiedComment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassifiedCommentBuilder();

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
        case 'classified':
          result.classified = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'message':
          result.message = serializers.deserialize(value,
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

class _$ClassifiedComment extends ClassifiedComment {
  @override
  final String? id;
  @override
  final String? classified;
  @override
  final User? user;
  @override
  final String? message;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$ClassifiedComment(
          [void Function(ClassifiedCommentBuilder)? updates]) =>
      (new ClassifiedCommentBuilder()..update(updates))._build();

  _$ClassifiedComment._(
      {this.id,
      this.classified,
      this.user,
      this.message,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  ClassifiedComment rebuild(void Function(ClassifiedCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassifiedCommentBuilder toBuilder() =>
      new ClassifiedCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassifiedComment &&
        id == other.id &&
        classified == other.classified &&
        user == other.user &&
        message == other.message &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), classified.hashCode),
                    user.hashCode),
                message.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClassifiedComment')
          ..add('id', id)
          ..add('classified', classified)
          ..add('user', user)
          ..add('message', message)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ClassifiedCommentBuilder
    implements Builder<ClassifiedComment, ClassifiedCommentBuilder> {
  _$ClassifiedComment? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _classified;
  String? get classified => _$this._classified;
  set classified(String? classified) => _$this._classified = classified;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ClassifiedCommentBuilder();

  ClassifiedCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _classified = $v.classified;
      _user = $v.user?.toBuilder();
      _message = $v.message;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClassifiedComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClassifiedComment;
  }

  @override
  void update(void Function(ClassifiedCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClassifiedComment build() => _build();

  _$ClassifiedComment _build() {
    _$ClassifiedComment _$result;
    try {
      _$result = _$v ??
          new _$ClassifiedComment._(
              id: id,
              classified: classified,
              user: _user?.build(),
              message: message,
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClassifiedComment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
