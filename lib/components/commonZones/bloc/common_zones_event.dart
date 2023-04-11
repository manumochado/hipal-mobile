part of 'common_zones_bloc.dart';

@immutable
abstract class CommonZonesEvent {}

class ChangeType extends CommonZonesEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class LoadTypeZone extends CommonZonesEvent {
  final BuildContext context;
  LoadTypeZone(this.context);
}

class LoadCommonZonesForID extends CommonZonesEvent {
  final BuildContext context;
  final String id;
  TypeZone zone;
  LoadCommonZonesForID(this.context, this.id, this.zone);
}

class LoadCommonZonesForIDAndDate extends CommonZonesEvent {
  final BuildContext context;
  final String id;
  final String date;
  LoadCommonZonesForIDAndDate(this.context, this.id, this.date);
}

class LoadRefreshReservation extends CommonZonesEvent {
  final BuildContext context;
  final String id_user;
  final bool refresh;
  LoadRefreshReservation(this.context, this.id_user, this.refresh);
}

class DeleteReservation extends CommonZonesEvent {
  final BuildContext context;
  final String id;
  DeleteReservation(this.context, this.id);
}

class ChangeLoading extends CommonZonesEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}

class ChangeCost extends CommonZonesEvent {
  final String cost;
  ChangeCost(this.cost);
}

class EditReservation extends CommonZonesEvent {
  final BuildContext context;
  final Reservations reservation;
  EditReservation(this.context, this.reservation);
}

class ChangeSelectedDate extends CommonZonesEvent {
  final String selectedDate;
  ChangeSelectedDate(this.selectedDate);
}

class LoadNewReservation extends CommonZonesEvent {
  final Reservations reservation;
  LoadNewReservation(this.reservation);
}

class DeleteGuestReservation extends CommonZonesEvent {
  final String id;
  DeleteGuestReservation(this.id);
}

class AddGuestReservation extends CommonZonesEvent {
  final BuildContext context;
  final Friends friend;
  AddGuestReservation(this.context, this.friend);
}

class AddListGuestReservation extends CommonZonesEvent {
  final List<String> idsFriends;
  AddListGuestReservation(this.idsFriends);
}

/*class LoadEditReservation extends CommonZonesEvent {
  final Reservation reservation;
  LoadEditReservation(this.reservation);
}*/

class ChangeDate extends CommonZonesEvent {
  final String date;
  ChangeDate(this.date);
}

class ChangeHour extends CommonZonesEvent {
  final String start;
  final String end;
  ChangeHour(this.start, this.end);
}

/*class ChangeCommonZone extends CommonZonesEvent {
  final CommonZone commonZone;
  ChangeCommonZone(this.commonZone);
}*/

class ResetForm extends CommonZonesEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class LoadFriends extends CommonZonesEvent {
  final BuildContext context;
  final List<Friends> idsFriends;
  LoadFriends(this.context, this.idsFriends);
}
