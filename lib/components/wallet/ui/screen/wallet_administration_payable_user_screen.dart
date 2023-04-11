import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hipal/components/wallet/bloc/waller_administration_payable_user_bloc.dart';
import 'package:hipal/components/wallet/example_data/wallet_balance.dart';

Map<dynamic, dynamic> screens = {
  "init": _DetailsCard(),
  "verify_payment": _VerifyPayment(),
  "success_payment": _SuccessPayment(),
};

class WalletAdministrationPayableUserScreen extends StatefulWidget {
  const WalletAdministrationPayableUserScreen({Key? key}) : super(key: key);

  @override
  State<WalletAdministrationPayableUserScreen> createState() =>
      _WalletAdministrationPayableUserScreenState();
}

class _WalletAdministrationPayableUserScreenState
    extends State<WalletAdministrationPayableUserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallerAdministrationPayableUserCubic,
        WallerAdministrationPayableUserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Billetera'),
            leading: BackButton(
              color: Colors.white,
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF7746e0),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 12,
                child: _Header(),
              ),
              Expanded(
                flex: 88,
                child: screens[state.currentScreen],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SuccessPayment extends StatefulWidget {
  const _SuccessPayment({Key? key}) : super(key: key);

  @override
  State<_SuccessPayment> createState() => __SuccessPaymentState();
}

class __SuccessPaymentState extends State<_SuccessPayment> {
  @override
  Widget build(BuildContext context) {
    WallerAdministrationPayableUserCubic _wallerAdministrationPayableUserCubic =
        BlocProvider.of<WallerAdministrationPayableUserCubic>(context,
            listen: false);
    final size = MediaQuery.of(context).size;
    return BlocBuilder<WallerAdministrationPayableUserCubic,
        WallerAdministrationPayableUserState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
        padding: EdgeInsets.all(20),
        width: size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "¡Pago exitoso!",
                style: TextStyle(
                    color: Color(0xFF8549DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xffE7E4FB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Comprobante de pago Nro: 00000001\n12 de septiembre 2022 - 11:11 a.m.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8483A1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo de cuota',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      'Administración',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Referencia de Pago',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '1234567',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Valor a pagar',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '707.000,00',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Costo de la transacción',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '7.070,00',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '714.070,00',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Producto de origen',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Disponible billetera',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      width: size.width * 0.50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: ShapeDecoration(
                        color: Color(0xFF6456EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Solicitar Paz y Salvo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "dashboard",
                        (route) => false,
                      );
                      await Future.delayed(Duration(milliseconds: 500));
                      _wallerAdministrationPayableUserCubic
                          .changeScreen("init");
                    },
                    child: Container(
                      width: size.width * 0.30,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Color(0xff7E72FF), width: 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Terminar",
                          style: TextStyle(
                            color: Color(0xff7E72FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _VerifyPayment extends StatefulWidget {
  _VerifyPayment({Key? key}) : super(key: key);

  @override
  State<_VerifyPayment> createState() => _VerifyPaymentState();
}

class _VerifyPaymentState extends State<_VerifyPayment> {
  @override
  Widget build(BuildContext context) {
    WallerAdministrationPayableUserCubic _wallerAdministrationPayableUserCubic =
        BlocProvider.of<WallerAdministrationPayableUserCubic>(context,
            listen: false);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<WallerAdministrationPayableUserCubic,
        WallerAdministrationPayableUserState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
        padding: EdgeInsets.all(20),
        width: size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Verificar el Pago",
                style: TextStyle(
                    color: Color(0xFF353988),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo de cuota',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      'Administracion',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Referencia de Pago',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '1234567',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Valor a pagar',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '707.000,00',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Costro de la transaccion',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '7.070,00',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '714.070,00',
                      style: TextStyle(color: Color(0xFF4B4F96)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Producto de origen',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Container(
                                height: 70,
                                color: Color(0xFF7746e0),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]),
                          Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Disponible Billetera",
                                    style: TextStyle(
                                      color: Color(0xFF6456EB),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "\$ 1'200.000,00",
                                    style: TextStyle(
                                      color: Color(0xff666688),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xffE7E4FB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
                child: Text(
                  "Recuerda que esta transaccion tiene un costo del 1% sobre el valor a pagar",
                  style: TextStyle(
                    color: Color(0xff7F7F9D),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _wallerAdministrationPayableUserCubic
                          .changeToVerifyPayment(false);
                    },
                    child: Container(
                      width: size.width * 0.33,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Color(0xff7E72FF), width: 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Color(0xff7E72FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext ctx) {
                            return StatefulBuilder(builder: (ctx, statectx) {
                              return _paymentConfirm();
                            });
                          });
                    },
                    child: Container(
                      width: size.width * 0.33,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: ShapeDecoration(
                        color: Color(0xFF6456EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Continuar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _paymentConfirm extends StatefulWidget {
  const _paymentConfirm({Key? key}) : super(key: key);

  @override
  State<_paymentConfirm> createState() => __paymentConfirmState();
}

class __paymentConfirmState extends State<_paymentConfirm> {
  late WallerAdministrationPayableUserCubic
      _wallerAdministrationPayableUserCubic;

  @override
  void initState() {
    _wallerAdministrationPayableUserCubic =
        BlocProvider.of<WallerAdministrationPayableUserCubic>(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Future.delayed(Duration(milliseconds: 100), () {
      _wallerAdministrationPayableUserCubic
          .sendFinalResponse(<String, dynamic>{"msg": "", "success": false});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<WallerAdministrationPayableUserCubic,
        WallerAdministrationPayableUserState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              border: Border.all(
                width: 3,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            height: 200,
            width: size.width,
            margin: EdgeInsets.only(top: 35.0),
            child: Column(
              children: [
                Align(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Future.delayed(Duration(milliseconds: 100), () {
                            _wallerAdministrationPayableUserCubic
                                .sendFinalResponse(<String, dynamic>{
                              "msg": "",
                              "success": false
                            });
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: Color(0xff666688),
                        ),
                      ),
                    ),
                    alignment: Alignment.topRight),
                Container(
                    margin: EdgeInsets.only(top: 0.0, left: 25, right: 25),
                    child: state.finalResponse["success"] == false &&
                            state.finalResponse["msg"] != ""
                        ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: size.width * 0.7,
                              child: Text(
                                state.finalResponse["msg"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF343887),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                "¿Deseas confirmar esta transacción?",
                                style: TextStyle(
                                  color: Color(0xFF343887),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  _wallerAdministrationPayableUserCubic
                                      .isLoadingPayment(true);

                                  await Future.delayed(
                                      const Duration(seconds: 3), () {
                                    _wallerAdministrationPayableUserCubic
                                        .isLoadingPayment(false);
                                  });
                                  /*
                                  Map<String, dynamic> finalResponse = {
                                    "msg":
                                        "Lo sentimos, no se ha podido efectuar tu pago. Por favor intenta de nuevo mas tarde",
                                    "success": false
                                  };
                                  */
                                  Map<String, dynamic> finalResponse = {
                                    "msg": "",
                                    "success": true
                                  };

                                  _wallerAdministrationPayableUserCubic
                                      .sendFinalResponse(finalResponse);

                                  Navigator.pop(context);
                                  _wallerAdministrationPayableUserCubic
                                      .changeScreen("success_payment");
                                  await Future.delayed(
                                      Duration(milliseconds: 100), () {
                                    _wallerAdministrationPayableUserCubic
                                        .sendFinalResponse(<String, dynamic>{
                                      "msg": "",
                                      "success": false
                                    });
                                  });
                                },
                                child: Container(
                                  width: size.width * 0.33,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF7E72FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: state.isLoadingPayment
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Espere",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 15,
                                              height: 15,
                                              child:
                                                  const CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Center(
                                          child: Text(
                                            "Confirmar",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          )),
              ],
            ),
          )
        ],
      );
    });
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WallerAdministrationPayableUserCubic _wallerAdministrationPayableUserCubic =
        BlocProvider.of<WallerAdministrationPayableUserCubic>(context);
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
            padding: EdgeInsets.all(20),
            decoration: ShapeDecoration(
              color: Color.fromARGB(255, 239, 239, 239),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                side: BorderSide(color: Color(0xffAFB5C3), width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cuota de administración',
                      style: TextStyle(color: Color(0xff696989)),
                    ),
                    DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text('Ref: 1232131',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: Color(0xff666688))),
                      ),
                    )
                  ],
                ),
                Text(
                  'Mes: Marzo',
                  style: TextStyle(color: Color(0xff696989)),
                ),
                SizedBox(height: 20),
                Text(
                  'Fecha límite de pago: 25/03/2021',
                  style: TextStyle(color: Color(0xff343887)),
                ),
                Text(
                  'Fecha de pronto pago: 07/03/2021',
                  style: TextStyle(color: Color(0xff343887)),
                ),
                SizedBox(height: 15),
                Container(
                  constraints: BoxConstraints(maxHeight: size.height * 0.20),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      for (BalanceMovements movement
                          in balanceMovementsExampleData)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              CustomCheckbox(
                                state: false,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                movement.detail,
                                style: TextStyle(color: Color(0xff343887)),
                              ),
                              Spacer(),
                              Text(
                                movement.amount.toString(),
                                style: TextStyle(color: Color(0xff343887)),
                              ),
                            ],
                          ),
                        ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Valor a pagar',
                        style: TextStyle(color: Color(0xff343887)))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '15.000,00',
                      style: TextStyle(
                          color: Color(0xff343887),
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Color(0xffF2F0FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                side: BorderSide(color: Color(0xffAFB5C3), width: 1),
              ),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cuenta de Cobro',
                    style: TextStyle(
                        color: Color(0xff7E72FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    'assets/icons/download.svg',
                    height: 24,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: size.width * 0.35,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Color(0xff7E72FF), width: 1),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Color(0xff7E72FF),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _wallerAdministrationPayableUserCubic
                        .changeScreen("verify_payment");
                  },
                  child: Container(
                    width: size.width * 0.35,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Color(0xFF857AFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Pagar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  bool state;

  CustomCheckbox({Key? key, required this.state}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.state = !widget.state;
        setState(() {});
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff7E72FF)),
        ),
        child: widget.state
            ? Container(
                margin: EdgeInsets.all(3),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Color(0xff7B42DE),
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            : Container(),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Color(0xFF7746e0),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        child: Text(
          'Pagar administración',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
