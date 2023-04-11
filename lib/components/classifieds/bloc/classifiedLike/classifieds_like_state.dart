part of 'classifieds_like_bloc.dart';

@immutable
class ClassifiedsLikeState {

  final String title;
  final ClassifiedLike? classifiedsLike;
  final int? indexTab;
  final int? totalLikes;
  final bool userLike;


  const ClassifiedsLikeState({
    this.title = 'Clasificados',
    this.userLike = false,
    this.classifiedsLike,
    this.indexTab = 0,
    this.totalLikes = 0,
  });

  ClassifiedsLikeState copyWith({
    String? title,
    bool? userLike,
    Pagination? pagination,
    ClassifiedLike? classifiedsLike,
    int? indexTab,
    int? totalLikes,
  }) => ClassifiedsLikeState(
    userLike: userLike ?? this.userLike,
    title: title ?? this.title,
    classifiedsLike: classifiedsLike ?? this.classifiedsLike,
    indexTab: indexTab ?? this.indexTab,
    totalLikes: totalLikes ?? this.totalLikes,
  );
}

class ClassifiedsInitial extends ClassifiedsLikeState {}
