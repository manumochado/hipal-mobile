// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'powerAssembly.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PowerAssembly> _$powerAssemblySerializer =
    new _$PowerAssemblySerializer();

class _$PowerAssemblySerializer implements StructuredSerializer<PowerAssembly> {
  @override
  final Iterable<Type> types = const [PowerAssembly, _$PowerAssembly];
  @override
  final String wireName = 'PowerAssembly';

  @override
  Iterable<Object?> serialize(Serializers serializers, PowerAssembly object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.identity;
    if (value != null) {
      result
        ..add('identity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assembly;
    if (value != null) {
      result
        ..add('assembly')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CurrentlyAssembly)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.cost;
    if (value != null) {
      result
        ..add('cost')
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
  PowerAssembly deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PowerAssemblyBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'identity':
          result.identity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'assembly':
          result.assembly.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CurrentlyAssembly))!
              as CurrentlyAssembly);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'cost':
          result.cost = serializers.deserialize(value,
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

class _$PowerAssembly extends PowerAssembly {
  @override
  final String? id;
  @override
  final Apartment? apartment;
  @override
  final String? name;
  @override
  final String? identity;
  @override
  final String? email;
  @override
  final CurrentlyAssembly? assembly;
  @override
  final User? user;
  @override
  final String? cost;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$PowerAssembly([void Function(PowerAssemblyBuilder)? updates]) =>
      (new PowerAssemblyBuilder()..update(updates))._build();

  _$PowerAssembly._(
      {this.id,
      this.apartment,
      this.name,
      this.identity,
      this.email,
      this.assembly,
      this.user,
      this.cost,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  PowerAssembly rebuild(void Function(PowerAssemblyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PowerAssemblyBuilder toBuilder() => new PowerAssemblyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PowerAssembly &&
        id == other.id &&
        apartment == other.apartment &&
        name == other.name &&
        identity == other.identity &&
        email == other.email &&
        assembly == other.assembly &&
        user == other.user &&
        cost == other.cost &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
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
                                    $jc($jc(0, id.hashCode),
                                        apartment.hashCode),
                                    name.hashCode),
                                identity.hashCode),
                            email.hashCode),
                        assembly.hashCode),
                    user.hashCode),
                cost.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PowerAssembly')
          ..add('id', id)
          ..add('apartment', apartment)
          ..add('name', name)
          ..add('identity', identity)
          ..add('email', email)
          ..add('assembly', assembly)
          ..add('user', user)
          ..add('cost', cost)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class PowerAssemblyBuilder
    implements Builder<PowerAssembly, PowerAssemblyBuilder> {
  _$PowerAssembly? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApartmentBuilder? _apartment;
  ApartmentBuilder get apartment =>
      _$this._apartment ??= new ApartmentBuilder();
  set apartment(ApartmentBuilder? apartment) => _$this._apartment = apartment;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _identity;
  String? get identity => _$this._identity;
  set identity(String? identity) => _$this._identity = identity;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  CurrentlyAssemblyBuilder? _assembly;
  CurrentlyAssemblyBuilder get assembly =>
      _$this._assembly ??= new CurrentlyAssemblyBuilder();
  set assembly(CurrentlyAssemblyBuilder? assembly) =>
      _$this._assembly = assembly;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  String? _cost;
  String? get cost => _$this._cost;
  set cost(String? cost) => _$this._cost = cost;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  PowerAssemblyBuilder();

  PowerAssemblyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _apartment = $v.apartment?.toBuilder();
      _name = $v.name;
      _identity = $v.identity;
      _email = $v.email;
      _assembly = $v.assembly?.toBuilder();
      _user = $v.user?.toBuilder();
      _cost = $v.cost;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PowerAssembly other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PowerAssembly;
  }

  @override
  void update(void Function(PowerAssemblyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PowerAssembly build() => _build();

  _$PowerAssembly _build() {
    _$PowerAssembly _$result;
    try {
      _$result = _$v ??
          new _$PowerAssembly._(
              id: id,
              apartment: _apartment?.build(),
              name: name,
              identity: identity,
              email: email,
              assembly: _assembly?.build(),
              user: _user?.build(),
              cost: cost,
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apartment';
        _apartment?.build();

        _$failedField = 'assembly';
        _assembly?.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PowerAssembly', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
