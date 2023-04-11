import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/attentionResident/bloc/directoryCollaborator_bloc.dart';
import 'package:hipal/components/Management/bankAccounts/bloc/bankAccount_bloc.dart';
import 'package:hipal/components/Management/bankAccounts/model/bankAccount.dart';
import 'package:hipal/components/commonZones/model/times.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BankAccounts extends StatefulWidget {
  BankAccounts({Key? key}) : super(key: key);

  @override
  State<BankAccounts> createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> {
  bool loadFinished = false;
  @override
  void initState() {
    BlocProvider.of<BankAccountBloc>(context)
        .add(LoadRefreshLoadBankAccount(context));
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<BankAccount> items = [];
  List<Times> itemsScheduele = [];
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      try {
        setState(() {
          loadFinished = true;
        });
      } catch (e) {}
    });
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<BankAccountBloc, BankAccountState>(
      builder: (context, state) {
        items = (state.bankAccounts != null ? state.bankAccounts : [])!;
        return Scaffold(
          appBar: AppBarBackSearch(
            color_buttons: 0xFFFFFFFF,
            color_title: 0xFFFFFFFF,
            name_title: 'Cuentas Bancarias',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'dashboard',
          ),
          body: Container(
            child: Stack(
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
                      //poner imagen global de bancos
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          ),
                          child: Container()),
                      //_infoUser()
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
                          height: 90,
                          child: !loadFinished
                              ? CircularProgressIndicator(
                                  color: const Color(0xff6456EB),
                                )
                              : Text("No hay información para mostrar",
                                  style: TextStyle(
                                      color: Color(0xff6456EB),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400)),
                        )
                      : SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          controller: _refreshController,
                          onRefresh: () async {
                            BlocProvider.of<DirectoryCollaboratorBloc>(context)
                                .add(LoadRefreshSchedueleResident(context));
                            await Future.delayed(Duration(milliseconds: 1000));
                            _refreshController.refreshCompleted();
                          },
                          onLoading: () async {
                            BlocProvider.of<DirectoryCollaboratorBloc>(context)
                                .add(LoadRefreshSchedueleResident(context));
                            await Future.delayed(Duration(milliseconds: 1000));
                            _refreshController.loadComplete();
                          },
                          child: items.length > 0
                              ? Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (c, i) => _backAccountsCard(i),
                                    itemCount: items.length,
                                    // ],
                                  ),
                                )
                              : Container(),
                        ),
                ),
              ],
            ),
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      },
    ));
  }

  Widget _backAccountsCard(int i) {
    print("valor de i:  $i");
    return BlocBuilder<BankAccountBloc, BankAccountState>(
        builder: (context, state) {
      print(items.length);
      if (i <= items.length - 1) {
        return Column(
          children: [
            Container(
                child: ListTile(
              leading: (items[i].image == null || items[i].image == '')
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
                          image: NetworkImage(items[i].image!.url != null
                              ? items[i].image!.url.toString()
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
                    items[i].bank != null ? items[i].bank!.name.toString() : '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    items[i].accountNumber != null
                        ? items[i].accountNumber.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Color(0xff9FA7B8)),
                  ),
                ],
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Titular',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                    Text(
                      items[i].residential?.name != null
                          ? items[i].residential!.name.toString()
                          : '',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xff9FA7B8)),
                    ),
                  ],
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[i].accountType?.name != null
                        ? items[i].accountType!.name.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xff343887)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'ID',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xff343887)),
                  ),
                  Text(
                    items[i].idBank != null ? items[i].idBank.toString() : '',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xff343887)),
                  ),
                ],
              ),
              onTap: () => {},
            )),
            BorderLine(2, 10, 10, 0xffE5E5EF)
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
