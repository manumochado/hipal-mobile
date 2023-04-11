part of 'comment_bloc.dart';

@immutable
class CommentState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Comment>? comment;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const CommentState({
    this.isInit = false,
    this.title = 'Comment',
    this.pagination,
    this.comment,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  CommentState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<Comment>? comment,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => CommentState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    comment: comment ?? this.comment,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );
}

class CommentInitial extends CommentState {}
