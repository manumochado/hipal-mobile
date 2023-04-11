part of 'classifieds_bloc.dart';

@immutable
abstract class ClassifiedsEvent {}

class LoadClassifieds extends ClassifiedsEvent {
  final BuildContext context;
  LoadClassifieds(this.context);
}

class OnClearData extends ClassifiedsEvent {}

class ChangeClassifiedsTabIndex extends ClassifiedsEvent {
  final int index;
  ChangeClassifiedsTabIndex(this.index);
}

class LoadNewClassified extends ClassifiedsEvent {
  final Classified classified;
  LoadNewClassified(this.classified);
}

class LoadGeneralClassifieds extends ClassifiedsEvent {
  final BuildContext context;
  final bool refresh;
  LoadGeneralClassifieds(this.context, {this.refresh = false});
}

class LoadUserClassifieds extends ClassifiedsEvent {
  final BuildContext context;
  final bool refresh;
  LoadUserClassifieds(this.context, {this.refresh = false});
}

class LoadEditClassified extends ClassifiedsEvent {
  final bool isUserClassified;
  final Classified classified;
  LoadEditClassified(
      {required this.classified, required this.isUserClassified});
}

class LoadDetailClassified extends ClassifiedsEvent {
  final Classified classified;
  LoadDetailClassified({required this.classified});
}

class CreateNewClassified extends ClassifiedsEvent {
  final BuildContext context;
  final Map<String, dynamic> params;
  final Function() onComplete;
  CreateNewClassified(this.context,
      {required this.params, required this.onComplete});
}

class UpdateClassified extends ClassifiedsEvent {
  final BuildContext context;
  final String id;
  final Map<String, dynamic> params;
  final Function() onComplete;
  UpdateClassified(this.context,
      {required this.id, required this.params, required this.onComplete});
}

class DeleteUserClassified extends ClassifiedsEvent {
  final BuildContext context;
  final String id;
  DeleteUserClassified(this.context, this.id);
}

class ToggleLikeClassified extends ClassifiedsEvent {
  final BuildContext context;
  final String id;
  final bool isUserClassified;
  ToggleLikeClassified(this.context,
      {required this.id, required this.isUserClassified});
}

class InitDataLikes extends ClassifiedsEvent {
  final BuildContext context;
  final int numLikes;
  final bool isLiked;
  InitDataLikes(this.context, this.numLikes, this.isLiked);
}

class NewComment extends ClassifiedsEvent {
  final BuildContext context;
  final String idClassified;
  final String owner;
  NewComment(this.context, this.idClassified, this.owner);
}

class LoadDetailClassifiedFromNotification extends ClassifiedsEvent {
  final BuildContext context;
  final String idClassified;
  LoadDetailClassifiedFromNotification(this.context, this.idClassified);
}

class InitTap extends ClassifiedsEvent {}
