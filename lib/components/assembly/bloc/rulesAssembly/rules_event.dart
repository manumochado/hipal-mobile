part of 'rules_bloc.dart';

@immutable
abstract class RulesEvent {}

class LoadRules extends RulesEvent {
  final BuildContext context;
  LoadRules(this.context);
}
class LoadRefreshRules extends RulesEvent {
  final BuildContext context;
  LoadRefreshRules(this.context);
}
