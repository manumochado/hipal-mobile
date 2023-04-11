part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}


class LoadRefreshService extends ServiceEvent {
  final BuildContext context;
  LoadRefreshService(this.context);
}

class SetDataLoadedService extends ServiceEvent {
  final bool loaded;
  SetDataLoadedService(this.loaded);
}

class EditService extends ServiceEvent {
  final BuildContext context;
  final String ServiceId;
  final String params;
  EditService(this.context, this.ServiceId, this.params);
}

class ChangeLoading extends ServiceEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}

class LoadNewService extends ServiceEvent {
  final Service service;
  LoadNewService(this.service);
}

class LoadEditService extends ServiceEvent {
  final Service service;
  LoadEditService(this.service);
}

class DeleteService extends ServiceEvent {
  final BuildContext context;
  final String id;
  DeleteService(this.context, this.id);
}