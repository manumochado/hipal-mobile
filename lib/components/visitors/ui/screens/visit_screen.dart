import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/visitors/bloc/formvisit_bloc.dart';
import 'package:hipal/components/visitors/bloc/visitors_bloc.dart';
import 'package:hipal/components/visitors/ui/widgets/form.dart';
import 'package:hipal/components/visitors/ui/widgets/list.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

class VisitScreen extends StatefulWidget {
  VisitScreen({Key? key}) : super(key: key);

  @override
  State<VisitScreen> createState() => _VisitScreenState();
}

class _VisitScreenState extends State<VisitScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VisitorsBloc>(context).add(LoadRefreshVisitors(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child:
        BlocBuilder<VisitorsBloc, VisitorsState>(builder: (context, state) {
      return AppBarTabs(
        title: state.title,
        pageBack: 'dashboard',
        onTap: (value) => {
          if (value == 0)
            {BlocProvider.of<FormvisitBloc>(context).add(ResetForm(context))},
          BlocProvider.of<VisitorsBloc>(context).add(ChangeIndex(value))
        },
        index: state.indexTab,
        tabsTitle: [
          {
            'title': Row(
              children: [
                Text('Visitantes'),
                SizedBox(
                  width: 7.0,
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
          VisitorsList(),
          VisitorsForm(),
        ],
      );
    }));
  }
}
