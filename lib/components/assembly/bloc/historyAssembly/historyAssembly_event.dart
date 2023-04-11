part of 'historyAssembly_bloc.dart';

@immutable
abstract class HistoryAssemblyEvent {}

class LoadHistoryAssembly extends HistoryAssemblyEvent {
  final BuildContext context;
  LoadHistoryAssembly(this.context);
}

class LoadRefreshHistoryAssembly extends HistoryAssemblyEvent {
  final BuildContext context;
  LoadRefreshHistoryAssembly(this.context);
}
