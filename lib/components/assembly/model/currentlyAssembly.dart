import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/assembly/model/uploadOrder.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/serializers.dart';

part 'currentlyAssembly.g.dart';

abstract class CurrentlyAssembly
    implements Built<CurrentlyAssembly, CurrentlyAssemblyBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  Apartment? get apartment;
  String? get link;
  String? get hour;
  DateTime? get startDate;
  int? get cost;
  BuiltList<UploadOrder>? get uploadOrder;
  String? get descriptionAnnouncement;
  String? get nameAnnouncement;
  String? get nameAssembly;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  CurrentlyAssembly._();
  factory CurrentlyAssembly([void Function(CurrentlyAssemblyBuilder) updates]) =
      _$CurrentlyAssembly;

  CurrentlyAssembly copyWith(CurrentlyAssembly updates) {
    return CurrentlyAssembly((b) => b
      ..id = updates.id ?? id
      ..residential =
          (updates.residential ?? residential) as ResidentialBuilder?
      ..link = updates.link ?? link
      ..hour = updates.hour ?? hour
      ..startDate = updates.startDate ?? startDate
      ..cost = updates.cost ?? cost
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
    return serializers.serializeWith(CurrentlyAssembly.serializer, this);
  }

  static CurrentlyAssembly? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CurrentlyAssembly.serializer, json);
  }

  static Serializer<CurrentlyAssembly> get serializer =>
      _$currentlyAssemblySerializer;
}
