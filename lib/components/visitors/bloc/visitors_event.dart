part of 'visitors_bloc.dart';

@immutable
abstract class VisitorsEvent {}

class InitVisitors extends VisitorsEvent {
  final BuildContext context;
  InitVisitors(this.context);
}

class LoadRefreshVisitors extends VisitorsEvent {
  final BuildContext context;
  LoadRefreshVisitors(this.context);
}

class LoadMoreVisitors extends VisitorsEvent {
  final BuildContext context;
  LoadMoreVisitors(this.context);
}

class ChangeIndex extends VisitorsEvent {
  final int index;
  ChangeIndex(this.index);
}

class DeleteVisitors extends VisitorsEvent {
  final BuildContext context;
  final String id;
  DeleteVisitors(this.context, this.id);
}

class LoadNewVisitors extends VisitorsEvent {
  final Visit visit;
  LoadNewVisitors(this.visit);
}

class LoadEditVisit extends VisitorsEvent {
  final Visit visit;
  LoadEditVisit(this.visit);
}