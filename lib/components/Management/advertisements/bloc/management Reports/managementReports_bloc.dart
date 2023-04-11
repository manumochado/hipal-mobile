import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/Management/advertisements/model/managementReport.dart';
import 'package:hipal/components/Management/advertisements/repository/managementReport_repository.dart';

part 'managementReports_event.dart';
part 'managementReports_state.dart';

class ManagementReportsBloc
    extends Bloc<ManagementReportsEvent, ManagementReportsState> {
  final ManagementReportsRepository managementReportsRepo;
   paramsAdvertisements( String search){
    return "?name="+search;
  }

  loadMore( response, emit){
    final managementReportsResponse = json.decode(response.body);
    print(managementReportsResponse);
    print('............................');
    final List<ManagementReport> managementReports = managementReportsResponse['data'].map((e) => ManagementReport.fromJson(e)).toList().cast<ManagementReport>();
    print('_______________________');
    print(managementReports);
    print('_______________________');
    //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newManagementReports = [
      ...?state.managementReports,
      ...managementReports,
    ];
    emit( state.copyWith(managementReports: managementReports) );
  }
  getManagementsReports(response, emit) {
    print('llego al managementsRepo');
    if( response!=null && response.statusCode == 200 ){
      final LostObjectsResponse = json.decode(response.body);
      final List<ManagementReport> listDirectoryEmergency = LostObjectsResponse['data'].map((e) => ManagementReport.fromJson(e)).toList().cast<ManagementReport>();
      //final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit( state.copyWith(managementReports: listDirectoryEmergency ) );
    }
  }

  ManagementReportsBloc({required this.managementReportsRepo})
      : super(ManagementReportsInitial()) {
    on<LoadManagementReports>((event, emit) async {
      //final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response = await this.managementReportsRepo.getDocumentsManagements(event.context);
  
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshManagementReports>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );
     // final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response = await this.managementReportsRepo.getDocumentsManagements(event.context);
      if( response!=null && response.statusCode == 200 ){
        final petsResponse = json.decode(response.body);
        final List<ManagementReport> managementReports = petsResponse['data'][0].map((e) => ManagementReport.fromJson(e)).toList().cast<ManagementReport>();
        //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit( state.copyWith(managementReports: managementReports) );
      }
    });
    on<searchManagementReports>((event, emit) async {
      emit( state.copyWith(searchResidentialText: event.searchText ) );
      final String params = this.paramsAdvertisements(state.searchResidentialText);
      final response = await this.managementReportsRepo.getManagementReporsShears(event.context, params);
      getManagementsReports(response, emit);
    });
  }
  
}
