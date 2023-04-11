import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/advertisements_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/management%20Reports/managementReports_bloc.dart';
import 'package:hipal/components/Management/advertisements/model/managementReport.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DocumentsAdversiments extends StatefulWidget {
  int i;
  DocumentsAdversiments(this.i, {Key? key}) : super(key: key);

  @override
  State<DocumentsAdversiments> createState() => _DocumentsAdversimentsState(i);
}

class _DocumentsAdversimentsState extends State<DocumentsAdversiments> {
  int i;
  final _controller = TextEditingController();
  List<ManagementReport> items = [];
  bool loadFinished = false;

  @override
  void initState() {
    BlocProvider.of<ManagementReportsBloc>(context)
        .add(LoadRefreshManagementReports(context));
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  _DocumentsAdversimentsState(this.i);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagementReportsBloc, ManagementReportsState>(
      builder: (context, state) {
        items =
            (state.managementReports != null ? state.managementReports : [])!;
        print('los documentos items $items');
        return Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Color(0xFF6456EB),
            centerTitle: true,
            title: Text(
              'Informes de Gestión',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment(0, 2.0),
                    colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                  ),
                ),
                height: 150,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _search_field(),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                      ),
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 130),
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
                          BlocProvider.of<ManagementReportsBloc>(context)
                              .add(LoadRefreshManagementReports(context));
                          await Future.delayed(Duration(milliseconds: 1000));
                          _refreshController.refreshCompleted();
                        },
                        onLoading: () async {
                          BlocProvider.of<ManagementReportsBloc>(context)
                              .add(LoadRefreshManagementReports(context));
                          await Future.delayed(Duration(milliseconds: 1000));
                          _refreshController.loadComplete();
                        },
                        child: items.length > 0
                            ? Container(
                                margin: EdgeInsets.only(top: 20),
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (c, i) =>
                                      _adversimentsDocumentCard(i),
                                  itemCount: items.length,
                                  // ],
                                ),
                              )
                            : Container(),
                      ),
              ),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      },
    );
  }

  Widget _adversimentsDocumentCard(int i) {
    return BlocBuilder<ManagementReportsBloc, ManagementReportsState>(
        builder: (context, state) {
      List<String> arrMonth = [
        'En',
        'Feb',
        'Mar',
        'Abr',
        'May',
        'Jun',
        'Jul',
        'Agt',
        'Sep',
        'Oct',
        'Nov',
        'Dic'
      ];
      String date = DateFormat('yyyy-MM-dd')
          .format(items[i].documents![0].createdAt as DateTime);
      DateTime dateMod = DateFormat('yyyy-MM-dd').parse(date);
      if (i <= items.length - 1) {
        return Card(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          color: Color(0xffF2F0FA),
          child: ListTile(
            leading: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
              ),
              child: Image.asset('assets/images/logoPDF.png'),
            ),
            title: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Nombre:',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: Color(0xff5C5D87)),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          items[i].name != null ? items[i].name.toString() : '',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xff5C5D87)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Fecha:',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: Color(0xff5C5D87)),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                          child: Text(
                        items[i].documents != null
                            ? '${dateMod.day} ${arrMonth[dateMod.month - 1]} ${dateMod.year}'
                            : '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff5C5D87)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Por:',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Color(0xff5C5D87)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          items[i].from != null ? items[i].from.toString() : '',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xff5C5D87)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            trailing: IconButton(
                onPressed: () => {
                      launch(items[i].documents != null
                          ? items[i].documents![0].url.toString()
                          : '')
                    },
                icon: Image.asset('assets/images/dowloadDocument.png')),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _search_field() {
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
              hintText: 'Buscar...',
              hintStyle: TextStyle(color: Color(0xff9FA7B8), fontSize: 14),
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
                        context.read<ManagementReportsBloc>().add(
                            searchManagementReports(context, _controller.text));
                      })),
            ),
          ),
        ),
      );
    });
  }
}
