import 'package:flutter/material.dart';

import '../../../../widgets/appbar_tabs_assembly.dart';
import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';
import '../widgets/documents_assembly_gral.dart';
import '../widgets/metting_assembly_gral.dart';
import '../widgets/voting_assembly_gral.dart'; 

class GralAssemblyScreen extends StatefulWidget {
  @override
  _GralAssemblyScreenState createState() => _GralAssemblyScreenState();
}
class _GralAssemblyScreenState extends State<GralAssemblyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarTabsAssembly(
            title: 'Asamblea',
            pageBack: 'rules-assembly',
            onTap: (value) => {
               value
            },
            tabsTitle: [
              {
                'title': Text('Asamblea',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis))
              },
              {
                'title': Text('Documentos',
                    style:
                        TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
              },
              {
                'title': Text('Votaciones',
                    style:
                        TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
              },
            ],
            tabsContent: [
              MettingAssemblyGral(),
              DocumentsAssemblyGral(),
              VotingAssemblyGral(),
            ],
          ),

          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
    );
  }
} 