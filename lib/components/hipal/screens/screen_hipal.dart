import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/advertisements_bloc.dart';
import 'package:hipal/components/Management/advertisements/model/advertisements.dart';
import 'package:hipal/components/dashboard/ui/widgets/diseno_inicio.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/hipal/widgets/ListAdsHipal.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ScreenHipal extends StatefulWidget {
  @override
  createState() => _ScreenHipal();
}

class _ScreenHipal extends State<ScreenHipal> {
  final String tagEnvironment = Environment().config.TagEnvironment;
  late YoutubePlayerController _ypController;
  bool loadFinished = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String linkVideo =
      "https://www.youtube.com/watch?v=hp9Kx41y-RY&ab_channel=Hipal";
  void runYoutubePlayer() {
    _ypController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(linkVideo).toString(),
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<AdvertisementsBloc>(context)
        .add(LoadRefreshAdvertisements(context));
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _ypController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _ypController.dispose();
    super.dispose();
  }

  List<Advertisements> items = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final descripcion =
        "Es la mejor aplicación digital móvil y web donde podrás conectarte con tu administrador, los servicios del edificio y tu comunidad, realizando pagos de administración en línea, reservando las zonas comunes, creando clasificados y ganando puntos y premios";
    final perfil =
        "CEO y co-fundador de Hipal, la solución digital #1 en Colombia para la administración de conjuntos residenciales. Daniel, un ingeniero Industrial, apasionado por el mundo de la tecnología, especialista en gerencia de proyectos, procesos y calidad. Con más de 7 años de experiencia en el sector de propiedad horizontal, los últimos 3 desempeñándose como Gerente Regional en una de las empresas más grandes de ascensores en Colombia, ve la necesidad que tienen las copropiedades de tener un aliado que no solo les ayude a gestionar más eficientemente su edificio sino los una como comunidad.";

    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
        builder: (context, state) {
      items = (state.advertisements != null ? state.advertisements : [])!;
      print('los items de adversiments son: $items');
      return WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacementNamed(context, "dashboard");
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBarBackSearch(
                color_buttons: 0xFFF8F8F8,
                color_title: 0xFFF8F8F8,
                color_background: 0xFF6456EB,
                name_title: "",
                view: 'dashboard',
                with_search: false),
            body: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DisenoInicio(),
                  Container(
                      width: size.width * 0.8,
                      child: ListView(
                        children: [
                          Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/logoWhiteHipal.png'),
                                      fit: BoxFit.contain))),
                          Container(height: 50),
                          Container(
                              height: 200,
                              child: YoutubePlayerBuilder(
                                player: YoutubePlayer(
                                  controller: _ypController,
                                ),
                                builder: (context, player) {
                                  return player;
                                },
                              )),
                          Container(height: 20),
                          Text(
                              //titulo
                              "Hipal",
                              style: TextStyle(
                                  color: Color(0xFF8378FC),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700)),
                          Container(height: 10),
                          Text(
                              //descripcion breve
                              descripcion,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color(0xFF5F5E88),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          Container(height: 30),
                          inscribirme_button,
                          Container(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        "https://www.instagram.com/hipalviveinteligente"));
                                  },
                                  heroTag: null,
                                  elevation: 0,
                                  child: ImageIcon(
                                      AssetImage(
                                        'assets/icons/instagram.png',
                                      ),
                                      color: Color(0xFF8378FC))),
                              FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        "https://www.youtube.com/channel/UCe5E1PM0EKFgZR1_OD-KDDQ"));
                                  },
                                  heroTag: null,
                                  elevation: 0,
                                  child: ImageIcon(
                                      AssetImage('assets/icons/youtube.png'),
                                      color: Color(0xFF8378FC))),
                              FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        "https://www.facebook.com/Hipal-Vive-Inteligente-110806458178676"));
                                  },
                                  heroTag: null,
                                  elevation: 0,
                                  child: ImageIcon(
                                    AssetImage('assets/icons/facebook.png'),
                                    color: Color(0xFF8378FC),
                                  )),
                            ],
                          ),
                          Container(height: 30),
                          advertisements(),
                          Container(height: 10),
                          Container(height: 30),
                          Container(
                              //daniel
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/daniel.jpg'),
                                    radius: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Daniel Puentes ",
                                          style: TextStyle(
                                              color: Color(0xFF8378FC),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      Text("Director Ejecutivo:",
                                          style: TextStyle(
                                              color: Color(0xFF5F5E88),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  ImageIcon(
                                    AssetImage(
                                        'assets/images/logoHipalWhite.png'),
                                    color: Color(0xFF8378FC),
                                    size: 30,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white)),
                          Container(height: 20),
                          Column(
                            //datos personales
                            children: [
                              Row(
                                  //email
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Email:",
                                        style: TextStyle(
                                            color: Color(0xFF5F5E88),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    Text("hola@hipal.com.co",
                                        style: TextStyle(
                                            color: Color(0xFF8378FC),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ]),
                              Row(
                                  //profesión
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Profesión:",
                                        style: TextStyle(
                                            color: Color(0xFF5F5E88),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    Text("Ingeniero Industrial",
                                        style: TextStyle(
                                            color: Color(0xFF8378FC),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ])
                            ],
                          ),
                          Container(height: 30),
                          Text(
                              //titulo perfil
                              "Perfil profesional",
                              style: TextStyle(
                                  color: Color(0xFF8378FC),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700)),
                          Container(height: 30),
                          Text(
                              //descripcion perfil
                              perfil,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color(0xFF5F5E88),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          Container(height: 30),
                          FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "https://www.instagram.com/danielpuentesnino"));
                              },
                              heroTag: null,
                              elevation: 0,
                              child: ImageIcon(
                                  AssetImage(
                                    'assets/icons/instagram.png',
                                  ),
                                  color: Color(0xFF8378FC))),
                          Container(height: 10),
                        ],
                      )),
                ],
              ),
            ),
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionBtn(),
            bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
          ));
    });
  }

  final inscribirme_button = Container(
    //margin: EdgeInsets.only(top: 30, right: 40),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Color(0xff7E72FF),
        ),
      ),
      color: const Color(0xFF776BF8),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        child: Text(
          'Visitar página web',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 16,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff7B6FFA).withOpacity(0.34),
              spreadRadius: 0,
              blurRadius: 9,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
      ),
      onPressed: () {
        launchUrl(Uri.parse("https://hipal.com.co"));
      },
    ),
  );

  Widget advertisements() {
    return tagEnvironment == Environment.PROD ||
            tagEnvironment == Environment.STAGING
        ? Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  //anuncios
                  "Anuncios recientes",
                  style: TextStyle(
                      color: Color(0xffB1B4C7),
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                height: 40,
                child: Text("Muy Pronto!",
                    style: TextStyle(
                        color: Color(0xffB1B4C7),
                        fontSize: 19,
                        fontWeight: FontWeight.w400)),
              ),
            ]),
          )
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    //anuncios
                    "Anuncios recientes",
                    style: TextStyle(
                        color: Color(0xFF8378FC),
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
                hipalAdvertisementsList(),
              ],
            ),
          );
  }
}
