// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_emergency.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DirectoryEmergency> _$directoryEmergencySerializer =
    new _$DirectoryEmergencySerializer();

class _$DirectoryEmergencySerializer
    implements StructuredSerializer<DirectoryEmergency> {
  @override
  final Iterable<Type> types = const [DirectoryEmergency, _$DirectoryEmergency];
  @override
  final String wireName = 'DirectoryEmergency';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DirectoryEmergency object,
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
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(City)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.webPage;
    if (value != null) {
      result
        ..add('webPage')
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
  DirectoryEmergency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DirectoryEmergencyBuilder();

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
        case 'city':
          result.city.replace(serializers.deserialize(value,
              specifiedType: const FullType(City))! as City);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'webPage':
          result.webPage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
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

class _$DirectoryEmergency extends DirectoryEmergency {
  @override
  final String? id;
  @override
  final City? city;
  @override
  final bool? status;
  @override
  final String? webPage;
  @override
  final String? phone;
  @override
  final String? name;
  @override
  final Image? photo;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$DirectoryEmergency(
          [void Function(DirectoryEmergencyBuilder)? updates]) =>
      (new DirectoryEmergencyBuilder()..update(updates))._build();

  _$DirectoryEmergency._(
      {this.id,
      this.city,
      this.status,
      this.webPage,
      this.phone,
      this.name,
      this.photo,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  DirectoryEmergency rebuild(
          void Function(DirectoryEmergencyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectoryEmergencyBuilder toBuilder() =>
      new DirectoryEmergencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectoryEmergency &&
        id == other.id &&
        city == other.city &&
        status == other.status &&
        webPage == other.webPage &&
        phone == other.phone &&
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
                            $jc($jc($jc(0, id.hashCode), city.hashCode),
                                status.hashCode),
                            webPage.hashCode),
                        phone.hashCode),
                    name.hashCode),
                photo.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectoryEmergency')
          ..add('id', id)
          ..add('city', city)
          ..add('status', status)
          ..add('webPage', webPage)
          ..add('phone', phone)
          ..add('name', name)
          ..add('photo', photo)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class DirectoryEmergencyBuilder
    implements Builder<DirectoryEmergency, DirectoryEmergencyBuilder> {
  _$DirectoryEmergency? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CityBuilder? _city;
  CityBuilder get city => _$this._city ??= new CityBuilder();
  set city(CityBuilder? city) => _$this._city = city;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  String? _webPage;
  String? get webPage => _$this._webPage;
  set webPage(String? webPage) => _$this._webPage = webPage;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

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

  DirectoryEmergencyBuilder();

  DirectoryEmergencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _city = $v.city?.toBuilder();
      _status = $v.status;
      _webPage = $v.webPage;
      _phone = $v.phone;
      _name = $v.name;
      _photo = $v.photo?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DirectoryEmergency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectoryEmergency;
  }

  @override
  void update(void Function(DirectoryEmergencyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectoryEmergency build() => _build();

  _$DirectoryEmergency _build() {
    _$DirectoryEmergency _$result;
    try {
      _$result = _$v ??
          new _$DirectoryEmergency._(
              id: id,
              city: _city?.build(),
              status: status,
              webPage: webPage,
              phone: phone,
              name: name,
              photo: _photo?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'city';
        _city?.build();

        _$failedField = 'photo';
        _photo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DirectoryEmergency', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
