// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Streaming> _$streamingSerializer = new _$StreamingSerializer();

class _$StreamingSerializer implements StructuredSerializer<Streaming> {
  @override
  final Iterable<Type> types = const [Streaming, _$Streaming];
  @override
  final String wireName = 'Streaming';

  @override
  Iterable<Object?> serialize(Serializers serializers, Streaming object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(User)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.topic;
    if (value != null) {
      result
        ..add('topic')
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
    value = object.apartments;
    if (value != null) {
      result
        ..add('apartments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ApartmentUser)])));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
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
    value = object.minutes;
    if (value != null) {
      result
        ..add('minutes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.host;
    if (value != null) {
      result
        ..add('host')
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
    value = object.passwordLink;
    if (value != null) {
      result
        ..add('passwordLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Streaming deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamingBuilder();

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
        case 'topic':
          result.topic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'apartments':
          result.apartments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ApartmentUser)]))!
              as BuiltList<Object?>);
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hour':
          result.hour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minutes':
          result.minutes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'passwordLink':
          result.passwordLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
      }
    }

    return result.build();
  }
}

class _$Streaming extends Streaming {
  @override
  final String? id;
  @override
  final String? topic;
  @override
  final String? description;
  @override
  final BuiltList<ApartmentUser>? apartments;
  @override
  final DateTime? date;
  @override
  final String? time;
  @override
  final String? hour;
  @override
  final String? minutes;
  @override
  final String? host;
  @override
  final String? link;
  @override
  final String? passwordLink;
  @override
  final User users;

  factory _$Streaming([void Function(StreamingBuilder)? updates]) =>
      (new StreamingBuilder()..update(updates))._build();

  _$Streaming._(
      {this.id,
      this.topic,
      this.description,
      this.apartments,
      this.date,
      this.time,
      this.hour,
      this.minutes,
      this.host,
      this.link,
      this.passwordLink,
      required this.users})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(users, r'Streaming', 'users');
  }

  @override
  Streaming rebuild(void Function(StreamingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamingBuilder toBuilder() => new StreamingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Streaming &&
        id == other.id &&
        topic == other.topic &&
        description == other.description &&
        apartments == other.apartments &&
        date == other.date &&
        time == other.time &&
        hour == other.hour &&
        minutes == other.minutes &&
        host == other.host &&
        link == other.link &&
        passwordLink == other.passwordLink &&
        users == other.users;
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
                                                topic.hashCode),
                                            description.hashCode),
                                        apartments.hashCode),
                                    date.hashCode),
                                time.hashCode),
                            hour.hashCode),
                        minutes.hashCode),
                    host.hashCode),
                link.hashCode),
            passwordLink.hashCode),
        users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Streaming')
          ..add('id', id)
          ..add('topic', topic)
          ..add('description', description)
          ..add('apartments', apartments)
          ..add('date', date)
          ..add('time', time)
          ..add('hour', hour)
          ..add('minutes', minutes)
          ..add('host', host)
          ..add('link', link)
          ..add('passwordLink', passwordLink)
          ..add('users', users))
        .toString();
  }
}

class StreamingBuilder implements Builder<Streaming, StreamingBuilder> {
  _$Streaming? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _topic;
  String? get topic => _$this._topic;
  set topic(String? topic) => _$this._topic = topic;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<ApartmentUser>? _apartments;
  ListBuilder<ApartmentUser> get apartments =>
      _$this._apartments ??= new ListBuilder<ApartmentUser>();
  set apartments(ListBuilder<ApartmentUser>? apartments) =>
      _$this._apartments = apartments;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  String? _hour;
  String? get hour => _$this._hour;
  set hour(String? hour) => _$this._hour = hour;

  String? _minutes;
  String? get minutes => _$this._minutes;
  set minutes(String? minutes) => _$this._minutes = minutes;

  String? _host;
  String? get host => _$this._host;
  set host(String? host) => _$this._host = host;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _passwordLink;
  String? get passwordLink => _$this._passwordLink;
  set passwordLink(String? passwordLink) => _$this._passwordLink = passwordLink;

  UserBuilder? _users;
  UserBuilder get users => _$this._users ??= new UserBuilder();
  set users(UserBuilder? users) => _$this._users = users;

  StreamingBuilder();

  StreamingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _topic = $v.topic;
      _description = $v.description;
      _apartments = $v.apartments?.toBuilder();
      _date = $v.date;
      _time = $v.time;
      _hour = $v.hour;
      _minutes = $v.minutes;
      _host = $v.host;
      _link = $v.link;
      _passwordLink = $v.passwordLink;
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Streaming other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Streaming;
  }

  @override
  void update(void Function(StreamingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Streaming build() => _build();

  _$Streaming _build() {
    _$Streaming _$result;
    try {
      _$result = _$v ??
          new _$Streaming._(
              id: id,
              topic: topic,
              description: description,
              apartments: _apartments?.build(),
              date: date,
              time: time,
              hour: hour,
              minutes: minutes,
              host: host,
              link: link,
              passwordLink: passwordLink,
              users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apartments';
        _apartments?.build();

        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Streaming', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
