import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/document.dart';
import 'package:hipal/serializers/serializers.dart';

part 'managementReport.g.dart';

abstract class ManagementReport implements Built<ManagementReport, ManagementReportBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  BuiltList<Document>? get documents;
  Residential? get residential;
  String? get from;
  String? get name;

  ManagementReport._();
  factory ManagementReport([void Function(ManagementReportBuilder) updates]) = _$ManagementReport;

  Object? toJson() {
    return serializers.serializeWith(ManagementReport.serializer, this);
  }

  static ManagementReport? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ManagementReport.serializer, json);
  }

  static Serializer<ManagementReport> get serializer => _$managementReportSerializer;
}