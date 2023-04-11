import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/coownership_budget/bloc/coownership_bloc.dart';
import 'package:hipal/components/coownership_budget/ui/widgets/list_inversion_projects.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';


class CoownershipScreen extends StatefulWidget{
  @override
  createState() => _CoownershipScreen();

}

class _CoownershipScreen extends State<CoownershipScreen>{

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CoownershipBloc>(context).add( LoadRefreshCoownership(context));
    BlocProvider.of<CoownershipBloc>(context).add(ChangeFromScreen("dashboard"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
        onWillPop: () async{
          Navigator.pushReplacementNamed(context, BlocProvider.of<CoownershipBloc>(context).state.fromScreen);
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBarBackSearch(
            color_buttons: 0xFFFFFFFF,
            color_title: 0xFFFFFFFF,
            name_title: 'Presupuesto de la copropiedad',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'dashboard',
          ),
          body: Stack(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment(0, 2.0),
                      colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                    ),
                  ),
                  child: Text(
                    "Proyectos de inversión",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                    ),
                  )),
              Container(
                  height: MediaQuery.of(context).size.height-125,
                  margin: EdgeInsets.only(top: 125, bottom: 70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Color(0xFFFFFFFF)),
                  child: ListInversionProjects()
              ),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        )
    );
  }


}

