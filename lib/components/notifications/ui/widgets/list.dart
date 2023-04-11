import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/notifications/model/notifications_response.dart';
import 'package:hipal/notifications/notification.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationsList extends StatefulWidget {
  @override
  _NotificationsList createState() => _NotificationsList();
}

class _NotificationsList extends State<NotificationsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
      if (state.notifications.length == 0) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            height: 40,
            child: state.isLoadingNotifications
                ? CircularProgressIndicator(
                    color: const Color(0xff6456EB),
                  )
                : Text("No hay información para mostrar",
                    style: TextStyle(
                        color: Color(0xff6456EB),
                        fontSize: 19,
                        fontWeight: FontWeight.w400)),
          ),
        );
      } else {
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: () async {
              BlocProvider.of<NotificationsBloc>(context)
                  .add(LoadNotifications(context, refresh: true));
              await Future.delayed(Duration(milliseconds: 1000));
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              BlocProvider.of<NotificationsBloc>(context)
                  .add(LoadNotifications(context));
              await Future.delayed(Duration(milliseconds: 1000));
              _refreshController.loadComplete();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) {
                if (i == state.notifications.length) {
                  return SizedBox(
                    height: 60,
                  );
                }

                return _NotificationCard(notification: state.notifications[i]);
              },
              itemCount: state.notifications.length + 1,
            ));
      }
    });
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationApp notification;
  const _NotificationCard({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void deleteNotification() {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('Por favor confirme'),
              content: const Text('¿Desea eliminar la notificación?'),
              actions: [
                TextButton(
                    onPressed: () {
                      BlocProvider.of<NotificationsBloc>(context).add(
                          DeleteNotification(
                              context, notification.id.toString()));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Si')),
                TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'))
              ],
            );
          });
    }

    void openNotification() {
      FCM().goNotification(
          context,
          notification.id,
          notification.notificationsableType,
          notification.notificationsableId,
          notification.viewed);
    }

    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFF2F5FF), width: 1))),
      child: Card(
        margin: EdgeInsets.all(4.0),
        child: ListTile(
          minVerticalPadding: 10,
          leading: (notification.image == null || notification.image == '')
              ? null
              : Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff6456EB),
                    image: DecorationImage(
                      image: NetworkImage(notification.image != null
                          ? notification.image.toString()
                          : ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(19.0)),
                  ),
                ),
          title: Text(
            notification.title != null ? notification.title.toString() : '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          subtitle: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                notification.message != null
                    ? notification.message.toString()
                    : '',
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: StreamBuilder(
                  stream: Stream.periodic(const Duration(minutes: 1)),
                  builder: (context, snapshot) {
                    return Text(
                        (notification.createdAt != null)
                            ? "hace " +
                                timeago.format(
                                    DateTime.now().subtract(DateTime.now()
                                        .difference(notification.createdAt
                                            as DateTime)),
                                    locale: "es")
                            : "",
                        style: TextStyle(
                            color: Color(0xFF8378FC),
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold));
                  }),
            )
          ]),
          onTap: openNotification,
          trailing: Column(
            children: [
              if (!notification.viewed)
                Badge(
                  toAnimate: false,
                  badgeColor: Color(0xffFE9D6D),
                  borderRadius: BorderRadius.circular(5.0),
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  badgeContent: Text("1",
                      style:
                          TextStyle(color: Color(0xffFE9D6D), fontSize: 10.0)),
                ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(const IconData(0xe917, fontFamily: 'icomoon'),
                      color: Color(0xff6C7192)),
                  onPressed: deleteNotification),
            ],
          ),
        ),
      ),
    );
  }
}
