part of 'deliveries_bloc.dart';

@immutable
abstract class DeliveriesEvent {}

class InitDeliveries extends DeliveriesEvent {
  final BuildContext context;
  InitDeliveries(this.context);
}

class LoadDeliveries extends DeliveriesEvent {
  final BuildContext context;
  LoadDeliveries(this.context);
}

class LoadRefreshDeliveries extends DeliveriesEvent {
  final BuildContext context;
  LoadRefreshDeliveries(this.context);
}

class LoadMoreDeliveries extends DeliveriesEvent {
  final BuildContext context;
  LoadMoreDeliveries(this.context);
}

class ChangeIndex extends DeliveriesEvent {
  final int index;
  ChangeIndex(this.index);
}
class ChangeDeliveriesPressed extends DeliveriesEvent {
  final String idPressed;
  ChangeDeliveriesPressed(this.idPressed);
}

class LoadNewDelivery extends DeliveriesEvent {
  final Delivery delivery;
  LoadNewDelivery(this.delivery);
}

class LoadEditDelivery extends DeliveriesEvent {
  final Delivery delivery;
  LoadEditDelivery(this.delivery);
}