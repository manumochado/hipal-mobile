part of 'managementReports_bloc.dart';

@immutable
class ManagementReportsState {

  final List<ManagementReport>? managementReports;
  final String searchText;
  final String searchResidentialText;
  const ManagementReportsState({
    this.managementReports,
    this.searchText = '',
    this.searchResidentialText = '',
  });
  ManagementReportsState copyWith({
    List<ManagementReport>? managementReports,
    String? searchText,
    String? searchResidentialText,
  }) => ManagementReportsState(
    managementReports: managementReports ?? this.managementReports,
    searchText: searchText ?? this.searchText,
    searchResidentialText: searchResidentialText ?? this.searchResidentialText,
  );
}

class ManagementReportsInitial extends ManagementReportsState {}
