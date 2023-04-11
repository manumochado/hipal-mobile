import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'times.g.dart';

abstract class Times implements Built<Times, TimesBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get end;
  String? get start;
  DateTime? get createdAt;
  DateTime? get updatedAt;


  Times._();
  factory Times([void Function(TimesBuilder) updates]) = _$Times;

  Times copyWith(Times updates) {
    return Times((b) => b
      ..id = updates.id ?? id
      ..end = updates.end ?? end
      ..start = updates.start ?? start
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt = updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Times.serializer, this);
  }

  static Times? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Times.serializer, json);
  }

  static Serializer<Times> get serializer => _$timesSerializer;
}