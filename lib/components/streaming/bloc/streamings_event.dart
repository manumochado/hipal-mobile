part of 'streamings_bloc.dart';

@immutable
abstract class StreamingsEvent {}

class InitStreamings extends StreamingsEvent {
  final BuildContext context;
  InitStreamings(this.context);
}

class LoadStreamings extends StreamingsEvent {
  final BuildContext context;
  LoadStreamings(this.context);
}

class LoadRefreshStreamings extends StreamingsEvent {
  final BuildContext context;
  LoadRefreshStreamings(this.context);
}
class LoadStreamingsForId extends StreamingsEvent {
  final BuildContext context;
  final String id;
  LoadStreamingsForId(this.context, this.id);
}

class LoadMoreStreamings extends StreamingsEvent {
  final BuildContext context;
  LoadMoreStreamings(this.context);
}

class ChangeIndex extends StreamingsEvent {
  final int index;
  ChangeIndex(this.index);
}


class LoadNewStreaming extends StreamingsEvent {
  final Streaming streaming;
  LoadNewStreaming(this.streaming);
}
