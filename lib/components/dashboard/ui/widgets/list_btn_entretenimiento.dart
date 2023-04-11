import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/dashboard/ui/widgets/diseno_btn_entretenimiento.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';

class ListBtnEntretenimiento extends StatelessWidget {
  const ListBtnEntretenimiento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: DisenoBtnEntretenimiento(
                          nameDescription: 'Casillero',
                          pathImage: 'assets/images/iconCasillero.png',
                          view: "locker",
                          notifications: state.unviewedNotificationsByType(type: 'Locker')?.count)),
                  Expanded(
                      child: DisenoBtnEntretenimiento(
                          nameDescription: 'Eventos',
                          pathImage: "assets/images/iconEventos.png",
                          view: "events",
                          notifications: state.unviewedNotificationsByType(type: 'Event')?.count)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: DisenoBtnEntretenimiento(
                          nameDescription: 'Zonas Comunes',
                          pathImage: 'assets/images/iconZonasComunes.png',
                          view: "common-zones",
                          notifications: state.unviewedNotificationsByType(type: 'CommonZones')?.count)),
                  Expanded(
                      child: DisenoBtnEntretenimiento(
                          nameDescription: 'PQRs',
                          pathImage:
                              "assets/images/iconExperienciaResidente.png",
                          view: "resident-experience",
                          notifications: state.unviewedNotificationsByType(type: 'ResidentExperience')?.count)),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
