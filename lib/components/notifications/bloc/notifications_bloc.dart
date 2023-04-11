import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/notifications/model/notifications_response.dart';
import 'package:hipal/components/notifications/model/unviewed_notifications_response.dart';
import 'package:hipal/components/notifications/repository/notifications_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/services/notification_service.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository notificationsRepo;

  params({int page = 0, int limit = 10}) {
    return '?page=${page}&limit=${limit}';
  }

  NotificationApp proccessNotification(notification, compareNotification) {
    if (notification.id == compareNotification.notification.id)
      return compareNotification.notification;
    return notification;
  }

  NotificationsBloc({required this.notificationsRepo})
      : super(NotificationsInitial()) {
    on<LoadNotifications>((event, emit) async {
      if (state.isLoadingNotifications) return;

      late int page;
      //Valida si no es un refresh de la lista, que no haya llegado a la ultima pagina

      if (event.refresh) {
        emit(
            state.copyWith(notifications: [], pagination: () => null, page: 1));
        page = 1;
      } else {
        page = state.pagination?.page ?? 0;
        int? lastPage = state.pagination?.lastPage ?? 1;
        page += 1;
        if (page > lastPage) return;
      }

      final params = await this.params(page: page, limit: state.limit);

      try {
        emit(state.copyWith(isLoadingNotifications: true));

        final response = await this
            .notificationsRepo
            .getNotifications(event.context, params);

        if (response != null && response.statusCode == 200) {
          final notificationsResponse =
              NotificationsResponse.fromJson(response.body);

          final Pagination? pagination =
              Pagination.fromJson(notificationsResponse.page.toMap());

          emit(state.copyWith(
            page: page,
            notifications: event.refresh
                ? notificationsResponse.data
                : [...state.notifications, ...notificationsResponse.data],
            pagination: () => pagination,
          ));
        }
      } catch (e) {
        throw e;
      } finally {
        emit(state.copyWith(isLoadingNotifications: false));
      }
    });

    on<InitNotifications>((event, emit) async {
      this.notificationsRepo.changeContext(event.context);
      this
          .notificationsRepo
          .initNotification(event.context, state.isInitSocket);

      final response =
          await this.notificationsRepo.getUnviewedNotifications(event.context);

      if (response != null && response.statusCode == 200) {
        final unviewedNofificationsResponse =
            UnviewedNofificationsResponse.fromJson(response.body);

        emit(state.copyWith(
            isInitSocket: true,
            totalUnviewed: unviewedNofificationsResponse.total,
            unviewedNotifications: unviewedNofificationsResponse.unviewed));
      }
    });

    on<NewNotificationMessage>((event, emit) async {
      final notifications = state.notifications;

      final notification = notifications
          .firstWhere((element) => element.id == event.notification.id);

      if (notification.id != null) {
        final List<NotificationApp> newNotifications = notifications
            .map((notification) => proccessNotification(notification, event))
            .toList()
            .cast();
        emit(state.copyWith(notifications: newNotifications));
      } else {
        final List<NotificationApp> newNotifications = [
          event.notification,
          ...state.notifications,
        ];
        emit(state.copyWith(notifications: newNotifications));
      }
    });

    on<ChangeNotView>((event, emit) async {
      final unviewedNofificationsResponse =
          UnviewedNofificationsResponse.fromMap(event.data);

      emit(state.copyWith(
          totalUnviewed: unviewedNofificationsResponse.total,
          unviewedNotifications: unviewedNofificationsResponse.unviewed));
    });

    on<DeleteNotification>((event, emit) async {
      final response = await this
          .notificationsRepo
          .deleteNotification(event.context, event.id);

      if (response != null && response.statusCode == 200) {
        final notifications = state.notifications;

        final List<NotificationApp> newNotifications =
            notifications.where((element) => element.id != event.id).toList();

        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());

        final Pagination? paginationView = pagination!.rebuild((b) => b
          ..notviewed = ((b.notviewed! - 1).toInt() > 0)
              ? (b.notviewed! - 1).toInt()
              : 0);
        emit(state.copyWith(
            notifications: newNotifications, pagination: () => paginationView));
      }
    });

    on<EditNotification>((event, emit) async {
      final notifications = state.notifications;
      final List<NotificationApp> newNotifications = notifications
          .map((notification) => proccessNotification(notification, event))
          .toList()
          .cast();
      int count = state.totalUnviewed;
      if (!event.viewed) {
        count = state.totalUnviewed - 1;
        if (count < 1) {
          count = 0;
        }
      }
      // count = state.notView - 1;
      emit(state.copyWith(
          notifications: newNotifications, totalUnviewed: count));
    });

    proccessNotificationView(NotificationApp notification,
        {String type = 'all'}) {
      NotificationApp processedNotification = notification;
      if (notification.type == type || type == 'all') {
        processedNotification = notification.copyWith(viewed: true);
      }
      return processedNotification;
    }

    on<SetViewAllNotifications>((event, emit) async {
      final notifications = state.notifications;
      final List<NotificationApp> newNotifications = notifications
          .map((notification) => proccessNotificationView(notification))
          .toList();
      await this.notificationsRepo.setViewAllNotifications(event.context);
      emit(state.copyWith(notifications: newNotifications, totalUnviewed: 0));
    });

    on<SetViewNotificationsByType>((event, emit) async {
      final response = await this
          .notificationsRepo
          .setViewNotificationsByType(event.context, type: event.type);

      if (response != null) {
        int newTotalUnviewed = state.totalUnviewed;

        final notifications = state.notifications;

        final List<NotificationApp> newNotifications =
            notifications.map((notification) {
          final processedNotification =
              proccessNotificationView(notification, type: event.type);
          if (notification.viewed != processedNotification.viewed) {
            newTotalUnviewed -= 1;
          }
          return processedNotification;
        }).toList();

        emit(state.copyWith(
            notifications: newNotifications, totalUnviewed: newTotalUnviewed));
      } else {
        NotificationService.showToast(event.context,
            message: 'No fue posible actualizar las notificaciones.');
      }
    });
  }
}
