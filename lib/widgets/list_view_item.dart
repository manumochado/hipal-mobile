import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/locker/bloc/lockers_bloc.dart';
import '../components/locker/model/locker.dart';
import 'gradient_button.dart';

// ignore: must_be_immutable
class ListViewItem extends StatefulWidget {
  Locker locker;
  double? size;
  Widget content;

  ListViewItem( this.locker,this.size, this.content);

  @override
  // ignore: no_logic_in_create_state
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {


  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white
    );

    return BlocBuilder<LockersBloc, LockersState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
        decoration: decoration,
        child: ListTile(
          leading: (widget.locker.image==null || widget.locker.image=='') ?
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xff6456EB),
              borderRadius: BorderRadius.all( Radius.circular(19.0)),
            ),
          ) : Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xff6456EB),
              image: DecorationImage(
                image: NetworkImage(widget.locker.image!.url != null ? widget.locker.image!.url.toString() : ''),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all( Radius.circular(19.0)),
            ),
          ),
          title: Text(
            widget.locker.recipientName.toString(),
            style: const TextStyle(
              color: Color(0xff343887),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle:  Text(
            widget.locker.sender.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color(0xff343887),
              fontSize: 12,
            ),
          ),
          trailing: PopupMenuButton(
              elevation: 20,
              enabled: true,
              icon: Icon(Icons.more_vert, color: Color(0xFF8075FB)),
              onSelected: (value) {
                setState(() {
                  print(value);
                  if(value == 1){
                    _onAlertWithCustomContentPressed(widget.content, context);
                  }
                });
              },
              itemBuilder:(context) => [
                PopupMenuItem(
                  child: Text("Ver", style: TextStyle(color: Color(0xFF343887) ),),
                  value: 1,
                ),
                /*PopupMenuItem(
                  child: Text("Descartar", style: TextStyle(color: Color(0xFF343887) )),
                  value: 2,
                ),*/
              ]
          ),
        ),
      );
    });
  }

  _onAlertWithCustomContentPressed(content, context) {
    Alert(
        context: context,
        content: content,
        style: AlertStyle(
            isButtonVisible: false,
            isCloseButton: false
        )
    ).show();
  }
}
