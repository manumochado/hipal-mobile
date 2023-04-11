import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/vehicles/bloc/formvehicle_bloc.dart';

import 'package:hipal/components/vehicles/bloc/vehicles_bloc.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VehiclesList extends StatefulWidget {
  @override
  _VehiclesList createState() => _VehiclesList();
}

class _VehiclesList extends State<VehiclesList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Vehicle> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesBloc, VehiclesState>(builder: (context, state) {
      items = (state.vehicles != null ? state.vehicles : [])!;
      print(items.length);

      return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            BlocProvider.of<VehiclesBloc>(context)
                .add(LoadRefreshVehicles(context));
            await Future.delayed(Duration(milliseconds: 1000));
            // if failed,use refreshFailed()
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            BlocProvider.of<VehiclesBloc>(context)
                .add(LoadMoreVehicles(context));
            await Future.delayed(Duration(milliseconds: 1000));

            _refreshController.loadComplete();
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (c, i) => _vehicleCard(i),
            itemCount: items.length,
            // ],
          ));
    });
  }

  void _deleteVehicle(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el vehículo?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<VehiclesBloc>(context)
                        .add(DeleteVehicle(context, id));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Widget _vehicleCard(int i) {
    return BlocBuilder<VehiclesBloc, VehiclesState>(builder: (context, state) {
      if (i <= items.length - 1) {
        var type =
            items[i].type!.name != null ? items[i].type!.name.toString() : '';
        var mark = items[i].mark != null ? items[i].mark.toString() : '';
        var plate = items[i].plate != null ? items[i].plate.toString() : '';

        return Card(
          child: ListTile(
            leading: (items[i].image == null || items[i].image == '')
                ? Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  )
                : Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      image: DecorationImage(
                        image: NetworkImage(items[i].image!.url != null
                            ? items[i].image!.url.toString()
                            : ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
            title: Text(
              mark,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('$type $plate'),
            onTap: () => {},
            trailing: PopupMenuButton(
                icon: Icon(const IconData(0xe91a, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC)),
                offset: Offset(-25, 18),
                onSelected: (optionValue) => {
                      if (optionValue == 1)
                        {_deleteVehicle(context, items[i].id.toString())}
                      else if (optionValue == 0)
                        {
                          BlocProvider.of<FormvehicleBloc>(context)
                              .add(EditVehicle(context, items[i])),
                          BlocProvider.of<VehiclesBloc>(context)
                              .add(ChangeIndex(1))
                        }
                    },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(child: Text('Editar'), value: 0),
                      const PopupMenuItem(child: Text('Eliminar'), value: 1),
                    ]),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
