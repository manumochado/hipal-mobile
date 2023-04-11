import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedLike/classifieds_like_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'modal.dart';

class MyClassifiedsList extends StatefulWidget {
  @override
  _MyClassifiedsList createState() => _MyClassifiedsList();
}

class _MyClassifiedsList extends State<MyClassifiedsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    BlocProvider.of<ClassifiedsLikeBloc>(context).add(ResetClassifiedLike());
    super.initState();
  }

  List<Classified> items = [];
  List<Classified> itemsModel = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassifiedsBloc, ClassifiedsState>(
        builder: (context, state) {
      items = state.userClassifieds;
      itemsModel = state.userClassifieds;
      return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Color(0xFFF9FAFE),
        ),
        child: items.length == 0
            ? Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                height: 40,
                child: state.isLoadingUserClassifieds
                    ? CircularProgressIndicator(
                        color: const Color(0xff6456EB),
                      )
                    : Text("No hay información para mostrar",
                        style: TextStyle(
                            color: Color(0xff6456EB),
                            fontSize: 19,
                            fontWeight: FontWeight.w400)))
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                onRefresh: () async {
                  BlocProvider.of<ClassifiedsBloc>(context)
                      .add(LoadUserClassifieds(context, refresh: true));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<ClassifiedsBloc>(context)
                      .add(LoadUserClassifieds(context));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.loadComplete();
                },
                child: items.length > 0
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (c, i) => _classifiedCard(i),
                        itemCount: items.length,
                        // ],
                      )
                    : Container(),
              ),
      );
    });
  }

  void _deleteClassified(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el clasificado?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<ClassifiedsBloc>(context)
                        .add(DeleteUserClassified(context, id));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  showModal(Classified classified, Classified classifiedModel, int index,
      BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (BuildContext context) {
          return Modal(
              classified: classified,
              classifiedModel: classifiedModel,
              contextOrigin: context);
        });
  }

  Widget _classifiedCard(int i) {
    return BlocBuilder<ClassifiedsBloc, ClassifiedsState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        return Card(
          color: Color(0xffF2F0FA),
          child: ListTile(
            leading: (items[i].images == null || items[i].images!.length == 0)
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
                        image: NetworkImage(items[i].images![0].url != null
                            ? items[i].images![0].url.toString()
                            : ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[i].title != null ? items[i].title.toString() : '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  items[i].price != null
                      ? 'COP \$${NumberFormat.currency(locale: 'eu', symbol: '').format(items[i].price)}'
                      : '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xff0ff897EFD)),
                ),
              ],
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Publicado el dia ${items[i].createdAtLocal}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color(0xff5C5D87)),
              ),
            ),
            trailing: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {
                  showModal(items[i], itemsModel[i], i, context);
                }),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
