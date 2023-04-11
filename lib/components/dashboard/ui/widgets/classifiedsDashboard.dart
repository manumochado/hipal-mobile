import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../publications/bloc/publications_by_residential_bloc.dart';
import '../../../publications/model/publication_in_list_by_residential.dart';

class DashboardClassifiedsList extends StatefulWidget {
  @override
  _DashboardClassifiedsList createState() => _DashboardClassifiedsList();
}

class _DashboardClassifiedsList extends State<DashboardClassifiedsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<PublicationInListByResidential> items = [];
  bool loadFinished = false;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      try {
        setState(() {
          loadFinished = true;
        });
      } catch (e) {}
    });
    return BlocBuilder<PublicationsByResidentialBloc,
        PublicationsByResidentialState>(builder: (context, state) {
      items = (state.publications.length > 0 ? state.publications : []);
      return Container(
        height: 130,
        child: items.length == 0
            ? Container(
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
                            fontWeight: FontWeight.w400)),
              )
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                onRefresh: () async {
                  BlocProvider.of<PublicationsByResidentialBloc>(context)
                      .add(LoadRefreshPublicationsByResidential(context));
                  await Future.delayed(Duration(milliseconds: 3000));
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<PublicationsByResidentialBloc>(context)
                      .add(LoadRefreshPublicationsByResidential(context));
                  await Future.delayed(Duration(milliseconds: 3000));
                  _refreshController.loadComplete();
                },
                child: items.length > 0
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) => _classifiedCard(i),
                        itemCount: items.length,
                        // ],
                      )
                    : Container(),
              ),
      );
    });
  }

  Widget _classifiedCard(int i) {
    return BlocBuilder<PublicationsByResidentialBloc,
        PublicationsByResidentialState>(builder: (context, state) {
      if (i <= items.length - 1) {
        return InkWell(
          onTap: () {
            BlocProvider.of<PublicationsByResidentialBloc>(context)
                .add(LoadRefreshPublicationsByResidential(context));
            BlocProvider.of<PublicationsByResidentialBloc>(context)
                .add(LoadRefreshPublicationsByResidential(context));
            /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                DetailsClassified(classified: items[i])),
            );*/
          },
          child: Card(
            color: '#f2f0fa'.toColor(),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: '#f2f0fa'.toColor()),
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Container(
              width: 250,
              height: 105,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  (items[i].file == null)
                      ? Container(
                          width: 82.0,
                          height: 82.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.0)),
                          ),
                        )
                      : Container(
                          width: 82.0,
                          height: 82.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFE),
                            image: DecorationImage(
                              image: NetworkImage(
                                items[i].file ??
                                    'https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.0)),
                          ),
                        ),
                  Expanded(
                    child: Container(
                      width: 170,
                      margin: EdgeInsets.only(top: 25, left: 15, right: 10),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[i].provider?.company?.name != null
                                ? items[i].provider!.company!.name.toString()
                                : '',
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color(0xff5C5D87)),
                          ),
                          Text(
                            items[i].text != null ? items[i].text : '',
                            softWrap: true,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color(0xff0ff897EFD)),
                          ),
                          SizedBox(height: 15),
                          Text(
                            //'${items[i].date!.day} ${arrMonth[items[i].date!.month - 1]}, ${days[items[i].date!.weekday - 1]}',
                            'Publicado ${items[i].createdAtLocal}',
                            softWrap: true,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color(0xff5C5D87)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
