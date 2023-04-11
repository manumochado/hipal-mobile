import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/assemblyComment/assembly_comment_bloc.dart';
import 'package:hipal/components/assembly/model/commentAssembly.dart';
import 'package:hipal/widgets/appbar_back_widget.dart';
import 'package:intl/intl.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore: must_be_immutable
class ListCommentAssembly extends StatefulWidget {

  ListCommentAssembly();

  @override
  State<ListCommentAssembly> createState() => _ListCommentAssemblyState();
}

class _ListCommentAssemblyState extends State<ListCommentAssembly> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<CommentAssembly> items = [];
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
    }, child: BlocBuilder<AssemblyCommentBloc, AssemblyCommentState>(
        builder: (context, state) {
      items = (state.commentAssemblies != null ? state.commentAssemblies : [])!;
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
                  BlocProvider.of<AssemblyCommentBloc>(context).add(
                      LoadARefreshCommentAssembly(
                          context, ''));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<AssemblyCommentBloc>(context).add(
                      LoadMoreCommentsAssembly(
                          context, ''));
                  await Future.delayed(Duration(milliseconds: 1000));

                  _refreshController.loadComplete();
                },
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (contex, i) {
                      return _deliveryCard(i);
                    })),
      );
    }));
  }

  Widget _deliveryCard(int i) {
    return BlocBuilder<AssemblyCommentBloc, AssemblyCommentState>(
        builder: (context, state) {
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
                    TextButton(
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
                    BlocProvider.of<AssemblyCommentBloc>(context)
                        .add(DeleteCommentAssembly(context, id));
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
