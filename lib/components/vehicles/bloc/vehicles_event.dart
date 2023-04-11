part of 'vehicles_bloc.dart';

@immutable
abstract class VehiclesEvent {}

class InitVehicles extends VehiclesEvent {
  final BuildContext context;
  InitVehicles(this.context);
}

class LoadVehicles extends VehiclesEvent {
  final BuildContext context;
  LoadVehicles(this.context);
}

class LoadRefreshVehicles extends VehiclesEvent {
  final BuildContext context;
  LoadRefreshVehicles(this.context);
}

class LoadMoreVehicles extends VehiclesEvent {
  final BuildContext context;
  LoadMoreVehicles(this.context);
}

class ChangeIndex extends VehiclesEvent {
  final int index;
  ChangeIndex(this.index);
}

class DeleteVehicle extends VehiclesEvent {
  final BuildContext context;
  final String id;
  DeleteVehicle(this.context, this.id);
}

class LoadNewVehicle extends VehiclesEvent {
  final Vehicle vehicle;
  LoadNewVehicle(this.vehicle);
}

class LoadEditVehicle extends VehiclesEvent {
  final Vehicle vehicle;
  LoadEditVehicle(this.vehicle);
}