// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directoryCollaborator.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DirectoryCollaborator> _$directoryCollaboratorSerializer =
    new _$DirectoryCollaboratorSerializer();

class _$DirectoryCollaboratorSerializer
    implements StructuredSerializer<DirectoryCollaborator> {
  @override
  final Iterable<Type> types = const [
    DirectoryCollaborator,
    _$DirectoryCollaborator
  ];
  @override
  final String wireName = 'DirectoryCollaborator';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DirectoryCollaborator object,
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
    value = object.schedule;
    if (value != null) {
      result
        ..add('schedule')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Schedule)])));
    }
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ResidentialDirectory.Residential)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stated;
    if (value != null) {
      result
        ..add('stated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
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
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
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
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ImageSerializer.Image)));
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
        ..add('v')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  DirectoryCollaborator deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DirectoryCollaboratorBuilder();

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
        case 'schedule':
          result.schedule.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Schedule)]))!
              as BuiltList<Object?>);
          break;
        case 'residential':
          result.residential.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(ResidentialDirectory.Residential))!
              as ResidentialDirectory.Residential);
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stated':
          result.stated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo':
          result.photo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ImageSerializer.Image))!
              as ImageSerializer.Image);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$DirectoryCollaborator extends DirectoryCollaborator {
  @override
  final String? id;
  @override
  final BuiltList<Schedule>? schedule;
  @override
  final ResidentialDirectory.Residential? residential;
  @override
  final String? position;
  @override
  final String? stated;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? lastName;
  @override
  final String? name;
  @override
  final ImageSerializer.Image? photo;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;

  factory _$DirectoryCollaborator(
          [void Function(DirectoryCollaboratorBuilder)? updates]) =>
      (new DirectoryCollaboratorBuilder()..update(updates))._build();

  _$DirectoryCollaborator._(
      {this.id,
      this.schedule,
      this.residential,
      this.position,
      this.stated,
      this.phone,
      this.email,
      this.lastName,
      this.name,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  DirectoryCollaborator rebuild(
          void Function(DirectoryCollaboratorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectoryCollaboratorBuilder toBuilder() =>
      new DirectoryCollaboratorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectoryCollaborator &&
        id == other.id &&
        schedule == other.schedule &&
        residential == other.residential &&
        position == other.position &&
        stated == other.stated &&
        phone == other.phone &&
        email == other.email &&
        lastName == other.lastName &&
        name == other.name &&
        photo == other.photo &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    schedule.hashCode),
                                                residential.hashCode),
                                            position.hashCode),
                                        stated.hashCode),
                                    phone.hashCode),
                                email.hashCode),
                            lastName.hashCode),
                        name.hashCode),
                    photo.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectoryCollaborator')
          ..add('id', id)
          ..add('schedule', schedule)
          ..add('residential', residential)
          ..add('position', position)
          ..add('stated', stated)
          ..add('phone', phone)
          ..add('email', email)
          ..add('lastName', lastName)
          ..add('name', name)
          ..add('photo', photo)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class DirectoryCollaboratorBuilder
    implements Builder<DirectoryCollaborator, DirectoryCollaboratorBuilder> {
  _$DirectoryCollaborator? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<Schedule>? _schedule;
  ListBuilder<Schedule> get schedule =>
      _$this._schedule ??= new ListBuilder<Schedule>();
  set schedule(ListBuilder<Schedule>? schedule) => _$this._schedule = schedule;

  ResidentialDirectory.ResidentialBuilder? _residential;
  ResidentialDirectory.ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialDirectory.ResidentialBuilder();
  set residential(ResidentialDirectory.ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _stated;
  String? get stated => _$this._stated;
  set stated(String? stated) => _$this._stated = stated;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ImageSerializer.ImageBuilder? _photo;
  ImageSerializer.ImageBuilder get photo =>
      _$this._photo ??= new ImageSerializer.ImageBuilder();
  set photo(ImageSerializer.ImageBuilder? photo) => _$this._photo = photo;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  DirectoryCollaboratorBuilder();

  DirectoryCollaboratorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _schedule = $v.schedule?.toBuilder();
      _residential = $v.residential?.toBuilder();
      _position = $v.position;
      _stated = $v.stated;
      _phone = $v.phone;
      _email = $v.email;
      _lastName = $v.lastName;
      _name = $v.name;
      _photo = $v.photo?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DirectoryCollaborator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectoryCollaborator;
  }

  @override
  void update(void Function(DirectoryCollaboratorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectoryCollaborator build() => _build();

  _$DirectoryCollaborator _build() {
    _$DirectoryCollaborator _$result;
    try {
      _$result = _$v ??
          new _$DirectoryCollaborator._(
              id: id,
              schedule: _schedule?.build(),
              residential: _residential?.build(),
              position: position,
              stated: stated,
              phone: phone,
              email: email,
              lastName: lastName,
              name: name,
              photo: _photo?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schedule';
        _schedule?.build();
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'photo';
        _photo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DirectoryCollaborator', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
