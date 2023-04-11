import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/employees/bloc/formemployee_bloc.dart';

import 'package:hipal/components/employees/bloc/employees_bloc.dart';
import 'package:hipal/components/employees/model/employee.dart';
import 'package:hipal/components/employees/ui/widgets/form.dart';
import 'package:hipal/components/employees/ui/widgets/list.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeesScreen extends StatefulWidget {
  @override
  _EmployeesScreen createState() => _EmployeesScreen();
}

class _EmployeesScreen extends State<EmployeesScreen> {
  List<Employee> items = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "apartment");
      return Future.value(true);
    }, child:
        BlocBuilder<EmployeesBloc, EmployeesState>(builder: (context, state) {
      items = (state.employees != null ? state.employees : [])!;
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return AppBarTabs(
        title: state.title,
        pageBack: 'apartment',
        onTap: (value) => {
          if (value == 0)
            {
              BlocProvider.of<FormemployeeBloc>(context).add(ResetForm(context))
            },
          BlocProvider.of<EmployeesBloc>(context).add(ChangeIndex(value))
        },
        index: state.indexTab,
        tabsTitle: [
          {
            'title': Row(
              children: [
                Text('Empleados'),
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
          EmployeesList(),
          EmployeesForm(),
        ],
      );
    }));
  }
}
