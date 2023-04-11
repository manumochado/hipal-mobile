import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/historyAssembly/historyAssembly_bloc.dart';
import 'package:hipal/components/assembly/ui/widgets/power_assembly.dart';
import 'package:hipal/components/assembly/ui/widgets/announcement_assembly.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/utils/extension_color.dart';

import 'package:hipal/widgets/appbar_tabs.dart';

import '../../../../widgets/appbar_tabs_assembly.dart';
import '../widgets/meeting_assembly.dart';

// ignore: must_be_immutable
class HistoryAssembly extends StatefulWidget {
  HistoryAssembly({Key? key}) : super(key: key);

  @override
  _HistoryAssembly createState() => _HistoryAssembly();
}

class _HistoryAssembly extends State<HistoryAssembly> {
  _HistoryAssembly();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: '#7d41dd'.toColor(),
            padding: EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/backarrow.png',
                    width: 20,
                    height: 20,
                  ),
                ),

                Text('Historial de Asambleas',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),

                SizedBox(
                  width: 20,
                ),    
              ]
            ),
          ),
          Container(
            height: 600,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                        height: 40,
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
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                  SizedBox(height: 20),
                  ItemWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionBtn(),
      bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
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
                    'propietarios 2022',
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
                Navigator.pushNamed(context, 'power-form')
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
                    'Ver Video',
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
