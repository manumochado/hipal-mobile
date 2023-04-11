part of 'formpower_bloc.dart';

@immutable
class FormpowerState {
  final String? id;
  final PowerAssemblyM? powerAssembly;
  final bool isLoading;

  const FormpowerState({
    this.id,
    this.powerAssembly,
    this.isLoading = false,
  });

  FormpowerState copyWith({
    String? id,
    PowerAssemblyM? powerAssembly,
    bool isLoading = false,
  }) =>
      FormpowerState(
        id: id ?? this.id,
        powerAssembly: powerAssembly ?? this.powerAssembly,
        isLoading: isLoading,
      );
}

class FormpowerInitial extends FormpowerState {}
