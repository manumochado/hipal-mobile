import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/wallet/ui/screen/wallet_administration_payable_screen.dart';
import 'package:hipal/components/wallet/ui/screen/wallet_balance_screen.dart';
import 'package:hipal/components/wallet/ui/widgets/services.dart';
import 'package:hipal/components/wallet/ui/widgets/wallet_deposit.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/widgets/appbar_back_search.dart';

import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';
import '../../../user/bloc/user_bloc.dart';
import '../widgets/withdrawals.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return Future.value(true);
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBarBackSearch(
              color_buttons: 0xFFF8F8F8,
              color_title: 0xFFF8F8F8,
              color_background: 0xFF7746e0,
              name_title: "Billetera",
              with_search: false,
              view: 'dashboard',
            ),
            body: Stack(
              children: [
                Container(
                  height: 234.48,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: '#7746e0'.toColor(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  height: 198,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: '#7746e0'.toColor(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Divider(color: Colors.white),
                Column(children: [
                  SizedBox(height: 80),
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    child: Text(
                      '¡Hola, ${context.watch<UserBloc>().state.userForm?.user?.firstname} ${context.watch<UserBloc>().state.userForm?.user?.lastname}!',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Basic Commercial SR Pro',
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    child: Text(
                      'Última visita: 05/03/2021 a las 12:02:43',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Basic Commercial SR Pro',
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  SizedBox(
                    width: 340,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      height: 58,
                      decoration: BoxDecoration(
                        color: '#e7e4fb'.toColor(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          '¡Realiza transacciones por menos de \$2’470.210 COP al mes y queda excento de GMF!',
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Basic Commercial SR Pro',
                            fontStyle: FontStyle.normal,
                            color: '#343887'.toColor(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 163,
                            height: 85,
                            decoration: BoxDecoration(
                              color: '#FFFFFF'.toColor(),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: '#000000'.toColor().withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saldo en tu billetetera',
                                    style: TextStyle(
                                      fontFamily: 'Basic Commercial SR Pro',
                                      fontStyle: FontStyle.normal,
                                      color: '#7E72FF'.toColor(),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '\$341.100',
                                    style: TextStyle(
                                      fontFamily: 'inter',
                                      fontStyle: FontStyle.normal,
                                      color: '#40A170'.toColor(),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  WalletBanalceScreen()));
                                    },
                                    child: Text(
                                      'Ver movimientos',
                                      style: TextStyle(
                                        fontFamily: 'Basic Commercial SR Pro',
                                        fontStyle: FontStyle.normal,
                                        color: '#7E72FF'.toColor(),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(width: 5),
                          Container(
                            width: 163,
                            height: 85,
                            decoration: BoxDecoration(
                              color: 'FFFFFF'.toColor(),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: '#000000'.toColor().withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Por pagar en administración',
                                    style: TextStyle(
                                      fontFamily: 'Basic Commercial SR Pro',
                                      fontStyle: FontStyle.normal,
                                      color: '#7E72FF'.toColor(),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '\$200.000',
                                    style: TextStyle(
                                      fontFamily: 'inter',
                                      fontStyle: FontStyle.normal,
                                      color: '#D1242D'.toColor(),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  WalletAdministrationPayableScreen()));
                                    },
                                    child: Text(
                                      'Ver movimientos',
                                      style: TextStyle(
                                        fontFamily: 'Basic Commercial SR Pro',
                                        fontStyle: FontStyle.normal,
                                        color: '#7E72FF'.toColor(),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                        ]),
                  ),
                  SizedBox(height: 9),
                  InkWell(
                    onTap: () => showModal(context),
                    child: Container(
                      width: 331,
                      height: 53,
                      decoration: BoxDecoration(
                        color: '#B5179E'.toColor(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Recarga tu billetera',
                              style: TextStyle(
                                fontFamily: 'Basic Commercial SR Pro',
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset('assets/images/cam.png',
                                width: 30, height: 30),
                          ]),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "walletAdminPayableUser");
                    },
                    child: Container(
                      width: 331,
                      height: 53,
                      decoration: BoxDecoration(
                        color: '#7209B7'.toColor(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Paga tu administración',
                                  style: TextStyle(
                                    fontFamily: 'Basic Commercial SR Pro',
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset('assets/images/hand.png',
                                    width: 30, height: 30),
                              ]),
                          Text(
                            'Fecha de pronto pago: 07/03/2021   ',
                            style: TextStyle(
                              fontFamily: 'Basic Commercial SR Pro',
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      showModalServices(context);
                    },
                    child: Container(
                      width: 331,
                      height: 147,
                      decoration: BoxDecoration(
                        color: '#560BAD'.toColor(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(children: <Widget>[
                        SizedBox(height: 17),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Otros servicios',
                                style: TextStyle(
                                  fontFamily: 'Basic Commercial SR Pro',
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 10),
                              Image.asset('assets/images/flower.png',
                                  width: 30, height: 30),
                            ]),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 71.36,
                              height: 71.36,
                              decoration: BoxDecoration(
                                color: '#E7E4FB'.toColor(),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/directv.png'),
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                            Container(
                              width: 71.36,
                              height: 71.36,
                              decoration: BoxDecoration(
                                color: '#E7E4FB'.toColor(),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/netflix.png'),
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                            Container(
                              width: 71.36,
                              height: 71.36,
                              decoration: BoxDecoration(
                                color: '#E7E4FB'.toColor(),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/bets.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: 71.36,
                              height: 71.36,
                              decoration: BoxDecoration(
                                color: '#E7E4FB'.toColor(),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/op.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      showModalWithdrawals(context);
                    },
                    child: Container(
                      width: 331,
                      height: 53,
                      decoration: BoxDecoration(
                        color: '#480CA8'.toColor(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Retira tu dinero',
                              style: TextStyle(
                                fontFamily: 'Basic Commercial SR Pro',
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset('assets/images/witw.png',
                                width: 30, height: 30),
                          ]),
                    ),
                  ),
                ]),
              ],
            ),
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionBtn(),
            bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
          ),
        ));
  }

  showModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (BuildContext context) {
          return WalletDeposit(contextOrigin: context);
        });
  }

  showModalWithdrawals(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (BuildContext context) {
          return Withdrawals(contextOrigin: context);
        });
  }

  showModalServices(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (BuildContext context) {
          return Services(contextOrigin: context);
        });
  }
}
