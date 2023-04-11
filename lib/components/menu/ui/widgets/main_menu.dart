import 'package:flutter/material.dart';
import 'package:hipal/components/menu/ui/menu.dart';
import 'package:hipal/widgets/card_image.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMainMenu extends StatefulWidget {
  DrawerMainMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMainMenu> createState() => _DrawerMainMenuState();
}

class _DrawerMainMenuState extends State<DrawerMainMenu> {
  String _url = 'https://hipal.com.co';

  final List menuMain = [
    {
      'label': 'Inicio',
      'name': 'Dashboard',
      'icon': const IconData(0xe90f, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': 'dashboard',
    },
    {
      'label': 'Administración',
      'name': 'Administrator',
      'icon': const IconData(0xe906, fontFamily: 'icomoon'),
      'type': 'submenu',
      'active': false,
      'route': '',
      'submenu': [
        {
          'label': 'Conoce a tu administrador',
          'name': '',
          'route': 'administration',
          'active': false,
        },
        {
          'label': 'Atención al residente',
          'name': '',
          'route': 'atentionResident',
          'active': false,
        },
        {
          'label': 'Cuentas Bancarias',
          'name': '',
          'route': 'banckAccounts',
          'active': false,
        },
        {
          'label': 'Gestión del administrador',
          'name': '',
          'route': 'advertisementsScreen',
          'active': false,
        },
        {
          'label': 'Anuncios',
          'name': '',
          'route': 'adsScreen',
          'active': false,
        }
      ]
    },
    {
      'label': 'Mi Apartamento',
      'name': 'Apartment',
      'icon': const IconData(0xe90d, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': 'apartment',
    },
    {
      'label': 'Asamblea',
      'name': 'Assembly',
      'icon': const IconData(0xe90c, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      //'route': 'callsAndMeeting',
      'route': 'assembly-screen',
    },
/*    {
      'label': 'Comité',
      'name': 'Committe',
      'icon': const IconData(0xe90b, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': '',
    },*/
    {
      'label': 'Centro Documental',
      'name': 'Document',
      'icon': const IconData(0xe90a, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': 'documentary-center',
    },
    {
      'label': 'Presupuesto de la copropiedad',
      'name': 'Budge',
      'icon': const IconData(0xe909, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': 'coownership',
    },
    {
      'label': '¿Qué pasa en mi edificio?',
      'name': 'Residential',
      'icon': const IconData(0xe908, fontFamily: 'icomoon'),
      'type': 'submenu',
      'active': false,
      'submenu': [
        {
          'label': 'Eventos',
          'name': 'Events',
          'route': 'events',
          'active': false,
        },
        {
          'label': 'Streaming',
          'name': '',
          'route': 'streaming',
          'active': false,
        },
        {
          'label': 'Clasificados',
          'name': '',
          'route': 'clasificados',
          'active': false,
        },
        /*       {
          'label': 'Multas, Premios & Puntos',
          'name': '',
          'route': '',
          'active': false,
        },*/
        {
          'label': 'Objetos Perdidos',
          'name': 'Lost Objects',
          'route': 'lost-objects',
          'active': false,
        }
      ]
    },
    {
      'label': 'Hipal',
      'name': 'Hipal',
      'icon': const IconData(0xe907, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': 'hipal',
    },
    {
      'label': 'Cerrar sesión',
      'name': 'Logout',
      'icon': const IconData(0xe922, fontFamily: 'icomoon'),
      'type': 'action',
      'active': false,
      'route': 'logout',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 45, top: 0),
      width: double.maxFinite,
      child: Drawer(
        backgroundColor: const Color(0xffFFFFFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                color: Color(0xffffffff),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardImage(
                      colorTitle: 0xff897EFD,
                      colorDescription: 0xff6C7192,
                      isHome: false,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment(0, 1.0),
                          colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(123, 111, 250, 0.55),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: IconButton(
                        icon: Image.asset('assets/icons/iconEdit.png'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacementNamed("user");
                        },
                      )),
                    )
                  ]),
            ),
            for (dynamic item in menuMain)
              item['type'] == 'submenu'
                  ? Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        leading: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xffF7F7FB),
                          ),
                          child: Icon(item['icon'], color: Color(0xff7E72FF)),
                        ),
                        title: Text(
                          item['label'],
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5C5D87)),
                        ),
                        children: <Widget>[
                          for (dynamic submenu in item['submenu'])
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTitleMenu(submenu['icon'],
                                    submenu['label'], submenu['route']))
                          // ListMenuAdministration(),
                        ],
                      ))
                  : ListTitleMenu(item['icon'], item['label'], item['route']),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image(
                      image: AssetImage('assets/images/logoHipalColor.png'),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: MaterialButton(
                          child: Row(children: [
                            Text(
                              'Copyright@2021',
                              style: TextStyle(
                                color: Color(0xff6C7192),
                              ),
                            ),
                            Text(
                              ' Hipal',
                              style: TextStyle(
                                color: Color(0xff8075FB),
                              ),
                            ),
                          ]),
                          onPressed: () async => {launch(_url)}))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
