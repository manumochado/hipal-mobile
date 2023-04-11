part of 'formclassified_like_bloc.dart';

@immutable
class FormclassifiedState {
  final String? id;
  final ClassifiedLike? classifiedLike;
  final String? typeName;
  final String? image;
  final bool isLoading;

  const FormclassifiedState({
    this.id,
    this.classifiedLike,
    this.typeName,
    this.image,
    this.isLoading = false,
  });

  FormclassifiedState copyWith({
    String? id,
    Classified? classified,
    String? typeName,
    String? image,
    bool isLoading = false,
  }) => FormclassifiedState(
    id: id ?? this.id,
    classifiedLike: classifiedLike ?? this.classifiedLike,
    typeName: typeName ?? this.typeName,
    image: image ?? this.image,
    isLoading: isLoading,
  );
}

class FormclassifiedLikeInitial extends FormclassifiedState {}
