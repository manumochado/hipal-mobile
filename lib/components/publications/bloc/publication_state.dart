part of 'publication_bloc.dart';

@immutable
class PublicationsState {
  final Pagination? pagination;
  final List<PublicationInList> publications;
  final bool isLoading;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const PublicationsState({
    this.pagination,
    required this.publications,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.isLoading = false,
  });

  PublicationsState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<PublicationInList>? publications,
    int? page,
    int? limit,
    String? s,
    bool? isLoading,
  }) =>
      PublicationsState(
        pagination: pagination ?? this.pagination,
        publications: publications ?? this.publications,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        isLoading: isLoading ?? this.isLoading,
      );

  PublicationsState clearData() => PublicationsState(publications: []);
}

class PublicationsInitial extends PublicationsState {
  PublicationsInitial({required List<PublicationInList> publications})
      : super(publications: publications);
}

@immutable
class PublicationState {
  final String? id;
  final String? apartment;
  final Provider? provider;
  final bool? isPublic;
  final String? file;
  final String? text;
  final String? name;
  final String? type;
  final DateTime? createdAt;
  final String? updatedAt;
  final int? v;
  final bool isLoading;

  PublicationState copyWith({
    String? id,
    String? apartment,
    Provider? provider,
    bool? isPublic,
    String? file,
    String? text,
    String? name,
    String? type,
    DateTime? createdAt,
    String? updatedAt,
    int? v,
    bool? isLoading,
  }) {
    return PublicationState(
      id: id ?? this.id,
      apartment: apartment,
      provider: provider ?? this.provider,
      isPublic: isPublic ?? this.isPublic,
      file: file ?? this.file,
      text: text ?? this.text,
      name: name ?? this.name,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  const PublicationState({
    this.id,
    this.apartment,
    this.provider,
    this.isPublic,
    this.file,
    this.text,
    this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isLoading = false,
  });

  String get createdAtLocal => createdAt != null
      ? DateTimeHelper.ddMMyyyyTT(createdAt!.toLocal())
      : 'unassigned date';

  PublicationState clearData() => PublicationState();
}

class PublicationInitial extends PublicationState {}
