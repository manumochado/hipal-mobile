import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/attentionResident/model/directoryCollaboratorModel.dart';
import 'package:hipal/components/assembly/model/powerAssemblyM.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../classifieds/bloc/classifiedComment/classified_comment_bloc.dart';
import '../../bloc/powerAssembly/powers_bloc.dart'; 

class PowerAssembly extends StatefulWidget {
  @override
  _PowerAssemblyState createState() => _PowerAssemblyState();
}
class _PowerAssemblyState extends State<PowerAssembly> {

  bool fullTime = false;
  bool emptyDate = false;  
  
  @override
  Widget build(BuildContext context) {

    

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if(BlocProvider.of<PowersBloc>(context).state.powerAssemblies?.isEmpty ?? true){
        BlocProvider.of<PowersBloc>(context).add(LoadPowers(context));
        Timer(Duration(seconds: 5), () {
          setState(() {
            fullTime = true;
          });
        });
      }
    });

    List<PowerAssemblyM> assemblies;

    return Container(
      color: Colors.white,
      child: BlocBuilder<PowersBloc, PowersState>(
        builder: (context, state) {
          assemblies = state.powerAssemblies ?? [];
          return assemblies.isEmpty ? Center(child: CircularProgressIndicator()) :
           assemblies.isEmpty && fullTime ? Center(child: Text('No hay asambleas')) :
          SingleChildScrollView(
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
          
                ListView.builder(itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      ItemWidget(
                        title: assemblies[index].announcementName.toString(),
                        date: assemblies[index].formattedDate(assemblies[index].date.toString()),
                        index: index,
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
                itemCount: assemblies.length, shrinkWrap: true, physics: NeverScrollableScrollPhysics(),)
          
              ],
            ),
          );
        }
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {

  final String title;
  final String date;
  final int index;

  const ItemWidget({
    required this.title,
    required this.date,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          width: 374,
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
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
                  Container(
                    width: 120,
                    height: 35,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: '#343887'.toColor(),
                      ),
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
                        date,
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
                Navigator.pushNamed(context, 'power-form', arguments: {'index': index})
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
                    'Asignar Poder',
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