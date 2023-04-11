import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/classifieds/model/classifiedComment.dart';
import 'package:hipal/components/classifieds/model/comment_model.dart';
import 'package:hipal/components/classifieds/repository/classified_comment_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:toast/toast.dart';

part 'classified_comment_event.dart';
part 'classified_comment_state.dart';

class ClassifiedCommentBloc extends Bloc<ClassifiedCommentEvent, ClassifiedCommentState> {
  final ClassifiedCommentRepository classifiedCommentRepo;

  params(String id) {
    return 
      "?page=" + 1.toString() +   
      "&limit=" + 1000.toString() +
      "&sort=-createdAt&filters"; 
  }

  ClassifiedCommentBloc({required this.classifiedCommentRepo})
      : super(ClassifiedCommentInitial()) {
    on<LoadARefreshCommentClassified>((event, emit) async {

      emit(state.copyWith(page: 1));
      final String params = this.params(event.parametro);
      final response = await this
          .classifiedCommentRepo
          .getClassifiedComment(event.context, event.idClassified, params);
      if (response != null && response.statusCode == 200) {
        final commentsResponse = json.decode(response.body);
        final List<ClassifiedComment> commentClassified =
            commentsResponse['data']
                .map((e) => ClassifiedComment.fromJson(e))
                .toList()
                .cast<ClassifiedComment>();

        final comments = commentsResponse['data']
            .map((e) => CommentModel.fromJson(e))
            .toList()
            .cast<CommentModel>();

        final Pagination? pagination =
            Pagination.fromJson(commentsResponse['page']);
        emit(state.copyWith(
            commentClassifieds: commentClassified, comments: comments, pagination: pagination
        ));
      }
    });

    on<SaveCommentClassified>((event, emit) async {
      final Map data = {
        "comment": event.comment,
        "classified": event.idClassified,
      };

      final response = await this
          .classifiedCommentRepo
          .saveComment(event.context, data);

     
        final commentsResponse = json.decode(response.body);
        
        final CommentModel comment = CommentModel.fromJson(commentsResponse);

        final List<CommentModel>? comments = state.comments;

        if(comments != null){
          comments.insert(0, comment);
        }

        emit(state.copyWith(
            comments: comments, 
            txtCommentField: ''
        ));
    });
    
    on<changeIsLoading>((event, emit) async {
      emit(state.copyWith(isLoading: event.isLoading));
    });

    on<tougleLike>(((event, emit) async {

        final List<CommentModel> comments = [
          ...?state.comments,
        ];

        CommentModel comment = comments.firstWhere((element) => element.sId == event.idComment);

        comment.likes?.likesCount = event.likeAction ? comment.likes!.likesCount! + 1 : comment.likes!.likesCount! - 1;

        UsersLikesM userLike = UsersLikesM();
        userLike.sId = event.userId;

        if(event.likeAction){
          comment.likes?.usersLikes?.add(userLike);
        }else{
          comment.likes?.usersLikes?.removeWhere((element) => element.sId == event.userId);
        }

        emit(state.copyWith(comments: comments.map((e) => e.sId == event.idComment ? comment : e).toList())); 

        final response = await this
          .classifiedCommentRepo
          .tougleLike(event.context, event.idComment);

        if(response == false){
          emit(state.copyWith(comments: comments)); 
        }
            
    }));

    on<ChangeTxtCommentField>((event, emit) async {
      emit(state.copyWith(txtCommentField: event.txtCommentField));
    });
  }
}
