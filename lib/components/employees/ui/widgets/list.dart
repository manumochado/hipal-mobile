import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/employees/bloc/formemployee_bloc.dart';

import 'package:hipal/components/employees/bloc/employees_bloc.dart';
import 'package:hipal/components/employees/model/employee.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeesList extends StatefulWidget {
  @override
  _EmployeesList createState() => _EmployeesList();
}

class _EmployeesList extends State<EmployeesList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Employee> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
      items = (state.employees != null ? state.employees : [])!;
      print(items.length);

      return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            BlocProvider.of<EmployeesBloc>(context)
                .add(LoadRefreshEmployees(context));
            await Future.delayed(Duration(milliseconds: 1000));
            // if failed,use refreshFailed()
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            BlocProvider.of<EmployeesBloc>(context)
                .add(LoadMoreEmployees(context));
            await Future.delayed(Duration(milliseconds: 1000));

            _refreshController.loadComplete();
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (c, i) => _employeeCard(i),
            itemCount: items.length,
            // ],
          ));
    });
  }

  void _deleteEmployee(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el empleado?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<EmployeesBloc>(context)
                        .add(DeleteEmployee(context, id));
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

  Widget _employeeCard(int i) {
    return BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        var name = items[i].name != null ? items[i].name.toString() : '';
        var phone = items[i].phone != null ? items[i].phone.toString() : '';

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
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('$phone'),
            onTap: () => {},
            trailing: PopupMenuButton(
                icon: Icon(const IconData(0xe91a, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC)),
                offset: Offset(-25, 18),
                onSelected: (optionValue) => {
                      if (optionValue == 1)
                        {_deleteEmployee(context, items[i].id.toString())}
                      else if (optionValue == 0)
                        {
                          BlocProvider.of<FormemployeeBloc>(context)
                              .add(EditEmployee(context, items[i])),
                          BlocProvider.of<EmployeesBloc>(context)
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
