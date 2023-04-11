import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hipal/components/assembly/model/commentAssembly.dart';
import 'package:hipal/components/assembly/repository/assembly_comment_repository.dart';
import 'package:hipal/components/delivery/model/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'form_assemblyComment_event.dart';
part 'form_assemblyComment_state.dart';

class FormAssemblycommentBloc extends Bloc<FormcommentEvent, FormcommentState> {
  final AssemblyCommentRepository assemblyCommentRepo;

  CommentAssembly proccessData(String field, value) {
    final CommentAssembly newComment;

    if (state.comment != null) {
      final Map<String, dynamic> objectComment =
          json.decode(json.encode(state.comment!.toJson()));
      objectComment[field] = value;
      newComment = CommentAssembly.fromJson(objectComment)!;
    } else {
      Map<String, dynamic> comment = {field: value};
      newComment = CommentAssembly.fromJson(comment)!;
    }

    return newComment;
  }

  FormAssemblycommentBloc({required this.assemblyCommentRepo})
      : super(FormcommentInitial()) {
    on<LoadTypes>((event, emit) async {
      final String params = "?limit=-1";
      final response = await this
          .assemblyCommentRepo
          .getAssemblyComment(event.context, params);
      if (response != null && response.statusCode == 200) {
        final commentsResponse = json.decode(response.body);
        final List<TypeFilter> typeComments = commentsResponse['data']
            .map((e) => TypeFilter.fromJson(e))
            .toList()
            .cast<TypeFilter>();

        emit(state.copyWith(typeComments: typeComments));
      }
    });
  }
}
