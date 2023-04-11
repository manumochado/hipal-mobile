import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/lostObjects/bloc/lost_object_bloc.dart';
import 'package:hipal/components/lostObjects/model/lost_object.dart';
import 'package:hipal/components/lostObjects/ui/widgets/information_lost_object.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/carousel_images.dart';


class InfoLostObjectScreen extends StatefulWidget{

  int lostObject;

  InfoLostObjectScreen({required this.lostObject});

  @override
  createState() => _InfoLostObjectScreen();

}


class _InfoLostObjectScreen extends State<InfoLostObjectScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      appBar:
      AppBarBackSearch(color_buttons: 0xFF8075FB, color_title: 0xFF343887, name_title: 'Objetos Perdidos', color_background: 0xFFF9FAFE, with_search: false, view: 'lost-objects'),
      body: BlocBuilder<LostObjectBloc, LostObjectState>(builder: (context, state) {
        return Container(
            color: Color(0xFFF9FAFE),
            child: Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                  bottom: 15.0
              ),
              child: Column(
                children: [
                  state.lostObjects?[widget.lostObject].images?.length != 0 ?
                  CarouselImages(items: state.lostObjects?[widget.lostObject].images!.toList(), itemsFiles: [], localImage: false,)
                      : Container(
                    alignment: Alignment.center,
                    height: 250,
                    child: Text(
                      "Este objeto no contiene fotos",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6C7192)
                      ),
                    ),
                  ),
                  Container(
                    child: Expanded(child: InformationLostObject(lostObject: state.lostObjects![widget.lostObject])),
                  ),

                ],
              ),
            )
        );
    }),
    );
  }

}