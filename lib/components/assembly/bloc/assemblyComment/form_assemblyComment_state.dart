part of 'form_assemblyComment_bloc.dart';

@immutable
class FormcommentState {
  final String? id;
  final Comment? comment;
  final String? typeName;
  final String? image;
  final List<TypeFilter>? typeComments;
  final bool isLoading;

  const FormcommentState({
    this.id,
    this.comment,
    this.typeName,
    this.image,
    this.typeComments,
    this.isLoading = false,
  });

  FormcommentState copyWith({
    String? id,
    Comment? comment,
    String? typeName,
    String? image,
    List<TypeFilter>? typeComments,
    bool isLoading = false,
  }) =>
      FormcommentState(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        typeName: typeName ?? this.typeName,
        image: image ?? this.image,
        typeComments: typeComments ?? this.typeComments,
        isLoading: isLoading,
      );

  String nameType(String id) {
    if (this.typeComments != null) {
      for (var item in this.typeComments!) {
        if (item.id == id) return item.name.toString();
      }
    }
    return '';
  }
}

class FormcommentInitial extends FormcommentState {}
