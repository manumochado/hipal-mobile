part of 'directoryCollaborator_bloc.dart';

@immutable
class ResidentState {
  final DirectoryCollaboratorModel? resident;
  const ResidentState({
    this.resident,
  });
  ResidentState copyWith({
    DirectoryCollaboratorModel? resident,
  }) =>
      ResidentState(
        resident: resident ?? this.resident,
      );
}

class ResidentInitial extends ResidentState {}
