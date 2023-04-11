part of 'classifieds_like_bloc.dart';

@immutable
abstract class ClassifiedsLikeEvent {}


class LoadClassifiedTotalLikes extends ClassifiedsLikeEvent {
  final BuildContext context;
  final String IdParametroLike;
  LoadClassifiedTotalLikes(this.context, this.IdParametroLike);
}

class LikeUserToClassified extends ClassifiedsLikeEvent {
  final BuildContext context;
  final String id;
  LikeUserToClassified(this.context, this.id);
}

class LoadRefreshClassifiedsLike extends ClassifiedsLikeEvent {
  final BuildContext context;
  final String IdParametroLike;
  LoadRefreshClassifiedsLike(this.context, this.IdParametroLike);
}


class DeleteClassifiedLike extends ClassifiedsLikeEvent {
  final BuildContext context;
  final String id;
  DeleteClassifiedLike(this.context, this.id);
}

class AddLikeToClassified extends ClassifiedsLikeEvent {
  final BuildContext context;
  final String id;
  AddLikeToClassified(this.context, this.id);
}

class ResetClassifiedLike extends ClassifiedsLikeEvent {
  ResetClassifiedLike();
}

