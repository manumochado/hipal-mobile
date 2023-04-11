import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/myservices/bloc/service_bloc.dart';
import 'package:hipal/components/myservices/ui/widgets/aparment_service/design_pts.dart';


import 'add_service.dart';
import 'list_service.dart';


class ApartmentService extends StatefulWidget {

  @override
  createState() => _ApartmentService();
}

class _ApartmentService extends State<ApartmentService>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ServiceBloc>(context).add( LoadRefreshService(context) );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          List<Widget> list = [];
          if(state.services != null){
            for(var i = 0; i < state.services!.length; i++){
              list.add(ListService(state.services![i]));
            }
          }
          return Container(
              margin: EdgeInsets.only(
                  top: 5.0
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(11.0),
                  bottomRight: Radius.circular(11.0),
                ),
              ),
              child:Column(
                children: [
                  state.dataLoaded  ?
                  (state.services != null? Column(
                      children: list
                  ) : Text(
                    "No hay ningun servicio",
                    style: const TextStyle(
                      color: Color(0xff343887),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  )
                      :
                  CircularProgressIndicator(),
                  Column(
                    children: [
                      //const DesignPts(),
                      AddService()
                    ],
                  ),

                ],
              )
          );

        });
  }

}
