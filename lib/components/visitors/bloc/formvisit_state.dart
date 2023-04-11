part of 'formvisit_bloc.dart';

@immutable
class FormvisitState {
  final String? id;
  final Visit? visit;
  final String? typeName;
  final String? image;
  final List<TypeFilter>? typeVisit;
  final bool isLoading;

  const FormvisitState({
    this.id,
    this.visit,
    this.typeName,
    this.image,
    this.typeVisit,
    this.isLoading = false,
  });

  FormvisitState copyWith({
    String? id,
    Visit? visit,
    String? typeName,
    String? image,
    List<TypeFilter>? typeVisitors,
    bool isLoading = false,
  }) => FormvisitState(
    id: id ?? this.id,
    visit: visit ?? this.visit,
    typeName: typeName ?? this.typeName,
    image: image ?? this.image,
    typeVisit: typeVisit ?? this.typeVisit,
    isLoading: isLoading,
  );

  String nameType(String id){
    if(this.typeVisit!=null){
      for (var item in this.typeVisit!) {
        if(item.id == id)
          return item.name.toString();
      }
    }
    return '';
  }
}

class FormvisitInitial extends FormvisitState {}
