part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class InitNotifications extends NotificationsEvent {
  final BuildContext context;
  InitNotifications(this.context);
}

class NotificationView extends NotificationsEvent {
  final NotificationApp notification;
  NotificationView(this.notification);
}

class LoadNotifications extends NotificationsEvent {
  final BuildContext context;
  final bool refresh;
  LoadNotifications(this.context, {this.refresh = false});
}

class ChangeNotView extends NotificationsEvent {
  final dynamic data;
  ChangeNotView(this.data);
}

class NewNotificationMessage extends NotificationsEvent {
  final NotificationApp notification;
  NewNotificationMessage(this.notification);
}

class DeleteNotification extends NotificationsEvent {
  final BuildContext context;
  final String id;
  DeleteNotification(this.context, this.id);
}

class EditNotification extends NotificationsEvent {
  final NotificationApp notification;
  final bool viewed;
  EditNotification(this.notification, this.viewed);
}

class SetViewAllNotifications extends NotificationsEvent {
  final BuildContext context;
  SetViewAllNotifications(this.context);
}

class SetViewNotificationsByType extends NotificationsEvent {
  final BuildContext context;
  final String type;
  SetViewNotificationsByType(this.context,{required String this.type});
}