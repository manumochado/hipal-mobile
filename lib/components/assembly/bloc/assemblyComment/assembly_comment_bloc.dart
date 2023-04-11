import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/assembly/model/commentAssembly.dart';
import 'package:hipal/components/assembly/repository/assembly_comment_repository.dart';
import 'package:hipal/serializers/pagination.dart';

part 'assembly_comment_event.dart';
part 'assembly_comment_state.dart';

class AssemblyCommentBloc
    extends Bloc<AssemblyCommentEvent, AssemblyCommentState> {
  final AssemblyCommentRepository assemblyCommentRepo;

  params(String id) {
    return "?assembly=" +
        id +
        "&limit=" +
        state.limit.toString() +
        "&page=" +
        state.page.toString();
  }

  AssemblyCommentBloc({required this.assemblyCommentRepo})
      : super(AssemblyCommentInitial()) {
    on<LoadARefreshCommentAssembly>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params = this.params(event.parametro);
      final response = await this
          .assemblyCommentRepo
          .getAssemblyComment(event.context, params);
      if (response != null) {
        final commentsResponse = json.decode(response.body);
        final List<CommentAssembly> commentClassified = commentsResponse['data']
            .map((e) => CommentAssembly.fromJson(e))
            .toList()
            .cast<CommentAssembly>();
        final Pagination? pagination =
            Pagination.fromJson(commentsResponse['page']);
        emit(state.copyWith(
            commentAssemblies: commentClassified, pagination: pagination));
      }
    });

    on<LoadMoreCommentsAssembly>((event, emit) async {
      emit(state.copyWith(page: state.page + 1));
      final String params = this.params(event.id);
      final response = await this
          .assemblyCommentRepo
          .getAssemblyComment(event.context, params);
      if (response != null && response.statusCode == 200) {
        final commentsResponse = json.decode(response.body);
        final List<CommentAssembly> newsComments = commentsResponse['data']
            .map((e) => CommentAssembly.fromJson(e))
            .toList()
            .cast<CommentAssembly>();
        final Pagination? pagination =
            Pagination.fromJson(commentsResponse['page']);
        final newListComments = [
          ...?state.commentAssemblies,
          ...newsComments,
        ];
        emit(state.copyWith(
            commentAssemblies: newListComments, pagination: pagination));
      }
    });

    on<DeleteCommentAssembly>((event, emit) async {
      print("***** Entro a DeleteEventRegister *****");
      final response =
          await this.assemblyCommentRepo.deleteComment(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        print("************** Elimino el comentario");
        final listComments = [
          ...?state.commentAssemblies,
        ];
        final List<CommentAssembly> newListComments = listComments
            .where((element) => element.id != event.id)
            .toList()
            .cast<CommentAssembly>();
        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(state.copyWith(
            commentAssemblies: newListComments, pagination: pagination));
      }
    });
  }
}
