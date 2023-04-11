// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_residential.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DirectoryResidential> _$directoryResidentialSerializer =
    new _$DirectoryResidentialSerializer();

class _$DirectoryResidentialSerializer
    implements StructuredSerializer<DirectoryResidential> {
  @override
  final Iterable<Type> types = const [
    DirectoryResidential,
    _$DirectoryResidential
  ];
  @override
  final String wireName = 'DirectoryResidential';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DirectoryResidential object,
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
    value = object.residential;
    if (value != null) {
      result
        ..add('residential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameCompany;
    if (value != null) {
      result
        ..add('nameCompany')
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
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
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
  DirectoryResidential deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DirectoryResidentialBuilder();

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
        case 'residential':
          result.residential = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameCompany':
          result.nameCompany = serializers.deserialize(value,
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
              specifiedType: const FullType(Image))! as Image);
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

class _$DirectoryResidential extends DirectoryResidential {
  @override
  final String? id;
  @override
  final String? residential;
  @override
  final String? position;
  @override
  final String? nameCompany;
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
  final Image? photo;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$DirectoryResidential(
          [void Function(DirectoryResidentialBuilder)? updates]) =>
      (new DirectoryResidentialBuilder()..update(updates))._build();

  _$DirectoryResidential._(
      {this.id,
      this.residential,
      this.position,
      this.nameCompany,
      this.stated,
      this.phone,
      this.email,
      this.lastName,
      this.name,
      this.photo,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  DirectoryResidential rebuild(
          void Function(DirectoryResidentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectoryResidentialBuilder toBuilder() =>
      new DirectoryResidentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectoryResidential &&
        id == other.id &&
        residential == other.residential &&
        position == other.position &&
        nameCompany == other.nameCompany &&
        stated == other.stated &&
        phone == other.phone &&
        email == other.email &&
        lastName == other.lastName &&
        name == other.name &&
        photo == other.photo &&
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
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                residential.hashCode),
                                            position.hashCode),
                                        nameCompany.hashCode),
                                    stated.hashCode),
                                phone.hashCode),
                            email.hashCode),
                        lastName.hashCode),
                    name.hashCode),
                photo.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectoryResidential')
          ..add('id', id)
          ..add('residential', residential)
          ..add('position', position)
          ..add('nameCompany', nameCompany)
          ..add('stated', stated)
          ..add('phone', phone)
          ..add('email', email)
          ..add('lastName', lastName)
          ..add('name', name)
          ..add('photo', photo)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class DirectoryResidentialBuilder
    implements Builder<DirectoryResidential, DirectoryResidentialBuilder> {
  _$DirectoryResidential? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _residential;
  String? get residential => _$this._residential;
  set residential(String? residential) => _$this._residential = residential;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _nameCompany;
  String? get nameCompany => _$this._nameCompany;
  set nameCompany(String? nameCompany) => _$this._nameCompany = nameCompany;

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

  ImageBuilder? _photo;
  ImageBuilder get photo => _$this._photo ??= new ImageBuilder();
  set photo(ImageBuilder? photo) => _$this._photo = photo;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DirectoryResidentialBuilder();

  DirectoryResidentialBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential;
      _position = $v.position;
      _nameCompany = $v.nameCompany;
      _stated = $v.stated;
      _phone = $v.phone;
      _email = $v.email;
      _lastName = $v.lastName;
      _name = $v.name;
      _photo = $v.photo?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DirectoryResidential other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectoryResidential;
  }

  @override
  void update(void Function(DirectoryResidentialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectoryResidential build() => _build();

  _$DirectoryResidential _build() {
    _$DirectoryResidential _$result;
    try {
      _$result = _$v ??
          new _$DirectoryResidential._(
              id: id,
              residential: residential,
              position: position,
              nameCompany: nameCompany,
              stated: stated,
              phone: phone,
              email: email,
              lastName: lastName,
              name: name,
              photo: _photo?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photo';
        _photo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DirectoryResidential', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
