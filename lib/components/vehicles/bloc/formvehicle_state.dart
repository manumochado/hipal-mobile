part of 'formvehicle_bloc.dart';

@immutable
class FormvehicleState {
  final String? id;
  final Vehicle? vehicle;
  final String? typeName;
  final String? image;
  final List<TypeFilter>? typeVehicles;
  final bool isLoading;

  const FormvehicleState({
    this.id,
    this.vehicle,
    this.typeName,
    this.image,
    this.typeVehicles,
    this.isLoading = false,
  });

  FormvehicleState copyWith({
    String? id,
    Vehicle? vehicle,
    String? typeName,
    String? image,
    List<TypeFilter>? typeVehicles,
    bool isLoading = false,
  }) => FormvehicleState(
    id: id ?? this.id,
    vehicle: vehicle ?? this.vehicle,
    typeName: typeName ?? this.typeName,
    image: image ?? this.image,
    typeVehicles: typeVehicles ?? this.typeVehicles,
    isLoading: isLoading,
  );

  String nameType(String id){
    if(this.typeVehicles!=null){
      for (var item in this.typeVehicles!) {
        if(item.id == id)
          return item.name.toString();
      }
    }
    return '';
  }
}

class FormvehicleInitial extends FormvehicleState {}
