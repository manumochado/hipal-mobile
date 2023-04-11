// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Management> _$managementSerializer = new _$ManagementSerializer();

class _$ManagementSerializer implements StructuredSerializer<Management> {
  @override
  final Iterable<Type> types = const [Management, _$Management];
  @override
  final String wireName = 'Management';

  @override
  Iterable<Object?> serialize(Serializers serializers, Management object,
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
            specifiedType: const FullType(Residential)));
    }
    value = object.documents;
    if (value != null) {
      result
        ..add('documents')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Document)])));
    }
    value = object.mayoralPermit;
    if (value != null) {
      result
        ..add('mayoralPermit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameBussiness;
    if (value != null) {
      result
        ..add('nameBussiness')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.termCharge;
    if (value != null) {
      result
        ..add('termCharge')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.rut;
    if (value != null) {
      result
        ..add('rut')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.registrationProfession;
    if (value != null) {
      result
        ..add('registrationProfession')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profession;
    if (value != null) {
      result
        ..add('profession')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profile;
    if (value != null) {
      result
        ..add('profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateBirth;
    if (value != null) {
      result
        ..add('dateBirth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
    value = object.lastNames;
    if (value != null) {
      result
        ..add('lastNames')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.names;
    if (value != null) {
      result
        ..add('names')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
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
  Management deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ManagementBuilder();

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
          result.residential.replace(serializers.deserialize(value,
              specifiedType: const FullType(Residential))! as Residential);
          break;
        case 'documents':
          result.documents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Document)]))!
              as BuiltList<Object?>);
          break;
        case 'mayoralPermit':
          result.mayoralPermit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameBussiness':
          result.nameBussiness = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'termCharge':
          result.termCharge = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'rut':
          result.rut = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'registrationProfession':
          result.registrationProfession = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profession':
          result.profession = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profile':
          result.profile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateBirth':
          result.dateBirth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastNames':
          result.lastNames = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'names':
          result.names = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
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

class _$Management extends Management {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final BuiltList<Document>? documents;
  @override
  final String? mayoralPermit;
  @override
  final String? nameBussiness;
  @override
  final DateTime? termCharge;
  @override
  final String? rut;
  @override
  final String? registrationProfession;
  @override
  final String? profession;
  @override
  final String? profile;
  @override
  final DateTime? dateBirth;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? lastNames;
  @override
  final String? names;
  @override
  final Image? image;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;

  factory _$Management([void Function(ManagementBuilder)? updates]) =>
      (new ManagementBuilder()..update(updates))._build();

  _$Management._(
      {this.id,
      this.residential,
      this.documents,
      this.mayoralPermit,
      this.nameBussiness,
      this.termCharge,
      this.rut,
      this.registrationProfession,
      this.profession,
      this.profile,
      this.dateBirth,
      this.phone,
      this.email,
      this.lastNames,
      this.names,
      this.image,
      this.updatedAt,
      this.v})
      : super._();

  @override
  Management rebuild(void Function(ManagementBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManagementBuilder toBuilder() => new ManagementBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Management &&
        id == other.id &&
        residential == other.residential &&
        documents == other.documents &&
        mayoralPermit == other.mayoralPermit &&
        nameBussiness == other.nameBussiness &&
        termCharge == other.termCharge &&
        rut == other.rut &&
        registrationProfession == other.registrationProfession &&
        profession == other.profession &&
        profile == other.profile &&
        dateBirth == other.dateBirth &&
        phone == other.phone &&
        email == other.email &&
        lastNames == other.lastNames &&
        names == other.names &&
        image == other.image &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        residential
                                                                            .hashCode),
                                                                    documents
                                                                        .hashCode),
                                                                mayoralPermit
                                                                    .hashCode),
                                                            nameBussiness
                                                                .hashCode),
                                                        termCharge.hashCode),
                                                    rut.hashCode),
                                                registrationProfession
                                                    .hashCode),
                                            profession.hashCode),
                                        profile.hashCode),
                                    dateBirth.hashCode),
                                phone.hashCode),
                            email.hashCode),
                        lastNames.hashCode),
                    names.hashCode),
                image.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Management')
          ..add('id', id)
          ..add('residential', residential)
          ..add('documents', documents)
          ..add('mayoralPermit', mayoralPermit)
          ..add('nameBussiness', nameBussiness)
          ..add('termCharge', termCharge)
          ..add('rut', rut)
          ..add('registrationProfession', registrationProfession)
          ..add('profession', profession)
          ..add('profile', profile)
          ..add('dateBirth', dateBirth)
          ..add('phone', phone)
          ..add('email', email)
          ..add('lastNames', lastNames)
          ..add('names', names)
          ..add('image', image)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class ManagementBuilder implements Builder<Management, ManagementBuilder> {
  _$Management? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  ListBuilder<Document>? _documents;
  ListBuilder<Document> get documents =>
      _$this._documents ??= new ListBuilder<Document>();
  set documents(ListBuilder<Document>? documents) =>
      _$this._documents = documents;

  String? _mayoralPermit;
  String? get mayoralPermit => _$this._mayoralPermit;
  set mayoralPermit(String? mayoralPermit) =>
      _$this._mayoralPermit = mayoralPermit;

  String? _nameBussiness;
  String? get nameBussiness => _$this._nameBussiness;
  set nameBussiness(String? nameBussiness) =>
      _$this._nameBussiness = nameBussiness;

  DateTime? _termCharge;
  DateTime? get termCharge => _$this._termCharge;
  set termCharge(DateTime? termCharge) => _$this._termCharge = termCharge;

  String? _rut;
  String? get rut => _$this._rut;
  set rut(String? rut) => _$this._rut = rut;

  String? _registrationProfession;
  String? get registrationProfession => _$this._registrationProfession;
  set registrationProfession(String? registrationProfession) =>
      _$this._registrationProfession = registrationProfession;

  String? _profession;
  String? get profession => _$this._profession;
  set profession(String? profession) => _$this._profession = profession;

  String? _profile;
  String? get profile => _$this._profile;
  set profile(String? profile) => _$this._profile = profile;

  DateTime? _dateBirth;
  DateTime? get dateBirth => _$this._dateBirth;
  set dateBirth(DateTime? dateBirth) => _$this._dateBirth = dateBirth;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _lastNames;
  String? get lastNames => _$this._lastNames;
  set lastNames(String? lastNames) => _$this._lastNames = lastNames;

  String? _names;
  String? get names => _$this._names;
  set names(String? names) => _$this._names = names;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  ManagementBuilder();

  ManagementBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _documents = $v.documents?.toBuilder();
      _mayoralPermit = $v.mayoralPermit;
      _nameBussiness = $v.nameBussiness;
      _termCharge = $v.termCharge;
      _rut = $v.rut;
      _registrationProfession = $v.registrationProfession;
      _profession = $v.profession;
      _profile = $v.profile;
      _dateBirth = $v.dateBirth;
      _phone = $v.phone;
      _email = $v.email;
      _lastNames = $v.lastNames;
      _names = $v.names;
      _image = $v.image?.toBuilder();
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Management other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Management;
  }

  @override
  void update(void Function(ManagementBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Management build() => _build();

  _$Management _build() {
    _$Management _$result;
    try {
      _$result = _$v ??
          new _$Management._(
              id: id,
              residential: _residential?.build(),
              documents: _documents?.build(),
              mayoralPermit: mayoralPermit,
              nameBussiness: nameBussiness,
              termCharge: termCharge,
              rut: rut,
              registrationProfession: registrationProfession,
              profession: profession,
              profile: profile,
              dateBirth: dateBirth,
              phone: phone,
              email: email,
              lastNames: lastNames,
              names: names,
              image: _image?.build(),
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();
        _$failedField = 'documents';
        _documents?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Management', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
