part of 'address_deliveries_bloc.dart';

@immutable
abstract class AdddressDeliveriesEvent {}

class InitAddressDeliveries extends AdddressDeliveriesEvent {
  final BuildContext context;
  InitAddressDeliveries(this.context);
}

class LoadAddressDeliveries extends AdddressDeliveriesEvent {
  final BuildContext context;
  LoadAddressDeliveries(this.context);
}

class LoadAddressRefreshDeliveries extends AdddressDeliveriesEvent {
  final BuildContext context;
  final String typeDelivery;
  LoadAddressRefreshDeliveries(this.context, this.typeDelivery);
}

class LoadMoreAddressDeliveries extends AdddressDeliveriesEvent {
  final BuildContext context;
  LoadMoreAddressDeliveries(this.context);
}

class ChangeIndex extends AdddressDeliveriesEvent {
  final int index;
  ChangeIndex(this.index);
}

class LoadNewAddressDelivery extends AdddressDeliveriesEvent {
  final AddressDelivery addressDelivery;
  LoadNewAddressDelivery(this.addressDelivery);
}

class LoadEditAddressDelivery extends AdddressDeliveriesEvent {
  final AddressDelivery addressDelivery;
  LoadEditAddressDelivery(this.addressDelivery);
}

class searchAddressDirectory extends AdddressDeliveriesEvent {
  final BuildContext context;
  final String searchText;
  searchAddressDirectory(this.context, this.searchText);
}