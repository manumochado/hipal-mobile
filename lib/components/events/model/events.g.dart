// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Events> _$eventsSerializer = new _$EventsSerializer();

class _$EventsSerializer implements StructuredSerializer<Events> {
  @override
  final Iterable<Type> types = const [Events, _$Events];
  @override
  final String wireName = 'Events';

  @override
  Iterable<Object?> serialize(Serializers serializers, Events object,
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
    value = object.phoneOrganizer;
    if (value != null) {
      result
        ..add('phoneOrganizer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameOrganizer;
    if (value != null) {
      result
        ..add('nameOrganizer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageOrganizer;
    if (value != null) {
      result
        ..add('imageOrganizer')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Image)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hour;
    if (value != null) {
      result
        ..add('hour')
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
    value = object.site;
    if (value != null) {
      result
        ..add('site')
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
    value = object.stated;
    if (value != null) {
      result
        ..add('stated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageEvent;
    if (value != null) {
      result
        ..add('imageEvent')
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
  Events deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventsBuilder();

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
        case 'phoneOrganizer':
          result.phoneOrganizer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameOrganizer':
          result.nameOrganizer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageOrganizer':
          result.imageOrganizer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image))! as Image);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hour':
          result.hour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'site':
          result.site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stated':
          result.stated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageEvent':
          result.imageEvent.replace(serializers.deserialize(value,
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

class _$Events extends Events {
  @override
  final String? id;
  @override
  final Residential? residential;
  @override
  final String? phoneOrganizer;
  @override
  final String? nameOrganizer;
  @override
  final Image? imageOrganizer;
  @override
  final String? description;
  @override
  final String? hour;
  @override
  final DateTime? date;
  @override
  final String? site;
  @override
  final String? name;
  @override
  final String? stated;
  @override
  final Image? imageEvent;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$Events([void Function(EventsBuilder)? updates]) =>
      (new EventsBuilder()..update(updates))._build();

  _$Events._(
      {this.id,
      this.residential,
      this.phoneOrganizer,
      this.nameOrganizer,
      this.imageOrganizer,
      this.description,
      this.hour,
      this.date,
      this.site,
      this.name,
      this.stated,
      this.imageEvent,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  Events rebuild(void Function(EventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsBuilder toBuilder() => new EventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Events &&
        id == other.id &&
        residential == other.residential &&
        phoneOrganizer == other.phoneOrganizer &&
        nameOrganizer == other.nameOrganizer &&
        imageOrganizer == other.imageOrganizer &&
        description == other.description &&
        hour == other.hour &&
        date == other.date &&
        site == other.site &&
        name == other.name &&
        stated == other.stated &&
        imageEvent == other.imageEvent &&
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
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, id.hashCode),
                                                        residential.hashCode),
                                                    phoneOrganizer.hashCode),
                                                nameOrganizer.hashCode),
                                            imageOrganizer.hashCode),
                                        description.hashCode),
                                    hour.hashCode),
                                date.hashCode),
                            site.hashCode),
                        name.hashCode),
                    stated.hashCode),
                imageEvent.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Events')
          ..add('id', id)
          ..add('residential', residential)
          ..add('phoneOrganizer', phoneOrganizer)
          ..add('nameOrganizer', nameOrganizer)
          ..add('imageOrganizer', imageOrganizer)
          ..add('description', description)
          ..add('hour', hour)
          ..add('date', date)
          ..add('site', site)
          ..add('name', name)
          ..add('stated', stated)
          ..add('imageEvent', imageEvent)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class EventsBuilder implements Builder<Events, EventsBuilder> {
  _$Events? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResidentialBuilder? _residential;
  ResidentialBuilder get residential =>
      _$this._residential ??= new ResidentialBuilder();
  set residential(ResidentialBuilder? residential) =>
      _$this._residential = residential;

  String? _phoneOrganizer;
  String? get phoneOrganizer => _$this._phoneOrganizer;
  set phoneOrganizer(String? phoneOrganizer) =>
      _$this._phoneOrganizer = phoneOrganizer;

  String? _nameOrganizer;
  String? get nameOrganizer => _$this._nameOrganizer;
  set nameOrganizer(String? nameOrganizer) =>
      _$this._nameOrganizer = nameOrganizer;

  ImageBuilder? _imageOrganizer;
  ImageBuilder get imageOrganizer =>
      _$this._imageOrganizer ??= new ImageBuilder();
  set imageOrganizer(ImageBuilder? imageOrganizer) =>
      _$this._imageOrganizer = imageOrganizer;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _hour;
  String? get hour => _$this._hour;
  set hour(String? hour) => _$this._hour = hour;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _site;
  String? get site => _$this._site;
  set site(String? site) => _$this._site = site;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _stated;
  String? get stated => _$this._stated;
  set stated(String? stated) => _$this._stated = stated;

  ImageBuilder? _imageEvent;
  ImageBuilder get imageEvent => _$this._imageEvent ??= new ImageBuilder();
  set imageEvent(ImageBuilder? imageEvent) => _$this._imageEvent = imageEvent;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  EventsBuilder();

  EventsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _residential = $v.residential?.toBuilder();
      _phoneOrganizer = $v.phoneOrganizer;
      _nameOrganizer = $v.nameOrganizer;
      _imageOrganizer = $v.imageOrganizer?.toBuilder();
      _description = $v.description;
      _hour = $v.hour;
      _date = $v.date;
      _site = $v.site;
      _name = $v.name;
      _stated = $v.stated;
      _imageEvent = $v.imageEvent?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Events other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Events;
  }

  @override
  void update(void Function(EventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Events build() => _build();

  _$Events _build() {
    _$Events _$result;
    try {
      _$result = _$v ??
          new _$Events._(
              id: id,
              residential: _residential?.build(),
              phoneOrganizer: phoneOrganizer,
              nameOrganizer: nameOrganizer,
              imageOrganizer: _imageOrganizer?.build(),
              description: description,
              hour: hour,
              date: date,
              site: site,
              name: name,
              stated: stated,
              imageEvent: _imageEvent?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residential';
        _residential?.build();

        _$failedField = 'imageOrganizer';
        _imageOrganizer?.build();

        _$failedField = 'imageEvent';
        _imageEvent?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Events', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
