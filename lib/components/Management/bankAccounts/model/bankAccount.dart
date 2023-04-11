import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/Management/bankAccounts/model/bank.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/serializers/accountType.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/serializers.dart';

part 'bankAccount.g.dart';

abstract class BankAccount implements Built<BankAccount, BankAccountBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  Residential? get residential;
  String? get ownerName;
  String? get accountNumber;
  AccountType? get accountType;
  Bank? get bank;
  String? get idBank;
  Image? get image;
  int? get v;

  BankAccount._();
  factory BankAccount([void Function(BankAccountBuilder) updates]) =
      _$BankAccount;

  Object? toJson() {
    return serializers.serializeWith(BankAccount.serializer, this);
  }

  static BankAccount? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(BankAccount.serializer, json);
  }

  static Serializer<BankAccount> get serializer => _$bankAccountSerializer;
}
