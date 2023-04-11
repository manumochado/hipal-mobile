import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/provider.dart';
import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/image.dart';

part 'coownership_budget.g.dart';

abstract class CoownershipBudget implements Built<CoownershipBudget, CoownershipBudgetBuilder> {

  @BuiltValueField(wireName: '_id')
  String? get id;
  Provider? get provider;
  Residential? get residential;
  int? get worth;
  String? get year;
  String? get month;
  String? get nameEgress;
  Image? get image;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  CoownershipBudget._();
  factory CoownershipBudget([void Function(CoownershipBudgetBuilder) updates]) = _$CoownershipBudget;

  CoownershipBudget copyWith(CoownershipBudget updates) {
    return CoownershipBudget((b) => b
      ..id = updates.id ?? id
      ..provider = (updates.provider ?? provider) as ProviderBuilder?
      ..residential = (updates.residential ?? residential) as ResidentialBuilder?
      ..worth = updates.worth ?? worth
      ..year = updates.year ?? year
      ..month = updates.month ?? month
      ..nameEgress = updates.nameEgress ?? nameEgress
      ..image = (updates.image ?? image) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }

  Object? toJson() {
    return serializers.serializeWith(CoownershipBudget.serializer, this);
  }

  static CoownershipBudget? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CoownershipBudget.serializer, json);
  }

  static Serializer<CoownershipBudget> get serializer => _$coownershipBudgetSerializer;
}