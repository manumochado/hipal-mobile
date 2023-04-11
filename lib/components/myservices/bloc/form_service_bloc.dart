import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hipal/components/myservices/model/service.dart';
import 'package:hipal/components/myservices/repository/service_repository.dart';
import 'package:meta/meta.dart';

part 'form_service_event.dart';
part 'form_service_state.dart';

class FormServiceBloc extends Bloc<FormServiceEvent, FormServiceState> {

  ServiceRepository serviceRepo;

  FormServiceBloc({required this.serviceRepo}) : super(FormServiceInitial()) {
    on<FormServiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
