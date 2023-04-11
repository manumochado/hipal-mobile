import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/lostObjects/bloc/lost_object_bloc.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/components/lostObjects/ui/widgets/list_lost_objects.dart';

class LostObjectScren extends StatefulWidget{

  createState() => _LostObjectScren();

}

class _LostObjectScren extends State<LostObjectScren>{
  final _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async{
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: Scaffold(
          extendBody: true,
          appBar:
          AppBarBackSearch(color_buttons: 0xFF8075FB, color_title: 0xFF343887, name_title: 'Objetos Perdidos', color_background: 0xFFF9FAFE, with_search: false, view: 'dashboard'),
          body: Container(
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
                    _search_field(),
                    ListLostObjects()
                  ],
                ),
              )
          ),
        )
    );
  }

  Widget _search_field(){
    return BlocBuilder<LostObjectBloc, LostObjectState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]
        ),

        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextField(
            controller: _controller,
            autocorrect: false,
            style: TextStyle(
                color: Color(0xff5C5D87),
                fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              suffixIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff8C81FE),
                        Color(0xff776BF8)
                      ],
                    ),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.search, size: 25,color: Color(0xffffffff)),
                      onPressed: () {
                        context.read<LostObjectBloc>().add( searchLostObject(context, _controller.text));
                      }
                  )
              ),
            ),
          ),
        ),
      );
    });
  }

}