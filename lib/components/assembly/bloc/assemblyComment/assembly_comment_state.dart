part of 'assembly_comment_bloc.dart';

@immutable
class AssemblyCommentState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<CommentAssembly>? commentAssemblies;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const AssemblyCommentState({
    this.isInit = false,
    this.title = 'Comment',
    this.pagination,
    this.commentAssemblies,
    this.page = 1,
    this.limit = 10,
    this.s = "",
  });

  AssemblyCommentState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<CommentAssembly>? commentAssemblies,
    int? page,
    int? limit,
    String? s,
  }) =>
      AssemblyCommentState(
        isInit: isInit ?? this.isInit,
        title: title ?? this.title,
        pagination: pagination ?? this.pagination,
        commentAssemblies: commentAssemblies ?? this.commentAssemblies,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
      );
}

class AssemblyCommentInitial extends AssemblyCommentState {}
