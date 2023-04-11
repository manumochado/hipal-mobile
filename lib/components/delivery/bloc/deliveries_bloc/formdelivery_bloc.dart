import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hipal/components/delivery/model/delivery.dart';
import 'package:hipal/components/delivery/repository/deliveries_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'formdelivery_event.dart';
part 'formdelivery_state.dart';

class FormdeliveryBloc extends Bloc<FormdeliveryEvent, FormdeliveryState> {
  final DeliveriesRepository deliveriesRepository;

  Delivery proccessData(String field, value){
    final Delivery newDelivery;

    if(state.delivery!=null){
      final Map<String,dynamic> objectDelivery = json.decode(json.encode(state.delivery!.toJson()));
      objectDelivery[field] = value;
      newDelivery = Delivery.fromJson(objectDelivery)!;
    }else{
      Map<String, dynamic> delivery = { field: value };
      newDelivery = Delivery.fromJson(delivery)!;
    }

    return newDelivery;
  }

  FormdeliveryBloc({required this.deliveriesRepository}) : super(FormdeliveryInitial()) {
    on<LoadTypes>((event, emit) async {
      final String params = "?limit=-1";
      final response = await this.deliveriesRepository.getTypesDelivery(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final deliveriesResponse = json.decode(response.body);
        final List<TypeFilter> typeDeliveries = deliveriesResponse['data'].map((e) => TypeFilter.fromJson(e)).toList().cast<TypeFilter>();

        emit( state.copyWith(typeDeliveries: typeDeliveries ) );
      }
    });

    on<ChangeType>((event, emit) async {
      emit( state.copyWith( typeName: event.typeName ) );
    });

    on<ChangeName>((event, emit) async {
      final Delivery newDelivery = this.proccessData( "name", event.name );
      emit( state.copyWith( delivery: newDelivery ));
    });

    on<ChangeDescription>((event, emit) async {
      final Delivery newDelivery = this.proccessData( "description", event.description );
      emit( state.copyWith( delivery: newDelivery ));
    });

    on<ChangeImage>((event, emit) async {
      emit( state.copyWith( image: event.image ));
    });

    on<ResetForm>((event, emit) async {
      Delivery newDelivery = Delivery.fromJson({}) as Delivery;
      print(newDelivery);
      emit( state.copyWith( image: '', typeName: '', delivery: newDelivery, id: '' ));
    });

    on<ChangeLoading>((event, emit) async {
      emit( state.copyWith( isLoading: event.isLoading ));
    });

  }
}
