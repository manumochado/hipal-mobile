part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class ChangeStateEvents extends EventsEvent {
  final String state;
  ChangeStateEvents(this.state);
}

class LoadRefreshEvents extends EventsEvent {
  final BuildContext context;
  LoadRefreshEvents(this.context);
}

class LoadMoreEvents extends EventsEvent {
  final BuildContext context;
  LoadMoreEvents(this.context);
}

class searchEvent extends EventsEvent {
  final BuildContext context;
  final String searchText;
  searchEvent(this.context, this.searchText);
}

class favoriteEvent extends EventsEvent {
  final BuildContext context;
  final String id;
  final String value;
  favoriteEvent(this.context,this.id ,this.value);
}

class ChangeFromScreen extends EventsEvent {
  final String screen;
  ChangeFromScreen(this.screen);
}

class ChangeStateEvent extends EventsEvent {
  final String stated;
  final Events event;
  ChangeStateEvent(this.stated, this.event);
}