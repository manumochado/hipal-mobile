part of 'historyAssembly_bloc.dart';

@immutable
class HistoryAssemblyState {
  final List<HistoryAssembly>? historyAssemblies;
  final String title;

  const HistoryAssemblyState({
    this.historyAssemblies,
    this.title = 'Asambleas',
  });
  HistoryAssemblyState copyWith({
    List<HistoryAssembly>? historyAssemblies,
    String? title,
  }) =>
      HistoryAssemblyState(
        historyAssemblies: historyAssemblies ?? this.historyAssemblies,
        title: title ?? this.title,
      );
}

class HistoryAssemblyInitial extends HistoryAssemblyState {}
