import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderEmergency extends StatelessWidget {
  const HeaderEmergency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SosBloc, SosState>(builder: (context, state) {
      return Container(
        color: const Color(0xffF9FAFE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 210,
              child: Column(children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Asistencia de emergencia",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Envíe incidencias de tu emergencia vía mensaje de texto o llamada telefónica",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Color(0xFFF9B5B9)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.transparent,
                      onPressed: () {},
                      child: Material(
                        color: Colors.white,
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.white, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            const IconData(0xe917, fontFamily: 'icomoon'),
                            color: Color(0xFFF1464F),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        launchUrl(
                            Uri(scheme: 'tel', path: state.phoneWatchman));
                      },
                      child: Material(
                        color: Colors.transparent,
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.white, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            const IconData(0xe91b, fontFamily: 'icomoon'),
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                gradient: const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment(0, 2.0),
                  colors: [Color(0xFFF1464F), Color(0xFFC71922)],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            )
            //description
          ],
        ),
      );
    });
  }
}
