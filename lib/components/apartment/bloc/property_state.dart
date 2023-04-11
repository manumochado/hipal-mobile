part of 'property_cubit.dart';

class PropertyState extends Equatable {
  final String matController;
  final String areaController;
  final String depController;
  final bool isEdit;
  final bool isLoading;

  const PropertyState({
    this.matController = '',
    this.areaController = '',
    this.depController = '',
    this.isEdit = false,
    this.isLoading = false,
  });
  PropertyState copyWith({
    String? matController,
    String? areaController,
    String? depController,
    bool? isEdit,
    bool? isLoading,
  }) {
    return PropertyState(
      matController: matController ?? this.matController,
      areaController: areaController ?? this.areaController,
      depController: depController ?? this.depController,
      isEdit: isEdit ?? this.isEdit,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props =>
      [matController, areaController, depController, isEdit, isLoading];
}
