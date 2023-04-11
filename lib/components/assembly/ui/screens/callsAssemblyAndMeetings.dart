import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/historyAssembly/historyAssembly_bloc.dart';
import 'package:hipal/components/assembly/ui/widgets/listCurrentlyAssembly.dart';
import 'package:hipal/components/assembly/ui/screens/listHistoryAssembly.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';

import 'package:hipal/widgets/appbar_tabs.dart';

class AssemblyAndMeeting extends StatefulWidget {
  @override
  _AssemblyAndMeeting createState() => _AssemblyAndMeeting();
}

class _AssemblyAndMeeting extends State<AssemblyAndMeeting> {
  @override
  void initState() {
    BlocProvider.of<CurrentlyAssemblyBloc>(context)
        .add(LoadRefreshCurrentlyAssembly(context));
    BlocProvider.of<HistoryAssemblyBloc>(context)
        .add(LoadRefreshHistoryAssembly(context));

    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HistoryAssemblyBloc, HistoryAssemblyState>(
        builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AppBarTabs(
          title: state.title,
          pageBack: 'dashboard',
          // onTap: (value) => {
          //   if (value == 0)
          //     {
          //       BlocProvider.of<HistoryAssemblyBloc>(context)
          //           .add(LoadRefreshHistoryAssembly(context))
          //     },
          //   BlocProvider.of<CurrentlyAssemblyBloc>(context)
          //       .add(LoadRefreshCurrentlyAssembly(context))
          // },
          tabsTitle: [
            {
              'title': Text('Asambleas Actuales',
                  style:
                      TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis))
            },
            {
              'title': Text('Historial de Asambleas',
                  style:
                      TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
            },
          ],
          tabsContent: [
            CurrentlyAssemblyList(),
            //HistoriAssemblyList(),
          ],
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    });
  }
}
