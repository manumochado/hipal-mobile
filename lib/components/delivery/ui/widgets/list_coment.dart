import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hipal/components/delivery/bloc/comment_bloc/comment_bloc.dart';
import 'package:hipal/components/delivery/model/comment.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_widget.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListComment extends StatefulWidget {
  final idParams;
  String idUser;

  ListComment({required this.idParams, required this.idUser});

  @override
  State<ListComment> createState() => _ListCommentState(idUser);
}

class _ListCommentState extends State<ListComment> {
  String idUser;
  _ListCommentState(this.idUser);
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Comment> items = [];
  bool loadFinished = false;

  @override
  Widget build(BuildContext context) {
    try {
      Timer(const Duration(seconds: 5), () {
        setState(() {
          loadFinished = true;
        });
      });
    } catch (e) {}
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      items = (state.comment != null ? state.comment : [])!;
      return Scaffold(
        appBar: AppBarBackWidget(
          color_buttons: 0xFF8075FB,
          color_title: 0xFF8075FB,
          name_title: 'Lista comentarios',
          color_background: 0xFFFFFFFF,
          with_search: false,
        ),
        body: items.length == 0
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
                            fontWeight: FontWeight.w400)))
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                onRefresh: () async {
                  BlocProvider.of<CommentBloc>(context).add(
                      LoadARefreshComment(context, widget.idParams.toString()));
                  await Future.delayed(Duration(milliseconds: 1000));
                  // if failed,use refreshFailed()
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<CommentBloc>(context).add(
                      LoadMoreCommentsDeliveries(
                          context, widget.idParams.toString()));
                  await Future.delayed(Duration(milliseconds: 1000));

                  _refreshController.loadComplete();
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (contex, i) {
                    return _deliveryCard(i);
                  },
                ),
              ),
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    }));
  }

  Widget _deliveryCard(int i) {
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      if (i <= items.length - 1) {
        String date = DateFormat('yyyy-MM-dd').format(items[i].createdAt!);
        DateTime dateMod = DateFormat('yyyy-MM-dd').parse(date);
        List<String> days = [
          'Lunes',
          'Martes',
          'Miercoles',
          'Jueves',
          'Viernes',
          'Sabado',
          'Domingo'
        ];
        List<String> arrMonth = [
          'Enero',
          'Febrero',
          'Marzo',
          'Abril',
          'Mayo',
          'Junio',
          'Julio',
          'Agosto',
          'Septiembre',
          'Octubre',
          'Noviembre',
          'Diciembre'
        ];

        return Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Color(0xffF7F7FB)),
          child: ListTile(
            leading: SizedBox(
              child: ClipRRect(
                child: (items[i].user?.photo?.url == null ||
                        items[i].user?.photo!.url == '')
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
                            image: NetworkImage(
                                items[i].user?.photo?.url != null
                                    ? items[i].user!.photo!.url.toString()
                                    : ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                      ),
              ),
            ),
            title: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '${items[i].user?.firstname} ${items[i].user?.lastname} ',
                style: TextStyle(
                    color: Color(0xff343887),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    '${items[i].message}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Color(0xFF343887), fontSize: 13, height: 1.7),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        '${days[dateMod.weekday - 1]}, ${dateMod.day} ${arrMonth[dateMod.month - 1]}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color(0xFF343887), fontSize: 13),
                      ),
                    ),
                    items[i].user!.id == widget.idUser
                        ? TextButton(
                            onPressed: () {
                              _deleteComment(context, items[i].id.toString());
                            },
                            child: const Text(
                              'Eliminar',
                              style: TextStyle(
                                color: Color(0xff8378FC),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  void _deleteComment(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el comentario?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<CommentBloc>(context)
                        .add(DeleteCommentDelivery(context, id));
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
}
