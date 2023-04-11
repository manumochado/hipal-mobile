import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/streaming/model/streaming.dart';
import 'package:hipal/components/streaming/repository/streamings_repository.dart';

import 'package:hipal/serializers/pagination.dart';

part 'streamings_event.dart';
part 'streamings_state.dart';

class StreamingBloc extends Bloc<StreamingsEvent, StreamingsState> {
  final StreamingsRepository streamingsRepo;

  params(String search, String page, String limit, String startId) {
    return "?s=" +
        state.s +
        "&page=" +
        page +
        "&limit=" +
        state.limit.toString() +
        "&startId=" +
        startId;
  }

  loadMore(response, emit) {
    final streamingResponse = json.decode(response.body);
    final List<Streaming> streaming = streamingResponse['data']
        .map((e) => Streaming.fromJson(e))
        .toList()
        .cast<Streaming>();
    final Pagination? pagination =
        Pagination.fromJson(streamingResponse['page']);
    final newStreamings = [
      ...?state.streamings,
      ...streaming,
    ];
    emit(state.copyWith(streamings: newStreamings, pagination: pagination));
  }

  // Streaming proccessStreaming( pet, comparePet ){
  //   print("*****  StreamingBloc proccessStreaming line 434 *****");
  //   if(pet.id == comparePet.pet.id)
  //     return comparePet.pet;
  //   return pet;
  // }

  StreamingBloc({required this.streamingsRepo}) : super(StremaingsInitial()) {
    on<LoadStreamings>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params =
          this.params(state.s, "1", state.limit.toString(), '');
      final response =
          await this.streamingsRepo.getStreamings(event.context, params);
      if (response != null && response.statusCode == 200) {
        final streamingsResponse = json.decode(response.body);
        final List<Streaming> streamings = streamingsResponse['data']
            .map((e) => Streaming.fromJson(e))
            .toList()
            .cast<Streaming>();
        print('*********** streamings *****************');
        print(streamings);
       
        final Pagination? pagination =
            Pagination.fromJson(streamingsResponse['page']);
        emit(state.copyWith(streamings: streamings, pagination: pagination));
      }
    });
    on<LoadStreamingsForId>((event, emit) async {
      emit(state.copyWith(page: 1));
      //final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response =
          await this.streamingsRepo.getStreamingsForId(event.context, event.id);
      print('*********** Response de StreamingBloc *****************');
      print(response);
      print('*********** ************************* *****************');
       print(response.statusCode);
      if (response != null && response.statusCode == 200) {
        final streamingsResponse = json.decode(response.body);
        print('*********** Response de streamingsResponse *****************');
        print(streamingsResponse);
        print('*********** streamingsResponse ************************* streamingsResponse *****************');
        final List<Streaming> streamings = streamingsResponse['data']
            .map((e) => Streaming.fromJson(e))
            .toList()
            .cast<Streaming>();
        print('***********  streamings *****************');
        print(streamings);
        print(
            '*********** streamings ************************* streamings *****************');
        final Pagination? pagination =
            Pagination.fromJson(streamingsResponse['page']);
        emit(state.copyWith(streamings: streamings, pagination: pagination));
      }
    });

    on<LoadMoreStreamings>((event, emit) async {
      final String params = this.params(state.s, "", state.limit.toString(),
          state.streamings!.last.id.toString());

      final response =
          await this.streamingsRepo.getStreamings(event.context, params);
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<ChangeIndex>((event, emit) async {
      print("*****  StreamingsBloc ChangeIndex line 102 *****");
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
