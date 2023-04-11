import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/historyAssembly/historyAssembly_bloc.dart';
import 'package:hipal/components/assembly/ui/widgets/power_assembly.dart';
import 'package:hipal/components/assembly/ui/widgets/announcement_assembly.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';

import 'package:hipal/widgets/appbar_tabs.dart';

import '../../../../widgets/appbar_tabs_assembly.dart';
import '../widgets/meeting_assembly.dart';

// ignore: must_be_immutable
class PageAssembly extends StatefulWidget {
  PageAssembly({Key? key}) : super(key: key);

  @override
  _PageAssembly createState() => _PageAssembly();
}

class _PageAssembly extends State<PageAssembly> {
  _PageAssembly();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HistoryAssemblyBloc, HistoryAssemblyState>(
          builder: (context, state) {
        return AppBarTabsAssembly(
          title: 'Asamblea',
          pageBack: 'rulesAssembly',
          onTap: (value) => {
             value
          },
          tabsTitle: [
            {
              'title': Text('Convocatorias',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis))
            },
            {
              'title': Text('Reuniones',
                  style:
                      TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
            },
            {
              'title': Text('Poderes',
                  style:
                      TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
            },
          ],
          tabsContent: [
            AnnouncementAssembly(),
            MeetingAssembly(),
            PowerAssembly(),
          ],
        );
      }),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionBtn(),
      bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
    );
  }
}
