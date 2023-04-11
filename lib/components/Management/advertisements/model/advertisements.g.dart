// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisements.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Advertisements> _$advertisementsSerializer =
    new _$AdvertisementsSerializer();

class _$AdvertisementsSerializer
    implements StructuredSerializer<Advertisements> {
  @override
  final Iterable<Type> types = const [Advertisements, _$Advertisements];
  @override
  final String wireName = 'Advertisements';

  @override
  Iterable<Object?> serialize(Serializers serializers, Advertisements object,
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
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.theme;
    if (value != null) {
      result
        ..add('theme')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeAds;
    if (value != null) {
      result
        ..add('typeAds')
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
  Advertisements deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdvertisementsBuilder();

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
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'theme':
          result.theme = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'typeAds':
          result.typeAds = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
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
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Advertisements extends Advertisements {
  @override
  final String? id;
  @override
  final User? users;
  @override
  final Residential? residential;
  @override
  final BuiltList<Document>? documents;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final String? theme;
  @override
  final String? link;
  @override
  final String? typeAds;
  @override
  final Image? image;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;

  factory _$Advertisements([void Function(AdvertisementsBuilder)? updates]) =>
      (new AdvertisementsBuilder()..update(updates))._build();

  _$Advertisements._(
      {this.id,
      this.users,
      this.residential,
      this.documents,
      this.description,
      this.date,
      this.theme,
      this.link,
      this.typeAds,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  Advertisements rebuild(void Function(AdvertisementsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdvertisementsBuilder toBuilder() =>
      new AdvertisementsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Advertisements &&
        id == other.id &&
        users == other.users &&
        residential == other.residential &&
        documents == other.documents &&
        description == other.description &&
        date == other.date &&
        theme == other.theme &&
        link == other.link &&
        typeAds == other.typeAds &&
        image == other.image &&
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
                                                    users.hashCode),
                                                residential.hashCode),
                                            documents.hashCode),
                                        description.hashCode),
                                    date.hashCode),
                                theme.hashCode),
                            link.hashCode),
                        typeAds.hashCode),
                    image.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Advertisements')
          ..add('id', id)
          ..add('users', users)
          ..add('residential', residential)
          ..add('documents', documents)
          ..add('description', description)
          ..add('date', date)
          ..add('theme', theme)
          ..add('link', link)
          ..add('typeAds', typeAds)
          ..add('image', image)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class AdvertisementsBuilder
    implements Builder<Advertisements, AdvertisementsBuilder> {
  _$Advertisements? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  UserBuilder? _users;
  UserBuilder get users => _$this._users ??= new UserBuilder();
  set users(UserBuilder? users) => _$this._users = users;

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

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _theme;
  String? get theme => _$this._theme;
  set theme(String? theme) => _$this._theme = theme;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _typeAds;
  String? get typeAds => _$this._typeAds;
  set typeAds(String? typeAds) => _$this._typeAds = typeAds;

  ImageBuilder? _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder? image) => _$this._image = image;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  AdvertisementsBuilder();

  AdvertisementsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _users = $v.users?.toBuilder();
      _residential = $v.residential?.toBuilder();
      _documents = $v.documents?.toBuilder();
      _description = $v.description;
      _date = $v.date;
      _theme = $v.theme;
      _link = $v.link;
      _typeAds = $v.typeAds;
      _image = $v.image?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Advertisements other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Advertisements;
  }

  @override
  void update(void Function(AdvertisementsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Advertisements build() => _build();

  _$Advertisements _build() {
    _$Advertisements _$result;
    try {
      _$result = _$v ??
          new _$Advertisements._(
              id: id,
              users: _users?.build(),
              residential: _residential?.build(),
              documents: _documents?.build(),
              description: description,
              date: date,
              theme: theme,
              link: link,
              typeAds: typeAds,
              image: _image?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
        _$failedField = 'residential';
        _residential?.build();
        _$failedField = 'documents';
        _documents?.build();

        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Advertisements', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
