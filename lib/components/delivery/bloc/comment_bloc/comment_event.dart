part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class LoadARefreshComment extends CommentEvent {
  final BuildContext context;
  final String parametro;
  LoadARefreshComment(this.context, this.parametro);
}

class LoadMoreCommentsDeliveries extends CommentEvent {
  final BuildContext context;
  final String id;
  LoadMoreCommentsDeliveries(this.context, this.id);
}

class DeleteCommentDelivery extends CommentEvent {
  final BuildContext context;
  final String id;
  DeleteCommentDelivery(this.context, this.id);
}
