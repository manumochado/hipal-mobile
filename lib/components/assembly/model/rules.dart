import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';

part 'rules.g.dart';

abstract class Rules implements Built<Rules, RulesBuilder> {
  String? get id;
  Residential? get residential;
  bool? get isVisible;
  String? get rulesName;
  Image? get image;

  Rules._();
  factory Rules([void Function(RulesBuilder) updates]) = _$Rules;

  Object? toJson() {
    return serializers.serializeWith(Rules.serializer, this);
  }

  static Rules? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Rules.serializer, json);
  }

  static Serializer<Rules> get serializer => _$rulesSerializer;
}