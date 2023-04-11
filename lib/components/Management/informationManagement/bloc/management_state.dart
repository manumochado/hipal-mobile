part of 'management_bloc.dart';

@immutable
class ManagementState {

  final Management? managements;


  const ManagementState({
  
    this.managements,
 
  });

  ManagementState copyWith({

    Management? managements,
 
  }) => ManagementState(

    managements: managements ?? this.managements,
  );
}

class ManagementInitial extends ManagementState {}
