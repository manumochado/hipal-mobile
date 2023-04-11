import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/model/classified.dart';
import 'package:hipal/components/classifieds/model/classifiedLike.dart';
import 'package:hipal/components/classifieds/repository/classified_like_repository.dart';
import 'package:hipal/components/classifieds/repository/classifieds_repository.dart';

import 'package:hipal/serializers/pagination.dart';

part 'classifieds_like_event.dart';
part 'classifieds_like_state.dart';

class ClassifiedsLikeBloc extends Bloc<ClassifiedsLikeEvent, ClassifiedsLikeState> {

  final ClassifiedsLikeRepository classifiedsLikeRepo;


  Classified proccessClassified( classified, compareClassified ){
    if(classified.id == compareClassified.editingClassified.id)
      return compareClassified.editingClassified;
    return classified;
  }

  ClassifiedsLikeBloc({required this.classifiedsLikeRepo}) : super(ClassifiedsInitial()) {
    on<LoadClassifiedTotalLikes>((event, emit) async {
      final response = await this.classifiedsLikeRepo.getClassifiedTotalLikes(event.context,event.IdParametroLike );

      if( response!=null && response.statusCode == 200 ){
        emit( state.copyWith( totalLikes: json.decode(response.body)["total"] ) );
      }

    });
    on<LikeUserToClassified>((event, emit) async {
      final response = await this.classifiedsLikeRepo.getLikeUserToClassified(event.context, event.id);
      if( response!=null && response.statusCode == 200 ){
        final likeUser = ClassifiedLike.fromJson(json.decode(response.body));
        emit( state.copyWith( classifiedsLike: likeUser ) );
      }

    });

    on<DeleteClassifiedLike>((event, emit) async {
      emit( state.copyWith(classifiedsLike: ClassifiedLike.fromJson({}), userLike: false,totalLikes: (state.totalLikes! - 1) ) );
      final response = await this.classifiedsLikeRepo.deleteClassifiedLike(event.context, event.id);
      if( response!=null && response.statusCode == 200 ){
      }
    });

    on<AddLikeToClassified>((event, emit) async {
      emit( state.copyWith(userLike: true,totalLikes: (state.totalLikes! + 1), classifiedsLike: ClassifiedLike.fromJson({"_id": "0"}) ) );
      final params = {"classified": event.id};
      final response = await this.classifiedsLikeRepo.saveLikeClassified(event.context, params);
      if( response!=null && (response.statusCode == 200 || response.statusCode == 201) ){
        BlocProvider.of<ClassifiedsLikeBloc>(event.context).add(LikeUserToClassified(event.context, event.id) );

      }
    });

    on<ResetClassifiedLike>((event, emit) async {
      emit( state.copyWith( classifiedsLike: ClassifiedLike.fromJson({}),totalLikes: 0, userLike: false) );
    });

  }
}
