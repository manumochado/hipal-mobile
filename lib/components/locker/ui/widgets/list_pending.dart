import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/widgets/list_view_item.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/white_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../bloc/lockers_bloc.dart';
import '../../model/locker.dart';

class ListPending extends StatefulWidget{

  @override
  _ListPending createState() => _ListPending();

}

class _ListPending extends State<ListPending>{
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<Locker> items =  [];
  bool loadFinished = false;

  Widget build(BuildContext context) {
    return BlocBuilder<LockersBloc, LockersState>(builder: (context, state) {
      items = (state.lockersPending!=null ? state.lockersPending : [])!;
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
          Text("No hay paquetes pendientes para mostar",
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
              BlocProvider.of<LockersBloc>(context).add( LoadRefreshLocker(context,"Pendiente") );
              await Future.delayed(Duration(milliseconds: 1000));
              // if failed,use refreshFailed()
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              BlocProvider.of<LockersBloc>(context).add( LoadMoreLocker(context,"Pendiente") );
              await Future.delayed(Duration(milliseconds: 1000));

              _refreshController.loadComplete();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) =>
              items[i].state=="Pendiente" ? ListViewItem( items[i], 52, contentPopup(items[i], context)): Container(),
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
                item.descriptionState.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.0, //18 on figma?
                    color: Color(0xFF5C5D87)
                ),
              ),
            ],
          ),
        ),
        WhiteButton("Rechazar", (){
          BlocProvider.of<LockersBloc>(context).add( EditLocker(context, item.id.toString(), "Devuelto") );
          Navigator.of(context, rootNavigator: true).pop();
          Alert(
              context: context,
              content: confirmPopup("Tu correspondencia ha sido Rechazada exitosamente. ¡Gracias!", "Entendido", context),
              style: AlertStyle(
                  isButtonVisible: false,
                  isCloseButton: false
              )
          ).show();
        }, true, 0xFF7E72FF, EdgeInsets.only(bottom: 14.0)),
        GradientButton("Confirmar", (){
          BlocProvider.of<LockersBloc>(context).add( EditLocker(context, item.id.toString(), "Entregado") );
          Navigator.of(context, rootNavigator: true).pop();
          Alert(
              context: context,
              content: confirmPopup("Tu correspondencia ha sido confirmada exitosamente, para finalizar la entrega debes recogerla en la porteria del edificio. ¡Gracias!", "Entendido", context),
              style: AlertStyle(
                  isButtonVisible: false,
                  isCloseButton: false
              )
          ).show();
        },
            null
        )
      ],

    );

  }

  confirmPopup(description, text_button, context){
    return Column(
      children:[
        Container(
          margin: EdgeInsets.only(
              top: 45.0,
              bottom: 24.0
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            height: 95.0,
            width: 117.0,
            child: ClipRRect(
                child: Image.asset(
                  "assets/images/ok_check.png",
                  isAntiAlias: true,
                  fit: BoxFit.fill,
                )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                bottom: 26.0
            ),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0
              ),
            )
        ),
        GradientButton(text_button,()=>{Navigator.of(context, rootNavigator: true).pop()}, null)
      ],
    );
  }
}