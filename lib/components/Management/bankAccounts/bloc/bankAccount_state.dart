part of 'bankAccount_bloc.dart';

@immutable
class BankAccountState {

  final List<BankAccount>? bankAccounts;
  const BankAccountState({
    this.bankAccounts,
  });
  BankAccountState copyWith({
    List<BankAccount>? bankAccounts,
  }) => BankAccountState(
    bankAccounts: bankAccounts ?? this.bankAccounts,
  );
}

class BankAccountInitial extends BankAccountState {}
