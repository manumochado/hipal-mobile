import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/commonZones/model/times.dart';
import 'package:hipal/serializers/serializers.dart';

part 'schedule.g.dart';

abstract class Schedule implements Built<Schedule, ScheduleBuilder> {
  String? get id;
  BuiltList<Times>? get times;
  String? get day;

  Schedule._();
  factory Schedule([void Function(ScheduleBuilder) updates]) = _$Schedule;

  Schedule copyWith(Schedule updates) {
    return Schedule((b) => b
      ..id = updates.id ?? id
      ..times = (updates.times ?? times) as ListBuilder<Times>?
      ..day = updates.day ?? day);
  }

  Object? toJson() {
    return serializers.serializeWith(Schedule.serializer, this);
  }

  static Schedule? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Schedule.serializer, json);
  }

  static Serializer<Schedule> get serializer => _$scheduleSerializer;
}
