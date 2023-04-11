import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/locker/bloc/lockers_bloc.dart';
import 'package:hipal/widgets/list_view_item.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/locker.dart';

class ListReturned extends StatefulWidget{

  createState() => _ListReturned();

}

class _ListReturned extends State<ListReturned>{

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<Locker> items =  [];
  bool loadFinished = false;


  Widget build(BuildContext context) {
    return BlocBuilder<LockersBloc, LockersState>(builder: (context, state) {
      items = (state.lockersReturned!=null ? state.lockersReturned : [])!;
      print("total retornados: ${items.length}");
      Timer(const Duration(seconds: 5), (){
        try{
          setState(() {
            loadFinished = true;
          });
        }catch(e){}
      });
      if(items.length== 0){
        return Container(
          margin: EdgeInsets.only(
              top: 50
          ),
          alignment: Alignment.center,
          height: 40,
          child: !loadFinished ? CircularProgressIndicator(color: const Color(0xff6456EB),) :
          Text("No hay paquetes retornados para mostar",
              style: TextStyle(
                  color: Color(0xff6456EB),
                  fontSize: 19,
                  fontWeight: FontWeight.w400
              )
          ),
        );
      }else {
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: () async {
              BlocProvider.of<LockersBloc>(context).add( LoadRefreshLocker(context, "Devuelto") );
              await Future.delayed(Duration(milliseconds: 1000));
              // if failed,use refreshFailed()
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              BlocProvider.of<LockersBloc>(context).add( LoadMoreLocker(context,"Devuelto") );
              await Future.delayed(Duration(milliseconds: 1000));

              _refreshController.loadComplete();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) =>
              (items[i].state=="Entregado" || items[i].state=="Devuelto") ? ListViewItem( items[i], 52, contentPopup(items[i], context)): Container(),
              itemCount: items.length,
              // ],
            )
        );
      }
    });
  }

  rowTitle(text){
    return Text(
      text,
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF8378FC)
      ),
    );
  }

  rowText(title, decription){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: Color(0xFF9FA7B8)
          ),
        ), Text(
          decription,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13.0, //18 on figma?
              color: Color(0xFF5C5D87)
          ),
        )
      ],
    );
  }

  contentPopup(Locker item ,context){
    return Column(
      children:[
        Container(
          margin: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 13.0,
              bottom: 23.0
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            child: ClipRRect(
              child: (item.image==null || item.image=='') ?
              Container(
                width: 150.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: const Color(0xff6456EB),
                  borderRadius: BorderRadius.all( Radius.circular(19.0)),
                ),
              ) : Container(
                width: 150.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: const Color(0xff6456EB),
                  image: DecorationImage(
                    image: NetworkImage(item.image!.url != null ? item.image!.url.toString() : ''),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all( Radius.circular(19.0)),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: 26.0
          ),
          child: Column(
            children: [
              rowText("Para:", item.recipientName),
              rowText("Evia:", item.sender),
              rowText("Fecha:", item.date != null ? DateFormat('yyyy/MM/dd').format(item.date!) : ''),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(
              bottom: 9.0
          ),
          child: rowTitle("Información portería:"),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: 26.0
          ),
          child: Column(
            children: [
              rowText("Recibe:", item.receivesName),
              rowText("Fecha y hora:", item.createdAt != null ? DateFormat('yyyy/MM/dd - HH:mm').format(item.createdAt!) : ''),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(
              bottom: 9.0
          ),
          child: rowTitle("Información entrega:"),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: 51.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowText("Fecha:", item.dateState != null ? DateFormat('yyyy/MM/dd - HH:mm').format(item.dateState!) : ''),
              rowText("Estado:", item.state),
              Text(
                "Descripción",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Color(0xFF9FA7B8)
                ),
              ),
              Text(
                item.descriptionState != null ? item.descriptionState.toString() : "No se proporcionó una descripción",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.0, //18 on figma?
                    color: Color(0xFF5C5D87)
                ),
              ),
            ],
          ),
        ),
        GradientButton("Cerrar",()=>{Navigator.of(context, rootNavigator: true).pop()}, null)
      ],

    );

  }

}