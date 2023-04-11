import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'pagination.g.dart';

abstract class Pagination implements Built<Pagination, PaginationBuilder> {
  int? get lastPage;
  int? get page;
  int? get total;
  int? get notviewed;

  Pagination._();
  factory Pagination([void Function(PaginationBuilder) updates]) = _$Pagination;

  Object? toJson() {
    return serializers.serializeWith(Pagination.serializer, this);
  }

  static Pagination? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Pagination.serializer, json);
  }

  static Serializer<Pagination> get serializer => _$paginationSerializer;
}