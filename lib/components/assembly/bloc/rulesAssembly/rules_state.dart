part of 'rules_bloc.dart';

@immutable
class RulesState {

  final List<Rules>? rules;

  
  const RulesState({
    this.rules,

  });
  RulesState copyWith({
    List<Rules>? rules,
 
  }) => RulesState(

    rules: rules ?? this.rules,

  );
}

class RulesInitial extends RulesState {}
