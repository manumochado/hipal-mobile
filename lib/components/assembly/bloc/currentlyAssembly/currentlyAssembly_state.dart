part of 'currentlyAssembly_bloc.dart';

@immutable
class CurrentlyAssemblyState {
  final List<CurrentlyAssembly>? currentlyAssemblies;

  const CurrentlyAssemblyState({
    this.currentlyAssemblies,
  });
  CurrentlyAssemblyState copyWith({
    List<CurrentlyAssembly>? currentlyAssemblies,
  }) =>
      CurrentlyAssemblyState(
        currentlyAssemblies: currentlyAssemblies ?? this.currentlyAssemblies,
      );
}

class CurrentlyAssemblyInitial extends CurrentlyAssemblyState {}
