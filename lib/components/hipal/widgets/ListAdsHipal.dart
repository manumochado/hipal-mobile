import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/advertisements_bloc.dart';
import 'package:hipal/components/Management/advertisements/model/advertisements.dart';
import 'package:hipal/components/Management/advertisements/ui/screens/detailsAdvertisements.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class hipalAdvertisementsList extends StatefulWidget {
  @override
  _hipalAdvertisementsList createState() => _hipalAdvertisementsList();
}

class _hipalAdvertisementsList extends State<hipalAdvertisementsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Advertisements> items = [];
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
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
        builder: (context, state) {
      items = (state.advertisements != null ? state.advertisements : [])!;
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
                  BlocProvider.of<ClassifiedsBloc>(context)
                      .add(LoadGeneralClassifieds(context, refresh: true));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<ClassifiedsBloc>(context)
                      .add(LoadGeneralClassifieds(context));
                  await Future.delayed(Duration(milliseconds: 1000));
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
    return BlocBuilder<ClassifiedsBloc, ClassifiedsState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        DateTime? date = items[i].createdAt;
        return InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsAdvertisements(i)),
            )
          },
          child: Card(
              color: Color(0xFFE7E4FB),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFE7E4FB)),
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Container(
                width: 250,
                height: 105,
                child: Row(
                  children: [
                    (items[i].image == null || items[i].image == 0)
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
                                image: NetworkImage(items[i].image!.url != null
                                    ? items[i].image!.url.toString()
                                    : ''),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19.0)),
                            ),
                          ),
                    Container(
                      width: 138.0,
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              items[i].theme != null
                                  ? items[i].theme.toString()
                                  : '',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color(0xff5C5D87)),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            //'${items[i].date!.day} ${arrMonth[items[i].date!.month - 1]}, ${days[items[i].date!.weekday - 1]}',
                            items[i].createdAt != null
                                ? 'Publicado ${date?.day.toString()}/${date?.month.toString()}/${date?.year.toString()}'
                                : '',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color(0xff5C5D87)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      } else {
        return Container();
      }
    });
  }
}
