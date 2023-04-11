import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hipal/components/coownership_budget/bloc/coownership_bloc.dart';
import 'package:hipal/components/coownership_budget/model/coownership_budget.dart';
import 'package:hipal/components/coownership_budget/ui/screens/info_coownership_screen.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListInversionProjects extends StatefulWidget {
  @override
  createState() => _ListInversionProjects();
}

class _ListInversionProjects extends State<ListInversionProjects> {
  List<CoownershipBudget> items = [];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool loadFinished = false;
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

  Widget build(BuildContext context) {
    try {
      Timer(const Duration(seconds: 10), () {
        setState(() {
          loadFinished = true;
        });
      });
    } catch (e) {}
    return BlocBuilder<CoownershipBloc, CoownershipState>(
        builder: (context, state) {
      items = (state.listCoownershipBudget != null
          ? state.listCoownershipBudget
          : [])!;
      if (items.length == 0) {
        return Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            height: 40,
            child: !loadFinished
                ? CircularProgressIndicator(
                    color: const Color(0xff6456EB),
                  )
                : Text("No hay información para mostrar",
                    style: TextStyle(
                        color: Color(0xff6456EB),
                        fontSize: 19,
                        fontWeight: FontWeight.w400)));
      } else {
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: () async {
              BlocProvider.of<CoownershipBloc>(context)
                  .add(LoadRefreshCoownership(context));
              await Future.delayed(Duration(milliseconds: 1000));
              // if failed,use refreshFailed()
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              BlocProvider.of<CoownershipBloc>(context)
                  .add(LoadMoreCoownership(context));
              await Future.delayed(Duration(milliseconds: 1000));
              _refreshController.loadComplete();
            },
            child: items.length > 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (c, i) => _coownershipItem(i),
                    itemCount: items.length,
                    // ],
                  )
                : Container());
      }
    });
  }

  Widget _coownershipItem(int i) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          child: ListTile(
            leading: (items[i].image == null)
                ? Container(
                    width: 80.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F0FA),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  )
                : Container(
                    width: 80.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      image: DecorationImage(
                        image: NetworkImage(items[i].image?.url != null
                            ? items[i].image!.url.toString()
                            : ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
            title: Text(
              items[i].nameEgress != null ? items[i].nameEgress.toString() : '',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
            subtitle: Row(
              children: [
                Icon(
                  const IconData(0xe92A, fontFamily: 'icomoon'),
                  color: Color(0xFF8378FC),
                  size: 12,
                ),
                Container(
                  width: 5,
                ),
                Text(
                  items[i].createdAt != null
                      ? "${months[items[i].createdAt!.month]} ${items[i].createdAt!.day} ${items[i].createdAt!.year}"
                      : '',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfoCoownershipScreen(items[i])));
            },
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Inversión",
                  style: TextStyle(
                      color: Color(0xFF343887),
                      fontSize: 9.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  items[i].worth != null
                      ? ' \$${NumberFormat.currency(locale: 'eu', symbol: '').format(items[i].worth)}'
                      : '\$0',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w700,
                      fontSize: 8,
                      color: Color(0xff0ff897EFD)),
                )
              ],
            ),
          ),
        ));
  }
}
