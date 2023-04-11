import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hipal/components/visitors/model/visit.dart';
import 'package:hipal/components/visitors/repository/visitors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'formvisit_event.dart';
part 'formvisit_state.dart';

class FormvisitBloc extends Bloc<FormvisitEvent, FormvisitState> {
  final VisitorsRepository visitorsRepo;

  Visit proccessData(String field, value) {
    final Visit newVisit;

    if (state.visit != null) {
      final Map<String, dynamic> objectVehicle =
          json.decode(json.encode(state.visit!.toJson()));
      objectVehicle[field] = value;
      newVisit = Visit.fromJson(objectVehicle)!;
    } else {
      Map<String, dynamic> vehicle = {field: value};
      newVisit = Visit.fromJson(vehicle)!;
    }

    return newVisit;
  }

  FormvisitBloc({required this.visitorsRepo}) : super(FormvisitInitial()) {

    on<ChangeFullName>((event, emit) async {
      final Visit newVisit = this.proccessData("fullName", event.fullName);
      emit(state.copyWith(visit: newVisit));
    });
    
    on<ChangeIdentity>((event, emit) async {
      final Visit newVisit = this.proccessData("identity", event.identity);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeDriverName>((event, emit) async {
      final Visit newVisit = this.proccessData("driverName", event.driverName);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeHour>((event, emit) async {
      final Visit newVisit = this.proccessData("hour", event.hour);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeDate>((event, emit) async {
      final Visit newVisit = this.proccessData("date", event.date);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeNumberPeople>((event, emit) async {
      final Visit newVisit = this.proccessData("NumberPeople", event.NumberPeople);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeTypeArrival>((event, emit) async {
      final Visit newVisit = this.proccessData("typeArrival", event.typeArrival);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeTypeVisit>((event, emit) async {
      final Visit newVisit = this.proccessData("typeVisit", event.typeVisit);
      emit(state.copyWith(visit: newVisit));
    });

    on<ChangeType>((event, emit) async {
      emit(state.copyWith(typeName: event.typeName));
    });

    on<ChangeImage>((event, emit) async {
      emit( state.copyWith( image: event.image ));
    });

    on<ChangePlate>((event, emit) async {
      final Visit newVisit = this.proccessData( "licensePlate", event.licensePlate );
      emit( state.copyWith( visit: newVisit ));
    });

    on<ChangeMark>((event, emit) async {
      final Visit newVisit = this.proccessData( "mark", event.mark );
      emit( state.copyWith( visit: newVisit ));
    });

     on<ChangeColor>((event, emit) async {
      final Visit newVisit = this.proccessData( "color", event.color );
      emit( state.copyWith( visit: newVisit ));
    });

    on<ResetForm>((event, emit) async {
      Visit newVisit = Visit.fromJson({}) as Visit;
      emit(state.copyWith(image: '', typeName: '', visit: newVisit, id: ''));
    });

    on<EditVisit>((event, emit) async {
      emit(state.copyWith( image: '', visit: event.visit, id: event.visit.id));
    });

    
    on<ChangeLoading>((event, emit) async {
      emit(state.copyWith(isLoading: event.isLoading));
    });
  }
}
