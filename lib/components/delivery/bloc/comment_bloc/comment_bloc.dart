import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/delivery/model/comment.dart';
import 'package:hipal/components/delivery/repository/comment_repository.dart';
import 'package:hipal/serializers/pagination.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepo;

  params(String id) {
    return "?directoryAddress=" +
        id +
        "&limit=" +
        state.limit.toString() +
        "&page=" +
        state.page.toString();
  }

  CommentBloc({required this.commentRepo}) : super(CommentInitial()) {
    on<LoadARefreshComment>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params = this.params(event.parametro);
      final response = await this.commentRepo.getComment(event.context, params);
      if (response != null) {
        final commentsResponse = json.decode(response.body);
        final List<Comment> comment = commentsResponse['data']
            .map((e) => Comment.fromJson(e))
            .toList()
            .cast<Comment>();
        final Pagination? pagination =
            Pagination.fromJson(commentsResponse['page']);
        emit(state.copyWith(comment: comment, pagination: pagination));
      }
    });

    on<LoadMoreCommentsDeliveries>((event, emit) async {
      emit(state.copyWith(page: state.page + 1));
      final String params = this.params(event.id);
      final response = await this.commentRepo.getComment(event.context, params);
      if (response != null && response.statusCode == 200) {
        final commentsResponse = json.decode(response.body);
        final List<Comment> newsComments = commentsResponse['data']
            .map((e) => Comment.fromJson(e))
            .toList()
            .cast<Comment>();
        final Pagination? pagination =
            Pagination.fromJson(commentsResponse['page']);
        final newListComments = [
          ...?state.comment,
          ...newsComments,
        ];
        emit(state.copyWith(comment: newListComments, pagination: pagination));
      }
    });

    on<DeleteCommentDelivery>((event, emit) async {
      print("***** Entro a DeleteEventRegister *****");
      final response =
          await this.commentRepo.deleteComment(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        print("************** Elimino el comentario");
        final listComments = [
          ...?state.comment,
        ];
        final List<Comment> newListComments = listComments
            .where((element) => element.id != event.id)
            .toList()
            .cast<Comment>();
        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(state.copyWith(comment: newListComments, pagination: pagination));
      }
    });
  }
}
