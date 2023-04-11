part of 'formpet_bloc.dart';

@immutable
class FormpetState {
  final String? id;
  final Pet? pet;
  final String? typeName;
  final String? image;
  final List<TypeFilter>? typePets;
  final bool isLoading;

  const FormpetState({
    this.id,
    this.pet,
    this.typeName,
    this.image,
    this.typePets,
    this.isLoading = false,
  });

  FormpetState copyWith({
    String? id,
    Pet? pet,
    String? typeName,
    String? image,
    List<TypeFilter>? typePets,
    bool isLoading = false,
  }) => FormpetState(
    id: id ?? this.id,
    pet: pet ?? this.pet,
    typeName: typeName ?? this.typeName,
    image: image ?? this.image,
    typePets: typePets ?? this.typePets,
    isLoading: isLoading,
  );

  String nameType(String id){
    if(this.typePets!=null){
      for (var item in this.typePets!) {
        if(item.id == id)
          return item.name.toString();
      }
    }
    return '';
  }
}

class FormpetInitial extends FormpetState {}
