part of 'form_service_bloc.dart';

@immutable
class FormServiceState {
  final String? id;
  final Service? service;
  final String? image;
  final bool isLoading;

  const FormServiceState({
    this.id,
    this.service,
    this.image,
    this.isLoading = false,
  });

  FormServiceState copyWith({
    String? id,
    Service? service,
    String? image,
    bool isLoading = false,
  }) => FormServiceState(
    id: id ?? this.id,
    service: service ?? this.service,
    image: image ?? this.image,
    isLoading: isLoading,
  );
}

class FormServiceInitial extends FormServiceState {}
