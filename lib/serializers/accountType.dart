import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/serializers/serializers.dart';

part 'accountType.g.dart';

abstract class AccountType implements Built<AccountType, AccountTypeBuilder> {
  String? get id;
  String? get name;

  AccountType._();
  factory AccountType([void Function(AccountTypeBuilder) updates]) = _$AccountType;

  Object? toJson() {
    return serializers.serializeWith(AccountType.serializer, this);
  }

  static AccountType? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AccountType.serializer, json);
  }

  static Serializer<AccountType> get serializer => _$accountTypeSerializer;
}