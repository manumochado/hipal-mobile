import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'bank.g.dart';

abstract class Bank implements Built<Bank, BankBuilder> {
  String? get id;
  String? get name;

  Bank._();
  factory Bank([void Function(BankBuilder) updates]) = _$Bank;

  Object? toJson() {
    return serializers.serializeWith(Bank.serializer, this);
  }

  static Bank? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Bank.serializer, json);
  }

  static Serializer<Bank> get serializer => _$bankSerializer;
}