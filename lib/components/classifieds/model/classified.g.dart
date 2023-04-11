part of 'classified.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Classified> _$classifiedSerializer = new _$ClassifiedSerializer();

class _$ClassifiedSerializer implements StructuredSerializer<Classified> {
  @override
  final Iterable<Type> types = const [Classified, _$Classified];
  @override
  final String wireName = 'Classified';

  @override
  Iterable<Object?> serialize(Serializers serializers, Classified object,
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
    value = object.totalScore;
    if (value != null) {
      result
        ..add('totalScore')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.publish;
    if (value != null) {
      result
        ..add('publish')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whatsappSeller;
    if (value != null) {
      result
        ..add('whatsappSeller')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailSeller;
    if (value != null) {
      result
        ..add('emailSeller')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameSeller;
    if (value != null) {
      result
        ..add('nameSeller')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }

    

    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Image)])));
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
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birthDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Classified deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassifiedBuilder();

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
        case 'totalScore':
          result.totalScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publish':
          result.publish = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whatsappSeller':
          result.whatsappSeller = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'emailSeller':
          result.emailSeller = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameSeller':
          result.nameSeller = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;

        

        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Image)]))!
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
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Classified extends Classified {
  @override
  final String? id;
  @override
  final int? totalScore;
  @override
  final String? user;
  @override
  final String? publish;
  @override
  final String? state;
  @override
  final String? whatsappSeller;
  @override
  final String? emailSeller;
  @override
  final String? nameSeller;
  @override
  final String? description;
  @override
  final Map? residential;
  @override
  final int? price;
  @override
  final String? title;
  @override
  final String? link;
  
  @override
  final BuiltList<Image>? images;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;
  @override
  final DateTime? birthDate;

  factory _$Classified([void Function(ClassifiedBuilder)? updates]) =>
      (new ClassifiedBuilder()..update(updates))._build();

  _$Classified._(
      {this.id,
      this.totalScore,
      this.user,
      this.publish,
      this.state,
      this.whatsappSeller,
      this.emailSeller,
      this.nameSeller,
      this.description,
      this.residential,
      this.price,
      this.title,
      this.link,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.birthDate})
      : super._();

  @override
  Classified rebuild(void Function(ClassifiedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassifiedBuilder toBuilder() => new ClassifiedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Classified &&
        id == other.id &&
        totalScore == other.totalScore &&
        user == other.user &&
        publish == other.publish &&
        state == other.state &&
        whatsappSeller == other.whatsappSeller &&
        emailSeller == other.emailSeller &&
        nameSeller == other.nameSeller &&
        description == other.description &&
        residential == other.residential &&
        price == other.price &&
        title == other.title &&
        link == other.link &&
        images == other.images &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v &&
        birthDate == other.birthDate;
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
                                                                    totalScore
                                                                        .hashCode),
                                                                user.hashCode),
                                                            publish.hashCode),
                                                        state.hashCode),
                                                    whatsappSeller.hashCode),
                                                emailSeller.hashCode),
                                            nameSeller.hashCode),
                                        description.hashCode),
                                    residential.hashCode),
                                    price.hashCode),
                                title.hashCode),
                            link.hashCode),
                        images.hashCode),
                    createdAt.hashCode),
                updatedAt.hashCode),
            v.hashCode),
        birthDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Classified')
          ..add('id', id)
          ..add('totalScore', totalScore)
          ..add('user', user)
          ..add('publish', publish)
          ..add('state', state)
          ..add('whatsappSeller', whatsappSeller)
          ..add('emailSeller', emailSeller)
          ..add('nameSeller', nameSeller)
          ..add('description', description)
          ..add('residential', residential)
          ..add('price', price)
          ..add('title', title)
          ..add('link', link)
          ..add('images', images)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v)
          ..add('birthDate', birthDate))
        .toString();
  }


}

class ClassifiedBuilder implements Builder<Classified, ClassifiedBuilder> {
  _$Classified? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _totalScore;
  int? get totalScore => _$this._totalScore;
  set totalScore(int? totalScore) => _$this._totalScore = totalScore;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  String? _publish;
  String? get publish => _$this._publish;
  set publish(String? publish) => _$this._publish = publish;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _whatsappSeller;
  String? get whatsappSeller => _$this._whatsappSeller;
  set whatsappSeller(String? whatsappSeller) =>
      _$this._whatsappSeller = whatsappSeller;

  String? _emailSeller;
  String? get emailSeller => _$this._emailSeller;
  set emailSeller(String? emailSeller) => _$this._emailSeller = emailSeller;

  String? _nameSeller;
  String? get nameSeller => _$this._nameSeller;
  set nameSeller(String? nameSeller) => _$this._nameSeller = nameSeller;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  Map? _residential;
  Map? get residential => _$this._residential;
  set residential(Map? residential) => _$this._residential = residential;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  ListBuilder<Image>? _images;
  ListBuilder<Image> get images => _$this._images ??= new ListBuilder<Image>();
  set images(ListBuilder<Image>? images) => _$this._images = images;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  ClassifiedBuilder();

  ClassifiedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _totalScore = $v.totalScore;
      _user = $v.user;
      _publish = $v.publish;
      _state = $v.state;
      _whatsappSeller = $v.whatsappSeller;
      _emailSeller = $v.emailSeller;
      _nameSeller = $v.nameSeller;
      _description = $v.description;
      _residential = $v.residential;
      _price = $v.price;
      _title = $v.title;
      _link = $v.link;
      _images = $v.images?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _v = $v.v;
      _birthDate = $v.birthDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Classified other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Classified;
  }

  @override
  void update(void Function(ClassifiedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Classified build() => _build();

  _$Classified _build() {
    _$Classified _$result;
    try {
      _$result = _$v ??
          new _$Classified._(
              id: id,
              totalScore: totalScore,
              user: user,
              publish: publish,
              state: state,
              whatsappSeller: whatsappSeller,
              emailSeller: emailSeller,
              nameSeller: nameSeller,
              description: description,
              residential: residential,
              price: price,
              title: title,
              link: link,
              images: _images?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v,
              birthDate: birthDate);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Classified', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_fil