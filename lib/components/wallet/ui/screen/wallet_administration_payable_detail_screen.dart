import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hipal/components/wallet/example_data/wallet_balance.dart';

class WalletAdministrationPayableDetailScreen extends StatelessWidget {
  final AdminPayableMovements movement;
  const WalletAdministrationPayableDetailScreen(
      {Key? key, required this.movement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _MovementsHeader(),
          Expanded(child: _DetailsCard(movement: movement))
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  final AdminPayableMovements movement;
  const _DetailsCard({
    Key? key,
    required this.movement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
            padding: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Color(0xffF2F0FA),
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
                      style: TextStyle(color: Color(0xff666688)),
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
                        child: Text('Ref: ${movement.reference}',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: Color(0xff666688))),
                      ),
                    )
                  ],
                ),
                Text(
                  'Mes: ${movement.month}',
                  style: TextStyle(color: Color(0xff666688)),
                ),
                SizedBox(height: 20),
                Text(
                  'Fecha límite de pago:   ${movement.limitDate}',
                  style: TextStyle(color: Color(0xff666688)),
                ),
                Text(
                  'Fecha de pronto pago: ${movement.date}',
                  style: TextStyle(color: Color(0xff666688)),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Administración: ${movement.month}',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                    Text(
                      '${movement.amount}',
                      style: TextStyle(color: Color(0xff666688)),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Valor cancelado',
                        style: TextStyle(color: Color(0xff666688)))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${movement.amount}',
                      style: TextStyle(
                        color: Color(0xff00006A),
                        fontWeight: FontWeight.bold
                      ),
                    )),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 40, 40),
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
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Comprobante de pago',
                    style: TextStyle(
                        color: Color(0xff7E72FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(width: 8,),
                  SvgPicture.asset(
                    'assets/icons/download.svg',
                    height: 24,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovementsHeader extends StatelessWidget {
  const _MovementsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        decoration: BoxDecoration(
            color: Color(0xFF7746e0),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        child: Text(
          'Historial',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
