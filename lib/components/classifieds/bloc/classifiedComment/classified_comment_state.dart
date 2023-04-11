part of 'classified_comment_bloc.dart';

@immutable
class ClassifiedCommentState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<ClassifiedComment>? commentClassifieds;
  final List<CommentModel>? comments;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  final bool isLoading;

  final bool liked;
  final int amountLikes;
  final bool likeAction;

  final String txtCommentField;

  const ClassifiedCommentState({
    this.isInit = false,
    this.title = 'Comment',
    this.pagination,
    this.commentClassifieds,
    this.comments,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
    this.isLoading = false,
    this.liked = false,
    this.amountLikes = 0,
    this.likeAction = false,
    this.txtCommentField = "",
  });

  ClassifiedCommentState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<ClassifiedComment>? commentClassifieds,
    List<CommentModel>? comments,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
    bool? isLoading,
    bool? liked,
    int? amountLikes,
    bool? likeAction,
    String? txtCommentField,
  }) => ClassifiedCommentState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    commentClassifieds: commentClassifieds ?? this.commentClassifieds,
    comments: comments ?? this.comments,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
    isLoading: isLoading ?? this.isLoading,
    liked: liked ?? this.liked,
    amountLikes: amountLikes ?? this.amountLikes,
    likeAction: likeAction ?? this.likeAction,
    txtCommentField: txtCommentField ?? this.txtCommentField,
  );
}

class ClassifiedCommentInitial extends ClassifiedCommentState {}
