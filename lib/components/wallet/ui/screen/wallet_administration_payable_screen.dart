import 'package:flutter/material.dart';
import 'package:hipal/components/wallet/example_data/wallet_balance.dart';
import 'package:hipal/components/wallet/ui/screen/wallet_administration_payable_detail_screen.dart';

class WalletAdministrationPayableScreen extends StatelessWidget {
  const WalletAdministrationPayableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos'),
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF7746e0),
      ),
      body: Column(
        children: [_MovementsHeader(), _MovementBody()],
      ),
    );
  }
}

class _MovementBody extends StatelessWidget {
  const _MovementBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: adminPayableMovementsExampleData.length,
        itemBuilder: (_, i) {
          return _MovementCard(movement: adminPayableMovementsExampleData[i]);
        },
      ),
    );
  }
}

class _MovementCard extends StatelessWidget {
  final AdminPayableMovements movement;
  const _MovementCard({
    Key? key,
    required this.movement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_) => WalletAdministrationPayableDetailScreen(movement: movement,)));},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Fecha de pago:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Text(
                    movement.date,
                    style: TextStyle(color: Color(0xff343887)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Valor:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Text(
                    '\$${movement.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: movement.statusPercent == 100
                          ? Color(0xff40A170)
                          : Color(0xffFB4E57),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Mes pagado:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Text(
                    movement.month,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xff343887)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Estado:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Text(
                    movement.statusPercent == 100
                        ? 'Completo (100%)'
                        : 'Parcial (${movement.statusPercent}%)',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xff343887)),
                  ),
                ],
              ),
            ],
          ),
        ),
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
          color: Color(0xFF7746e0),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estado de cuenta',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cuenta',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'T2-208',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Saldo',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$ 200.000,00',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'algunacondicion' == 'algunacondicion2'
                              ? 'Estas al día'
                              : 'Tienes mora',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.white),
                        ),
                        decoration: ShapeDecoration(
                            color: 'algunacondicion' == 'algunacondicion2'
                                ? Color(0xff40A170)
                                : Color(0xffFB4E57),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
