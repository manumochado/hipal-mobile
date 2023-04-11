import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/Management/bankAccounts/model/bankAccount.dart';
import 'package:hipal/components/Management/bankAccounts/repository/bank_accounts_repository.dart';

part 'bankAccount_event.dart';
part 'bankAccount_state.dart';

class BankAccountBloc
    extends Bloc<BankAccountEvent, BankAccountState> {
  final BankAccountsRepository bankAccountsRepo;

  loadMore( response, emit){
    final petsResponse = json.decode(response.body);
    final List<BankAccount> bankAccounts = petsResponse['data'].map((e) => BankAccount.fromJson(e)).toList().cast<BankAccount>();
    //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newPets = [
      ...?state.bankAccounts,
      ...bankAccounts,
    ];
    emit( state.copyWith(bankAccounts: newPets) );
  }

  BankAccountBloc({required this.bankAccountsRepo})
      : super(BankAccountInitial()) {
    on<LoadBankAccount>((event, emit) async {
      //final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response = await this.bankAccountsRepo.getBanckAccount(event.context);
  
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshLoadBankAccount>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );
     // final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response = await this.bankAccountsRepo.getBanckAccount(event.context);
      if( response!=null && response.statusCode == 200 ){
        final petsResponse = json.decode(response.body);
        final List<BankAccount> bankAccounts = petsResponse['data'].map((e) => BankAccount.fromJson(e)).toList().cast<BankAccount>();
        //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit( state.copyWith(bankAccounts: bankAccounts) );
      }
    });
  }
}
