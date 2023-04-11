part of 'formfamily_bloc.dart';

@immutable
class FormfamilyState {
  final String? id;
  final Family? family;
  final String? typeName;
  final String? image;
  final List<TypeFilter>? typeFamilies;
  final bool isLoading;

  bool get isValidEmail => (new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(family?.email ?? '') ) ? true : false;

  const FormfamilyState({
    this.id,
    this.family,
    this.typeName,
    this.image,
    this.typeFamilies,
    this.isLoading = false,
  });

  FormfamilyState copyWith({
    String? id,
    Family? family,
    String? typeName,
    String? image,
    List<TypeFilter>? typeFamilies,
    bool isLoading = false,
  }) => FormfamilyState(
    id: id ?? this.id,
    family: family ?? this.family,
    typeName: typeName ?? this.typeName,
    image: image ?? this.image,
    typeFamilies: typeFamilies ?? this.typeFamilies,
    isLoading: isLoading,
  );

  String nameType(String id){
    if(this.typeFamilies!=null){
      for (var item in this.typeFamilies!) {
        if(item.id == id)
          return item.name.toString();
      }
    }
    return '';
  }
}

class FormfamilyInitial extends FormfamilyState {}
