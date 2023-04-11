import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedLike/classifieds_like_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:hipal/components/classifieds/ui/widgets/detailsClassified.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BuildingClassifiedsList extends StatefulWidget {
  @override
  _BuildingClassifiedsList createState() => _BuildingClassifiedsList();
}

class _BuildingClassifiedsList extends State<BuildingClassifiedsList> {
  void initState() {
    BlocProvider.of<ClassifiedsLikeBloc>(context).add(ResetClassifiedLike());
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Classified> items = [];
  List<Classified> itemsModel = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassifiedsBloc, ClassifiedsState>(
        builder: (context, state) {
      items = state.generalClassifieds;
      itemsModel = state.generalClassifieds;
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
                child: state.isLoadingGeneralClassifieds
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
        return Card(
          color: Color(0xffF2F0FA),
          child: ListTile(
            leading: (items[i].images!.length == 0)
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
                  items[i].title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  'COP \$${NumberFormat.currency(locale: 'eu', symbol: '').format(items[i].price)}',
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
            onTap: () {
              context
                  .read<ClassifiedsBloc>()
                  .add(LoadDetailClassified(classified: items[i]));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsClassified(owner: 'admin'),
                ),
              );
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
