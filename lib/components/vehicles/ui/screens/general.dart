import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/vehicles/bloc/vehicles_bloc.dart';
import 'package:hipal/widgets/card_general.dart';

class GeneralVehicle extends StatelessWidget {
  const GeneralVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VehiclesBloc>(context).add(LoadRefreshVehicles(context));
    BlocProvider.of<VehiclesBloc>(context).add(ChangeIndex(0));

    return BlocBuilder<VehiclesBloc, VehiclesState>(builder: (context, state) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(11.0),
              bottomRight: Radius.circular(11.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                _vehicles(),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xffE0E5F1),
                )
              ],
            ),
          ));
    });
  }

  Widget _vehicles() {
    return BlocBuilder<VehiclesBloc, VehiclesState>(builder: (context, state) {
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return CardGeneral(
          context: context,
          title: 'Vehículos registrados',
          subtitle: totalText,
          type: 'button',
          buttonText: 'Ver',
          isEnabled: state.pagination != null,
          // type: 'icon',
          // icon: const IconData(0xe90e, fontVehicle: 'icomoon'),
          navigate: 'vehicles');
    });
  }
}
