part of 'documentarycenter_bloc.dart';

@immutable
abstract class DocumentarycenterEvent {}

class GetDocuments extends DocumentarycenterEvent {
  final BuildContext context;
  GetDocuments(this.context);
}

class GetDocumentForId extends DocumentarycenterEvent {
  final BuildContext context;
  final String id;
  GetDocumentForId(this.context, this.id);
}

class searchCategory extends DocumentarycenterEvent {
  final BuildContext context;
  final String searchText;
  searchCategory(this.context,this.searchText);
}

class LoadMoreDocumentCategory extends DocumentarycenterEvent {
  final BuildContext context;
  LoadMoreDocumentCategory(this.context);
}