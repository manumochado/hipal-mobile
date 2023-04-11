import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/image.dart';

part 'provider.g.dart';

abstract class Provider implements Built<Provider, ProviderBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get bussinnes;
  String? get nameCompany;

  Provider._();
  factory Provider([void Function(ProviderBuilder) updates]) = _$Provider;

  Provider copyWith(Provider updates) {
    return Provider((b) => b
      ..id = updates.id ?? id
      ..bussinnes = updates.bussinnes ?? bussinnes
      ..nameCompany = updates.nameCompany ?? nameCompany
    );
  }

  Object? toJson() {
    return serializers.serializeWith(Provider.serializer, this);
  }

  static Provider? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Provider.serializer, json);
  }

  static Serializer<Provider> get serializer => _$providerSerializer;
}