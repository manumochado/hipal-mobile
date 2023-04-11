import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/coownership_budget/bloc/coownership_bloc.dart';
import 'package:hipal/components/coownership_budget/model/coownership_budget.dart';
import 'package:hipal/components/coownership_budget/ui/widgets/list_inversion_projects.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:intl/intl.dart';

class InfoCoownershipScreen extends StatefulWidget {
  CoownershipBudget coownership;

  InfoCoownershipScreen(this.coownership);

  @override
  createState() => _InfoCoownershipScreen();
}

class _InfoCoownershipScreen extends State<InfoCoownershipScreen> {
  List<String> months = [
    "ENE",
    "FEB",
    "MAR",
    "ABR",
    "MAY",
    "JUN",
    "JUL",
    "AGO",
    "SEP",
    "OCT",
    "NOV",
    "DIC"
  ];

  @override
  void initState() {
    BlocProvider.of<CoownershipBloc>(context)
        .add(ChangeFromScreen("coownership"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
        onWillPop: () async {
          print("+++++++++++++ me devuelvo a dashboard");
          Navigator.pushReplacementNamed(context,
              BlocProvider.of<CoownershipBloc>(context).state.fromScreen);
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBarBackSearch(
            color_buttons: 0xFFFFFFFF,
            color_title: 0xFFFFFFFF,
            name_title: 'Presupuesto de la copropiedad',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'coownership',
          ),
          body: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            widget.coownership.image!.url.toString())),
                    shape: BoxShape.rectangle),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, left: 34, right: 34, bottom: 47),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe92A, fontFamily: 'icomoon'),
                                color: Color(0xFF8378FC),
                                size: 20,
                              ),
                              Container(
                                width: 20,
                              ),
                              Text(
                                widget.coownership.createdAt != null
                                    ? "${months[widget.coownership.createdAt!.month]} ${widget.coownership.createdAt!.day} ${widget.coownership.createdAt!.year}"
                                    : '',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5F5E88)),
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          Text(
                            widget.coownership.nameEgress.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8378FC)),
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Proveedor:",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5F5E88)),
                              ),
                              Container(
                                width: 10,
                              ),
                              Text(
                                widget.coownership.provider != null
                                    ? widget.coownership.provider!.nameCompany
                                        .toString()
                                    : "",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF5F5E88)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Fecha:",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5F5E88)),
                              ),
                              Container(
                                width: 10,
                              ),
                              Text(
                                "${widget.coownership.month} ${widget.coownership.year}",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF5F5E88)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Inversión:",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5F5E88)),
                              ),
                              Container(
                                width: 10,
                              ),
                              Text(
                                widget.coownership.worth != null
                                    ? ' \$${NumberFormat.currency(locale: 'eu', symbol: '').format(widget.coownership.worth)}'
                                    : '\$0',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF5F5E88)),
                              )
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "" /*widget.event.description.toString()*/,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5F5E88)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        ));
  }
}
