import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hipal/components/delivery/model/comment.dart';
import 'package:hipal/components/delivery/repository/comment_repository.dart';
import 'package:flutter/cupertino.dart';


import 'package:hipal/serializers/typefilter.dart';

part 'formcomment_event.dart';
part 'formcomment_state.dart';

class FormcommentBloc extends Bloc<FormcommentEvent, FormcommentState> {
  final CommentRepository commentRepo;

  Comment proccessData(String field, value){
    final Comment newComment;

    if(state.comment!=null){
      final Map<String,dynamic> objectComment = json.decode(json.encode(state.comment!.toJson()));
      objectComment[field] = value;
      newComment = Comment.fromJson(objectComment)!;
    }else{
      Map<String, dynamic> comment = { field: value };
      newComment = Comment.fromJson(comment)!;
    }

    return newComment;
  }

  FormcommentBloc({required this.commentRepo}) : super(FormcommentInitial()) {
    on<LoadTypes>((event, emit) async {
      final String params = "?limit=-1";
      final response = await this.commentRepo.getComment(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final commentsResponse = json.decode(response.body);
        final List<TypeFilter> typeComments = commentsResponse['data'].map((e) => TypeFilter.fromJson(e)).toList().cast<TypeFilter>();

        emit( state.copyWith(typeComments: typeComments ) );
      }
    });

    on<ChangeMessage>((event, emit) async {
      final Comment newComment = this.proccessData( "message", event.message );
      print('_______________ new comment formComentBloc__________ ');
      print(newComment);
      emit( state.copyWith( comment: newComment ));
    });

    on<ChangeQualifiers>((event, emit) async {
      final Comment newComment = this.proccessData( "qualifiers", event.qualifiers );
      emit( state.copyWith( comment: newComment ));
    });

  }
}
