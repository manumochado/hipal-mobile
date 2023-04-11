import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hipal/components/directory/bloc/directory_bloc.dart';
import 'package:hipal/components/directory/model/directory_residential.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ListDirectoryResidential extends StatefulWidget {
  @override
  createState() => _ListDirectoryResidential();
}

class _ListDirectoryResidential extends State<ListDirectoryResidential> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DirectoryBloc>(context)
        .add(LoadRefreshDirectoryResidential(context));
  }

  List<DirectoryResidential> items = [];
  final _controller = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool loadFinished = false;

  Widget build(BuildContext context) {
    // TODO: implement build
    try {
      Timer(const Duration(seconds: 10), () {
        setState(() {
          loadFinished = true;
        });
      });
    } catch (e) {}
    return BlocBuilder<DirectoryBloc, DirectoryState>(
        builder: (context, state) {
      items = (state.listDirectoryResidential != null
          ? state.listDirectoryResidential
          : [])!;
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
                        fontWeight: FontWeight.w400)));
      } else {
        return Container(
          padding: EdgeInsets.only(bottom: 65),
          child: Column(
            children: [
              _search_field(),
              Expanded(
                  child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      controller: _refreshController,
                      onRefresh: () async {
                        BlocProvider.of<DirectoryBloc>(context)
                            .add(LoadRefreshDirectoryEmergency(context));
                        await Future.delayed(Duration(milliseconds: 1000));
                        // if failed,use refreshFailed()
                        _refreshController.refreshCompleted();
                      },
                      onLoading: () async {
                        BlocProvider.of<DirectoryBloc>(context)
                            .add(LoadMoreDirectoryResidential(context));
                        await Future.delayed(Duration(milliseconds: 1000));
                        _refreshController.loadComplete();
                      },
                      child: items.length > 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (c, i) => _directoryEmergencyItem(i),
                              itemCount: items.length,
                              // ],
                            )
                          : Container()))
            ],
          ),
        );
      }
    });
  }

  Widget _search_field() {
    return BlocBuilder<DirectoryBloc, DirectoryState>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            controller: _controller,
            autocorrect: false,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              suffixIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                    ),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.search,
                          size: 25, color: Color(0xffffffff)),
                      onPressed: () {
                        context.read<DirectoryBloc>().add(
                            searchDirectoryResidential(
                                context, _controller.text));
                      })),
            ),
          ),
        ),
      );
    });
  }

  Widget _directoryEmergencyItem(int i) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          child: ListTile(
            leading: (items[i].photo == null)
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
                        image: NetworkImage(items[i].photo?.url != null
                            ? items[i].photo!.url.toString()
                            : ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
            title: Text(
              items[i].name != null
                  ? "${items[i].name.toString()} ${items[i].lastName.toString()}"
                  : '',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              items[i].position != null ? items[i].position.toString() : '',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              _onAlertWithCustomContentPressed(
                  contentPopup(items[i], context), context)
            },
            trailing: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 37,
                  height: 37,
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    /*items[i].phone != null ? items[i].phone.toString() :*/ '',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF8378FC)),
                  ),
                ),
                Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: const LinearGradient(
                        colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                      ),
                    ),
                    child: IconButton(
                        icon: Image.asset('assets/images/iconTelephone.png'),
                        onPressed: () async {
                          FlutterPhoneDirectCaller.callNumber(
                              items[i].phone.toString());
                        }
                        //child: Text('Call Number'),
                        )),
              ],
            ),
          ),
        ));
  }

  contentPopup(DirectoryResidential item, context) {
    return Column(
      children: [
        Row(
          children: [
            (item.photo == null)
                ? Container(
                    width: 54.0,
                    height: 54.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  )
                : Container(
                    width: 54.0,
                    height: 54.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      image: DecorationImage(
                        image: NetworkImage(item.photo?.url != null
                            ? item.photo!.url.toString()
                            : ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(
                left: 18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name != null
                        ? "${item.name.toString()} ${item.lastName.toString()}"
                        : '',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF343887),
                    ),
                  ),
                  Text(
                    item.position != null ? item.position.toString() : '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF343887),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 25,
            ),
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: const LinearGradient(
                colors: [Color(0xff8C81FE), Color(0xff776BF8)],
              ),
            ),
            child: IconButton(
                icon: Image.asset('assets/images/iconTelephone.png'),
                onPressed: () async {
                  FlutterPhoneDirectCaller.callNumber(item.phone.toString());
                }
                //child: Text('Call Number'),
                )),
        rowText("Correo electrónico", item.email != null ? item.email! : ""),
        rowText("Número de contacto", item.phone != null ? item.phone! : ""),
        rowText("Empresa", item.nameCompany != null ? item.nameCompany! : ""),
        rowText("Estado", item.stated != null ? item.stated! : ""),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        GradientButton("Cerrar", () {
          Navigator.of(context, rootNavigator: true).pop();
        }, null)
      ],
    );
  }

  _onAlertWithCustomContentPressed(content, context) {
    Alert(
            context: context,
            content: content,
            style: AlertStyle(isButtonVisible: false, isCloseButton: false))
        .show();
  }

  rowText(title, decription) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: Color(0xFF9FA7B8)),
        ),
        Text(
          decription,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13.0, //18 on figma?
              color: Color(0xFF5C5D87)),
        ),
        Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 150,
            color: Color(0xFFC9C7DB),
            margin: EdgeInsets.only(
              top: 9,
              bottom: 19,
            )),
      ],
    );
  }
}
