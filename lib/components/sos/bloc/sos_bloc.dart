import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/chats/model/chat.dart';
import 'package:hipal/components/chats/repository/chats_repository.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/repository/messages_repository.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:meta/meta.dart';

import 'package:hipal/components/sos/repository/sos_repository.dart';

part 'sos_event.dart';
part 'sos_state.dart';

class SosBloc extends Bloc<SosEvent, SosState> {
  final SosRepository sosRepo;
  final ChatsRepository chatsRepo;
  final MessagesRepository messagesRepo;
  final storage = new FlutterSecureStorage();

  SosBloc({required this.sosRepo, required this.chatsRepo, required this.messagesRepo}): super(SosInitial()) {
    on<SosEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CreateEmergency>((event, emit) async {
      emit( state.copyWith( isEmergency: true ) );
    });

    on<ChangeIsEmergency>((event, emit) async {
      emit( state.copyWith( isEmergency: event.isEmergency ) );
    });

    on<ClosedEmergency>((event, emit) async {
      await this.sosRepo.closedEmergency( event.context, event.id );
      emit( state.copyWith( isEmergency: false ) );
    });
    
    on<ChangeStatusEmergency>((event, emit) async {
      emit( state.copyWith( statusLoaded: event.status) );
    });
  }

}
