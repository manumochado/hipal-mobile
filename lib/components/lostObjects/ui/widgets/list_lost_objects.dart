import 'dart:async';

import 'package:hipal/components/lostObjects/ui/screens/info_lost_object_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/lostObjects/bloc/lost_object_bloc.dart';
import 'package:hipal/components/lostObjects/model/lost_object.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListLostObjects extends StatefulWidget {
  @override
  createState() => _ListLostObjects();
}

class _ListLostObjects extends State<ListLostObjects> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<LostObject> items = [];
  bool loadFinished = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LostObjectBloc>(context)
        .add(LoadRefreshLostObject(context));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Timer(const Duration(seconds: 10), () {
      setState(() {
        loadFinished = true;
      });
    });
    return BlocBuilder<LostObjectBloc, LostObjectState>(
        builder: (context, state) {
      items = (state.lostObjects != null ? state.lostObjects : [])!;
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
                      fontWeight: FontWeight.w400)),
        );
      } else {
        return Expanded(
            child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                onRefresh: () async {
                  BlocProvider.of<LostObjectBloc>(context)
                      .add(LoadRefreshLostObject(context));
                  await Future.delayed(Duration(milliseconds: 1000));
                  // if failed,use refreshFailed()
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<LostObjectBloc>(context)
                      .add(LoadMoreLostObject(context));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.loadComplete();
                },
                child: items.length > 0
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (c, i) => _LostObjectsCard(i),
                        itemCount: items.length,
                        // ],
                      )
                    : Container()));
      }
    });
  }

  Widget _LostObjectsCard(int i) {
    return BlocBuilder<LostObjectBloc, LostObjectState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Card(
              child: ListTile(
                leading: (items[i].images == null ||
                        items[i].images?.length == 0)
                    ? Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff6456EB),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                      )
                    : Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff6456EB),
                          image: DecorationImage(
                            image: NetworkImage(items[i].images?[0].url != null
                                ? items[i].images![0].url.toString()
                                : ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                      ),
                title: Text(
                  items[i].nameObject != null
                      ? items[i].nameObject.toString()
                      : '',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.only(right: 7),
                    child: Icon(
                      const IconData(0xe92a, fontFamily: 'icomoon'),
                      color: Color(0xff8378FC),
                      size: 10,
                    ),
                  ),
                  Text(
                    items[i].dateEntry != null
                        ? DateFormat('yyyy/MM/dd').format(items[i].dateEntry!)
                        : '',
                    style:
                        TextStyle(fontSize: 9.0, fontWeight: FontWeight.w500),
                  ),
                ]),
                onTap: () => {},
                trailing: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: const LinearGradient(
                        colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(const IconData(0xe92b, fontFamily: 'icomoon'),
                          size: 20, color: Color(0xffffffff)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InfoLostObjectScreen(lostObject: i)),
                        );
                      },
                    )),
              ),
            ));
      } else {
        return Container();
      }
    });
  }
}
