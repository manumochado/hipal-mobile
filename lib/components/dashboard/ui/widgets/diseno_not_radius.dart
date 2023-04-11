import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisenoNotRadius extends StatelessWidget {
  double height_size;

  DisenoNotRadius( this.height_size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarPrincipal = Container(
      height: height_size,
      
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment(0, 2.0),
                      colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                    ),
      ),
    );

    

    return Container(
      color: const Color(0xffE5E5E5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          appBarPrincipal,
          //description
        ],
      ),
    );
  }
}