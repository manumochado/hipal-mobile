// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentAssembly.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentAssembly> _$commentAssemblySerializer =
    new _$CommentAssemblySerializer();

class _$CommentAssemblySerializer
    implements StructuredSerializer<CommentAssembly> {
  @override
  final Iterable<Type> types = const [CommentAssembly, _$CommentAssembly];
  @override
  final String wireName = 'CommentAssembly';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentAssembly object,
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
    value = object.apartment;
    if (value != null) {
      result
        ..add('apartment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Apartment)));
    }
    value = object.assembly;
    if (value != null) {
      result
        ..add('assembly')
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
  CommentAssembly deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentAssemblyBuilder();

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
        case 'apartment':
          result.apartment.replace(serializers.deserialize(value,
              specifiedType: const FullType(Apartment))! as Apartment);
          break;
        case 'assembly':
          result.assembly = serializers.deserialize(value,
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

class _$CommentAssembly extends CommentAssembly {
  @override
  final String? id;
  @override
  final Apartment? apartment;
  @override
  final String? assembly;
  @override
  final User? user;
  @override
  final String? message;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$CommentAssembly([void Function(CommentAssemblyBuilder)? updates]) =>
      (new CommentAssemblyBuilder()..update(updates))._build();

  _$CommentAssembly._(
      {this.id,
      this.apartment,
      this.assembly,
      this.user,
      this.message,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  CommentAssembly rebuild(void Function(CommentAssemblyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentAssemblyBuilder toBuilder() =>
      new CommentAssemblyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentAssembly &&
        id == other.id &&
        apartment == other.apartment &&
        assembly == other.assembly &&
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
                $jc(
                    $jc($jc($jc(0, id.hashCode), apartment.hashCode),
                        assembly.hashCode),
                    user.hashCode),
                message.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentAssembly')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('assembly', assembly)
          ..add('user', user)
          ..add('message', message)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CommentAssemblyBuilder
    implements Builder<CommentAssembly, CommentAssemblyBuilder> {
  _$CommentAssembly? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApartmentBuilder? _apartment;
  ApartmentBuilder get apartment =>
      _$this._apartment ??= new ApartmentBuilder();
  set apartment(ApartmentBuilder? apartment) => _$this._apartment = apartment;

  String? _assembly;
  String? get assembly => _$this._assembly;
  set assembly(String? assembly) => _$this._assembly = assembly;

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

  CommentAssemblyBuilder();

  CommentAssemblyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment?.toBuilder();
      _assembly = $v.assembly;
      _user = $v.user?.toBuilder();
      _message = $v.message;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentAssembly other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentAssembly;
  }

  @override
  void update(void Function(CommentAssemblyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentAssembly build() => _build();

  _$CommentAssembly _build() {
    _$CommentAssembly _$result;
    try {
      _$result = _$v ??
          new _$CommentAssembly._(
              id: id,
              apartment: _apartment?.build(),
              assembly: assembly,
              user: _user?.build(),
              message: message,
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apartment';
        _apartment?.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CommentAssembly', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
