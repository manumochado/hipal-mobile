import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/assembly/model/uploadOrder.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/serializers.dart';

part 'historyAssembly.g.dart';

abstract class HistoryAssembly
    implements Built<HistoryAssembly, HistoryAssemblyBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  String? get linkMeeting;
  String? get hour;
  DateTime? get startDate;
  BuiltList<UploadOrder>? get uploadOrder;
  String? get descriptionAnnouncement;
  String? get nameAnnouncement;
  String? get nameAssembly;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  HistoryAssembly._();
  factory HistoryAssembly([void Function(HistoryAssemblyBuilder) updates]) =
      _$HistoryAssembly;

  HistoryAssembly copyWith(HistoryAssembly updates) {
    return HistoryAssembly((b) => b
      ..id = updates.id ?? id
      ..residential =
          (updates.residential ?? residential) as ResidentialBuilder?
      ..linkMeeting = updates.linkMeeting ?? linkMeeting
      ..hour = updates.hour ?? hour
      ..startDate = updates.startDate ?? startDate
      ..uploadOrder =
          (updates.uploadOrder ?? uploadOrder) as ListBuilder<UploadOrder>?
      ..descriptionAnnouncement =
          updates.descriptionAnnouncement ?? descriptionAnnouncement
      ..nameAnnouncement = updates.nameAnnouncement ?? nameAnnouncement
      ..nameAssembly = updates.nameAssembly ?? nameAssembly
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt = updates.updatedAt ?? updatedAt);
  }

  Object? toJson() {
    return serializers.serializeWith(HistoryAssembly.serializer, this);
  }

  static HistoryAssembly? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(HistoryAssembly.serializer, json);
  }

  static Serializer<HistoryAssembly> get serializer =>
      _$historyAssemblySerializer;
}
