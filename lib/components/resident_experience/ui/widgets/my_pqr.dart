import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'list_view_item_pqr.dart';

class MyPqr extends StatefulWidget {
  createState() => _MyPqr();
}

class _MyPqr extends State<MyPqr> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResidentExperienceBloc, ResidentExperienceState>(
        builder: (context, state) {
      ;
      if (state.pqrs.length == 0) {
        return Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          height: 40,
          child: state.isLoadingPqrs
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
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: () async {
              BlocProvider.of<ResidentExperienceBloc>(context)
                  .add(LoadResidentExperiences(context, refresh: true));
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              BlocProvider.of<ResidentExperienceBloc>(context)
                  .add(LoadResidentExperiences(context));
              await Future.delayed(Duration(milliseconds: 1000));
              _refreshController.loadComplete();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, i) => ListViewItemPqr(
                pqr: state.pqrs[i],
              ),
              itemCount: state.pqrs.length,
            ));
      }
    });
  }
}
