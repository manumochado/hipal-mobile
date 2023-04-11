import 'package:flutter/material.dart';
import 'package:hipal/components/wallet/example_data/wallet_balance.dart';

class WalletBanalceScreen extends StatelessWidget {
  const WalletBanalceScreen({Key? key}) : super(key: key);

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
        children: [
          _MovementsHeader(),
          _MovementBody()
        ],
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
        itemCount: balanceMovementsExampleData.length,
        itemBuilder: (_, i) {
          return _MovementCard(movement: balanceMovementsExampleData[i]);
        },
      ),
    );
  }
}

class _MovementCard extends StatelessWidget {
  final BalanceMovements movement;
  const _MovementCard({
    Key? key,
    required this.movement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  'Fecha de transacción:',
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
                    color: movement.type == 'egreso'
                        ? Color(0xffFB4E57)
                        : Color(0xff40A170),
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
                  'Razón:',
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  movement.detail,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xff343887)),
                ),
              ],
            ),
          ],
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
          color: Color(0xFF7746e0),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billetera digital',
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
                        'Depósito',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '111111111',
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
                        'Saldo disponible',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$ 341.100,00',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
