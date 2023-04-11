part of 'formdelivery_bloc.dart';

@immutable
class FormdeliveryState {
  final String? id;
  final Delivery? delivery;
  final String? typeName;
  final String? image;
  final List<TypeFilter>? typeDeliveries;
  final bool isLoading;


  const FormdeliveryState({
    this.id,
    this.delivery,
    this.typeName,
    this.image,
    this.typeDeliveries,
    this.isLoading = false,
  });

  FormdeliveryState copyWith({
    String? id,
    Delivery? delivery,
    String? typeName,
    String? image,
    List<TypeFilter>? typeDeliveries,
    bool isLoading = false,
  }) => FormdeliveryState(
    id: id ?? this.id,
    delivery: delivery ?? this.delivery,
    typeName: typeName ?? this.typeName,
    image: image ?? this.image,
    typeDeliveries: typeDeliveries ?? this.typeDeliveries,
    isLoading: isLoading,
  );

  String nameType(String id){
    if(this.typeDeliveries!=null){
      for (var item in this.typeDeliveries!) {
        if(item.id == id)
          return item.name.toString();
      }
    }
    return '';
  }
}

class FormdeliveryInitial extends FormdeliveryState {}
