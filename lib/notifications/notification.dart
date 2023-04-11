import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/ads/bloc/ads_bloc.dart';
import 'package:hipal/components/ads/ui/widgets/show_dialog_detail_ads.dart';
import 'package:hipal/components/apartment/ui/widgets/remove_disabled_apartament_dialog.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedLike/classifieds_like_bloc.dart';
import 'package:hipal/components/classifieds/repository/classifieds_repository.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:hipal/components/notifications/model/notifications_response.dart';
import 'package:hipal/components/notifications/repository/notifications_repository.dart';
import 'package:hipal/components/publications/ui/screens/screen_publication.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart'
    as pqrBLOC;
import 'package:hipal/components/resident_experience/ui/screens/response_admin.dart';
import 'package:hipal/constants.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:hipal/components/chats/repository/chats_repository.dart';
import 'package:hipal/components/locker/bloc/lockers_bloc.dart';
import 'package:hipal/components/publications/bloc/publication_bloc.dart';

import '../components/auth/login/bloc/login_bloc.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  // await Firebase.initializeApp();
  print("**** MESSAGE ****");
  print(message.data);

  if (message.data.containsKey('data')) {
    // Handle data message
    final data = message.data['data'];
    print("**** DATA MESSAGE ****");
    print(data);
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    final notification = message.data['notification'];
    print("***** Notification ****");
    print(notification);
  }
}

class FCM {
  final _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  AndroidNotificationChannel? channel;

  setNotifications(BuildContext context) async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          final List<String> msgApartment = [
            "ApartamentDisabled",
            "ApartamentDeleted"
          ];
          if (msgApartment.contains(message.data["type"])) {
            showDialogApartmentDelDisabled(
                context, message.notification?.body ?? '');
            Future.delayed(const Duration(seconds: 5), () {
              // Close the dialog
              BlocProvider.of<LoginBloc>(context).loginRepo.logout(context);
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil(
                      'login', (Route<dynamic> route) => false);
            });
          } else {
            showSimpleNotification(
                Text(
                  (message.notification?.title != null)
                      ? message.notification!.title.toString()
                      : "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff6456EB),
                    image: message.notification?.android?.imageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(message
                                .notification!.android!.imageUrl
                                .toString()),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: AssetImage("assets/images/users.png"),
                            fit: BoxFit.cover,
                          ),
                    borderRadius: BorderRadius.all(Radius.circular(19.0)),
                  ),
                ),
                subtitle: Text(
                  (message.notification?.body != null)
                      ? message.notification!.body.toString()
                      : "",
                  // style: TextStyle(color: kTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                background: Colors.white,
                duration: Duration(seconds: 3),
                elevation: 5,
                foreground: kTextColor);
          }
        }
      });

      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        if (message.data.containsKey("type") &&
            message.data["type"] == "Chat") {
          final chatRepository = new ChatsRepository();
          chatRepository.getChatLoad(context, message.data["id"]);
        } else if (message.data.containsKey("type") &&
            message.data["type"] == "Locker") {
          Navigator.pushReplacementNamed(context, 'notification');
        } else if (message.data.containsKey("type") &&
            message.data["type"] == "Classified") {
          final classifieldsRepository = new ClassifiedsRepository();
          await classifieldsRepository.loadClassifield(
              context, message.data["id"]);
        } else if (message.data.containsKey("type") &&
            message.data["type"] == "Publication") {
          BlocProvider.of<PublicationBloc>(context)
              .add(LoadPublication(context, message.data["id"]));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ScreenPublication(
                        comeFromNotifications: true,
                      )));
        } else if (message.data.containsKey("type") &&
            message.data["type"] == "Ads") {
          Navigator.pushNamed(context, 'notification');
          BlocProvider.of<AdsBloc>(context)
              .add(getAdsById(context, message.data["id"]));
          showMyDialogDetailAdsOfNotification(context);
        } else if (message.data.containsKey("type") &&
            message.data["type"] == "ResidentExperience") {
          context
              .read<pqrBLOC.ResidentExperienceBloc>()
              .add(pqrBLOC.SetResponsePQRById(context, message.data["id"]));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => PqrResponseAdmin(
                        comeFromNotifications: true,
                      )));
        }
      });
    }
  }

  getToken() async {
    final token = await _firebaseMessaging.getToken();
    return token;
  }

  goNotification(BuildContext context, String id, String type, String typeId,
      bool viewed) async {
    switch (type) {
      case "Locker":
        print("******* Notification Locker ******");
        Navigator.of(context).pushReplacementNamed('locker');
        BlocProvider.of<LockersBloc>(context)
            .add(LoadRefreshLocker(context, "Pendiente"));
        BlocProvider.of<LockersBloc>(context).add(ChangeIndex(1));
        break;
      case "Assembly":
        print("******* Notification Assembly ******");
        //Navigator.of(context).pushReplacementNamed('welcomeAssembly');
        //BlocProvider.of<HistoryAssemblyBloc>(context).add( LoadRefreshLocker(context, "Pendiente") );
        //BlocProvider.of<LockersBloc>(context).add( ChangeIndex(1) );
        break;
      case "Publication":
        BlocProvider.of<PublicationBloc>(context)
            .add(LoadPublication(context, typeId));

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ScreenPublication(comeFromNotifications: true)));

        break;
      case "ResidentExperience":
        context
            .read<pqrBLOC.ResidentExperienceBloc>()
            .add(pqrBLOC.SetResponsePQRById(context, typeId));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => PqrResponseAdmin(
                      comeFromNotifications: true,
                    )));
        break;

      case "Ads":
        BlocProvider.of<AdsBloc>(context).add(getAdsById(context, typeId));
        showMyDialogDetailAdsOfNotification(context);
        break;
      case "Classified":
        BlocProvider.of<ClassifiedsBloc>(context)
            .add(LoadDetailClassifiedFromNotification(context, typeId));
        BlocProvider.of<ClassifiedsLikeBloc>(context)
            .add(ResetClassifiedLike());
        BlocProvider.of<NotificationsBloc>(context)
            .add(SetViewNotificationsByType(context, type: 'Classified'));
        break;
      default:
    }

    try {
      final notificationsRepository = new NotificationsRepository();

      final response =
          await notificationsRepository.editNotification(context, id, {});

      NotificationApp? editNotification =
          NotificationApp.fromJson(response.body);
      BlocProvider.of<NotificationsBloc>(context)
          .add(EditNotification(editNotification, viewed));
    } catch (err) {
      print(err);
    }
  }

  dispose() async {
    await _firebaseMessaging.deleteToken();
  }
}
