import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/pets/bloc/formpet_bloc.dart';

import 'package:hipal/components/pets/bloc/pets_bloc.dart';
import 'package:hipal/components/pets/model/pet.dart';
import 'package:hipal/components/pets/ui/widgets/form.dart';
import 'package:hipal/components/pets/ui/widgets/list.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class PetsScreen extends StatefulWidget {
  @override
  _PetsScreen createState() => _PetsScreen();
}

class _PetsScreen extends State<PetsScreen> {
  List<Pet> items = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "apartment");
      return Future.value(true);
    }, child: BlocBuilder<PetsBloc, PetsState>(builder: (context, state) {
      items = (state.pets != null ? state.pets : [])!;
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return AppBarTabs(
        title: state.title,
        pageBack: 'apartment',
        onTap: (value) => {
          if (value == 0)
            {BlocProvider.of<FormpetBloc>(context).add(ResetForm(context))},
          BlocProvider.of<PetsBloc>(context).add(ChangeIndex(value))
        },
        index: state.indexTab,
        tabsTitle: [
          {
            'title': Row(
              children: [
                Text('Mis Mascotas'),
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
          PetsList(),
          PetsForm(),
        ],
      );
    }));
  }
}
