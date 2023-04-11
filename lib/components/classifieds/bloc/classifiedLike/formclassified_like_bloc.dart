import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/classifieds/model/classified.dart';
import 'package:hipal/components/classifieds/model/classifiedLike.dart';
import 'package:hipal/components/classifieds/repository/classified_like_repository.dart';
import 'package:hipal/components/classifieds/repository/classifieds_repository.dart';


part 'formclassified_like_event.dart';
part 'formclassified_like_state.dart';

class FormclassifiedLikeBloc extends Bloc<FormclassifiedLikeEvent, FormclassifiedState> {
  final ClassifiedsLikeRepository classifiedsLikeRepo;

  ClassifiedLike proccessData(String field, value){
    final ClassifiedLike newClassifiedLike;

    if(state.classifiedLike!=null){
      final Map<String,dynamic> objectClassified = json.decode(json.encode(state.classifiedLike!.toJson()));
      objectClassified[field] = value;
      newClassifiedLike = ClassifiedLike.fromJson(objectClassified)!;
    }else{
      Map<String, dynamic> classifiedLike = { field: value };
      newClassifiedLike = ClassifiedLike.fromJson(classifiedLike)!;
    }

    return newClassifiedLike;
  }

  FormclassifiedLikeBloc({required this.classifiedsLikeRepo}) : super(FormclassifiedLikeInitial()) {


  }
}
