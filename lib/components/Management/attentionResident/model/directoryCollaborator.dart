import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart'
    as ResidentialDirectory;
import 'package:hipal/serializers/image.dart' as ImageSerializer;
import 'package:hipal/serializers/serializers.dart';

import '../../../commonZones/model/schedule.dart';


part 'directoryCollaborator.g.dart';

abstract class DirectoryCollaborator
    implements Built<DirectoryCollaborator, DirectoryCollaboratorBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  BuiltList<Schedule>? get schedule;
  ResidentialDirectory.Residential? get residential;
  String? get position;
  String? get stated;
  String? get phone;
  String? get email;
  String? get lastName;
  String? get name;
  ImageSerializer.Image? get photo;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  int? get v;

  void set schedule(BuiltList<Schedule>? schedule) {
    schedule = schedule;
  }

  DirectoryCollaborator._();
  factory DirectoryCollaborator(
          [void Function(DirectoryCollaboratorBuilder) updates]) =
      _$DirectoryCollaborator;

  Object? toJson() {
    return serializers.serializeWith(DirectoryCollaborator.serializer, this);
  }

  static DirectoryCollaborator? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DirectoryCollaborator.serializer, json);
  }

  static Serializer<DirectoryCollaborator> get serializer =>
      _$directoryCollaboratorSerializer;
}