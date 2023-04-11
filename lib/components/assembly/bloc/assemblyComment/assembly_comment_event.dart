part of 'assembly_comment_bloc.dart';

@immutable
abstract class AssemblyCommentEvent {}

class LoadARefreshCommentAssembly extends AssemblyCommentEvent {
  final BuildContext context;
  final String parametro;
  LoadARefreshCommentAssembly(this.context, this.parametro);
}

class LoadMoreCommentsAssembly extends AssemblyCommentEvent {
  final BuildContext context;
  final String id;
  LoadMoreCommentsAssembly(this.context, this.id);
}

class DeleteCommentAssembly extends AssemblyCommentEvent {
  final BuildContext context;
  final String id;
  DeleteCommentAssembly(this.context, this.id);
}
