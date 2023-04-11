part of 'notifications_bloc.dart';

const _validNotificationTypes = [
  "AssemblyReminder",
  "Chat",
  "Locker",
  "PublicService",
  "Event",
  "Emergency",
  "Assembly",
  "ResidentExperience",
  "ResponseResidentExperience",
  "Publication",
  "ServiceMaintenance",
  "CommonZones"
];

@immutable
class NotificationsState {
  final bool isInitSocket;
  final bool isLoadingNotifications;

  final Pagination? pagination;
  final List<NotificationApp> notifications;

  final int page;
  final int limit;
  final int totalUnviewed;
  final List<UnviewedNotifications> unviewedNotifications;

  const NotificationsState({
    this.isInitSocket = false,
    this.isLoadingNotifications = false,
    this.pagination,
    this.notifications = const [],
    this.page = 0,
    this.limit = 10,
    this.totalUnviewed = 0,
    this.unviewedNotifications = const [],
  });

  NotificationsState copyWith({
    bool? isInitSocket,
    bool? isLoadingNotifications,
    Pagination? Function()? pagination,
    List<NotificationApp>? notifications,
    int? page,
    int? limit,
    int? totalUnviewed,
    List<UnviewedNotifications>? unviewedNotifications,
  }) =>
      NotificationsState(
        isInitSocket: isInitSocket ?? this.isInitSocket,
        isLoadingNotifications: isLoadingNotifications ?? this.isLoadingNotifications,
         pagination: pagination != null ? pagination() : this.pagination,
        notifications: notifications ?? this.notifications,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        unviewedNotifications:
            unviewedNotifications ?? this.unviewedNotifications,
        totalUnviewed: totalUnviewed ?? this.totalUnviewed,
      );

  NotificationsState clearData() => NotificationsState();

  UnviewedNotifications? unviewedNotificationsByType({required String type}) {
    if (!_validNotificationTypes.contains(type)) return null;

    final item = this.unviewedNotifications.firstWhere(
        (element) => element.type == type,
        orElse: () => UnviewedNotifications.empty());
    return item.type == '' ? null : item;
  }
}

class NotificationsInitial extends NotificationsState {}
