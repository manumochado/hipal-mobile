part of 'managementReports_bloc.dart';

@immutable
abstract class ManagementReportsEvent {}

class LoadManagementReports extends ManagementReportsEvent {
  final BuildContext context;
  LoadManagementReports(this.context);
}
class LoadRefreshManagementReports extends ManagementReportsEvent {
  final BuildContext context;
  LoadRefreshManagementReports(this.context);
}

class searchManagementReports extends ManagementReportsEvent {
  final BuildContext context;
  final String searchText;
  searchManagementReports(this.context, this.searchText);
}

