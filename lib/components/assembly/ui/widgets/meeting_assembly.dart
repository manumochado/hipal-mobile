import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/assemblyComment/assembly_comment_bloc.dart';
import 'package:hipal/components/assembly/bloc/assemblyComment/form_assemblyComment_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/model/commentAssembly.dart';
import 'package:hipal/components/assembly/ui/screens/pageAssembly.dart';
import 'package:hipal/components/assembly/ui/widgets/ListCommentAssembly.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MeetingAssembly extends StatefulWidget {

  MeetingAssembly({Key? key}) : super(key: key);

  @override
  State<MeetingAssembly> createState() => _MeetingAssemblyState();
}

class _MeetingAssemblyState extends State<MeetingAssembly> {
  
  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: '#7d41dd'.toColor(),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              )
            ],
                    ),

          ItemWidget(),

          
          
          
          SizedBox(height: 350),

          InkWell(
            onTap: () => {
              Navigator.pushNamed(context, 'history-assembly')
            },
            child: Container(
              width: 339,
              height: 53,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: '#867bfc'.toColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Ver historial de asambleas',
                  style: TextStyle(
                    color: '#ffffff'.toColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
            
          ]
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          width: 360,
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: '#F2F0FA'.toColor(),
            borderRadius: BorderRadius.circular(26),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,

                    decoration: BoxDecoration(
                      color: '#E3DFF8'.toColor(),
                      borderRadius: BorderRadius.circular(19),
                    ),

                    child: Center(
                      child: Image.asset(
                        'assets/images/share.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),

                  SizedBox(width: 18),

                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Asamblea general',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: '#343887'.toColor(),
                    ),
                  ),
                  Text(
                    'propietarios',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: '#343887'.toColor(),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/iconDateStreaming.png',
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Febrero 24, Jueves - 7:00 pm',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: '#8378FC'.toColor(),
                        ),
                      ),
                    ],
                  ),
                ]),
                ],
              ),

              
            InkWell(
              onTap: () => {
                Navigator.pushNamed(context, 'rules-assembly')
              },
              child: Container(
                width: 70,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 1,
                    color: '#7E72FF'.toColor(),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: '#8378FC'.toColor(),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
} 