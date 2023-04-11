part of 'bankAccount_bloc.dart';

@immutable
abstract class BankAccountEvent {}

class LoadBankAccount extends BankAccountEvent {
  final BuildContext context;
  LoadBankAccount(this.context);
}
class LoadRefreshLoadBankAccount extends BankAccountEvent {
  final BuildContext context;
  LoadRefreshLoadBankAccount(this.context);
}

