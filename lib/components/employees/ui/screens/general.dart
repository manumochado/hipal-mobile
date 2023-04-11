import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/employees/bloc/employees_bloc.dart';
import 'package:hipal/widgets/card_general.dart';

class GeneralEmployee extends StatelessWidget {
  const GeneralEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EmployeesBloc>(context).add(LoadRefreshEmployees(context));
    BlocProvider.of<EmployeesBloc>(context).add(ChangeIndex(0));

    return BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
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
                _employees(),
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

  Widget _employees() {
    return BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return CardGeneral(
          context: context,
          title: 'Empleados registrados',
          subtitle: totalText,
          type: 'button',
          buttonText: 'Ver',
          isEnabled: state.pagination != null,
          // type: 'icon',
          // icon: const IconData(0xe90e, fontemployee: 'icomoon'),
          navigate: 'employees');
    });
  }
}
