import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/vehicles/bloc/formvehicle_bloc.dart';

import 'package:hipal/components/vehicles/bloc/vehicles_bloc.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';
import 'package:hipal/components/vehicles/ui/widgets/form.dart';
import 'package:hipal/components/vehicles/ui/widgets/list.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class VehiclesScreen extends StatefulWidget {
  @override
  _VehiclesScreen createState() => _VehiclesScreen();
}

class _VehiclesScreen extends State<VehiclesScreen> {
  List<Vehicle> items = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "apartment");
      return Future.value(true);
    }, child:
        BlocBuilder<VehiclesBloc, VehiclesState>(builder: (context, state) {
      items = (state.vehicles != null ? state.vehicles : [])!;
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return AppBarTabs(
        title: state.title,
        pageBack: 'apartment',
        onTap: (value) => {
          if (value == 0)
            {BlocProvider.of<FormvehicleBloc>(context).add(ResetForm(context))},
          BlocProvider.of<VehiclesBloc>(context).add(ChangeIndex(value))
        },
        index: state.indexTab,
        tabsTitle: [
          {
            'title': Row(
              children: [
                Text('Vehículos'),
                SizedBox(
                  width: 7.0,
                ),
                Badge(
                  toAnimate: false,
                  badgeColor: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8),
                  padding: EdgeInsets.all(5.0),
                  badgeContent: Text(totalText.toString(),
                      style: TextStyle(color: Color(0xff6456EB))),
                ),
              ],
            )
          },
          {
            'icon': const IconData(0xe91f, fontFamily: 'icomoon'),
            'title': Text('Agregar'),
          },
        ],
        tabsContent: [
          VehiclesList(),
          VehiclesForm(),
        ],
      );
    }));
  }
}
