part of 'classified_comment_bloc.dart';

@immutable
abstract class ClassifiedCommentEvent {}


class LoadARefreshCommentClassified extends ClassifiedCommentEvent {
  final BuildContext context;
  final String parametro;
  final String idClassified;
  LoadARefreshCommentClassified(this.context, this.parametro, this.idClassified);
}

class SaveCommentClassified extends ClassifiedCommentEvent {
  final BuildContext context;
  final String idClassified;
  final String comment;
  final String owner;
  SaveCommentClassified(this.context, this.idClassified, this.comment, String idUser, this.owner);
}

class LoadMoreComments extends ClassifiedCommentEvent {
  final BuildContext context;
  final String id;
  final String idClassified;
  LoadMoreComments(this.context,this.id, this.idClassified);
}

class DeleteClassified extends ClassifiedCommentEvent {
  final BuildContext context;
  final String id;
  DeleteClassified(this.context, this.id);
}

class changeIsLoading extends ClassifiedCommentEvent {
  final bool isLoading;
  changeIsLoading(this.isLoading);
}

class tougleLike extends ClassifiedCommentEvent {
  final BuildContext context;
  final String idComment;
  final String userId;
  final bool likeAction;
  tougleLike(this.context, this.idComment, this.userId, this.likeAction);
}

class ChangeTxtCommentField extends ClassifiedCommentEvent {
  final String txtCommentField;
  ChangeTxtCommentField(this.txtCommentField);
}