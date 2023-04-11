import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/families/bloc/formfamily_bloc.dart';

import 'package:hipal/components/families/bloc/families_bloc.dart';
import 'package:hipal/components/families/model/family.dart';
import 'package:hipal/components/families/ui/widgets/form.dart';
import 'package:hipal/components/families/ui/widgets/list.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class FamiliesScreen extends StatefulWidget {
  @override
  _FamiliesScreen createState() => _FamiliesScreen();
}

class _FamiliesScreen extends State<FamiliesScreen> {
  List<Family> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FamiliesBloc>(context).add(LoadFamilies(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "apartment");
      return Future.value(true);
    }, child:
        BlocBuilder<FamiliesBloc, FamiliesState>(builder: (context, state) {
      items = (state.families != null ? state.families : [])!;
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return AppBarTabs(
        title: state.title,
        pageBack: 'apartment',
        onTap: (value) => {
          if (value == 0)
            {BlocProvider.of<FormfamilyBloc>(context).add(ResetForm(context))},
          BlocProvider.of<FamiliesBloc>(context).add(ChangeIndex(value))
        },
        index: state.indexTab,
        tabsTitle: [
          {
            'title': Row(
              children: [
                Text('Familiares'),
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
          FamiliesList(),
          FamiliesForm(),
        ],
      );
    }));
  }
}
