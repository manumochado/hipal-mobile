// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classifiedLike.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClassifiedLike> _$classifiedLikeSerializer =
    new _$ClassifiedLikeSerializer();

class _$ClassifiedLikeSerializer
    implements StructuredSerializer<ClassifiedLike> {
  @override
  final Iterable<Type> types = const [ClassifiedLike, _$ClassifiedLike];
  @override
  final String wireName = 'ClassifiedLike';

  @override
  Iterable<Object?> serialize(Serializers serializers, ClassifiedLike object,
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
    value = object.users;
    if (value != null) {
      result
        ..add('users')
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
  ClassifiedLike deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassifiedLikeBuilder();

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
        case 'users':
          result.users = serializers.deserialize(value,
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

class _$ClassifiedLike extends ClassifiedLike {
  @override
  final String? id;
  @override
  final String? classified;
  @override
  final String? users;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$ClassifiedLike([void Function(ClassifiedLikeBuilder)? updates]) =>
      (new ClassifiedLikeBuilder()..update(updates))._build();

  _$ClassifiedLike._(
      {this.id, this.classified, this.users, this.createdAt, this.updatedAt})
      : super._();

  @override
  ClassifiedLike rebuild(void Function(ClassifiedLikeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassifiedLikeBuilder toBuilder() =>
      new ClassifiedLikeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassifiedLike &&
        id == other.id &&
        classified == other.classified &&
        users == other.users &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), classified.hashCode), users.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClassifiedLike')
          ..add('id', id)
          ..add('classified', classified)
          ..add('users', users)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ClassifiedLikeBuilder
    implements Builder<ClassifiedLike, ClassifiedLikeBuilder> {
  _$ClassifiedLike? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _classified;
  String? get classified => _$this._classified;
  set classified(String? classified) => _$this._classified = classified;

  String? _users;
  String? get users => _$this._users;
  set users(String? users) => _$this._users = users;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ClassifiedLikeBuilder();

  ClassifiedLikeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _classified = $v.classified;
      _users = $v.users;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClassifiedLike other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClassifiedLike;
  }

  @override
  void update(void Function(ClassifiedLikeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClassifiedLike build() => _build();

  _$ClassifiedLike _build() {
    final _$result = _$v ??
        new _$ClassifiedLike._(
            id: id,
            classified: classified,
            users: users,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
