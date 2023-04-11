
class BalanceMovements {
  final String date;
  final double amount;
  final String type;
  final String detail;

  BalanceMovements({required this.date, required this.amount, required this.type, this.detail = ''});

}

class AdminPayableMovements {
  final String reference;
  final String date;
  final String limitDate;
  final double amount;
  final double paid;
  final String month;
  final double statusPercent;

  AdminPayableMovements({
      required this.reference,
      required this.date,
      required this.limitDate,
      required this.amount,
      required this.paid,
      required this.month,
      this.statusPercent = 0.0});

}

List<BalanceMovements> balanceMovementsExampleData = [
  BalanceMovements(date: '23/06/2022', amount: 400000.00, type: 'ingreso', detail: 'Detalle 1'),
  BalanceMovements(date: '25/07/2022', amount: 250000.00, type: 'ingreso', detail: 'Detalle 2'),
  BalanceMovements(date: '12/08/2022', amount: 38000.00,  type: 'egreso', detail: 'Detalle 2'),
  BalanceMovements(date: '30/08/2022', amount: 270000.00, type: 'ingreso', detail: 'Detalle 3'),
  BalanceMovements(date: '02/09/2022', amount: 110000.00, type: 'egreso', detail: 'Detalle 4'),
  BalanceMovements(date: '08/09/2022', amount: 200000.00, type: 'egreso', detail: 'Detalle 5'),
  BalanceMovements(date: '15/09/2022', amount: 500000.00, type: 'ingreso', detail: 'Detalle 6'),
  BalanceMovements(date: '30/09/2022', amount: 330000.00, type: 'ingreso', detail: 'Detalle 7'),
  BalanceMovements(date: '07/11/2022', amount: 90000.00, type: 'ingreso', detail: 'Detalle 8'),
];

List<AdminPayableMovements> adminPayableMovementsExampleData = [
  AdminPayableMovements(reference: '0008', date: '23/09/2022', limitDate: '30/09/2022', amount: 400000.00, paid: 400000.00, month: 'Agosto', statusPercent: 50),
  AdminPayableMovements(reference: '0007', date: '23/08/2022', limitDate: '30/08/2022', amount: 400000.00, paid: 400000.00, month: 'Julio', statusPercent: 100),
  AdminPayableMovements(reference: '0006', date: '23/07/2022', limitDate: '30/07/2022', amount: 400000.00, paid: 400000.00, month: 'Junio', statusPercent: 100),
  AdminPayableMovements(reference: '0006', date: '23/06/2022', limitDate: '30/06/2022', amount: 400000.00, paid: 400000.00, month: 'Mayo', statusPercent: 100),
  AdminPayableMovements(reference: '0005', date: '23/05/2022', limitDate: '30/05/2022', amount: 400000.00, paid: 400000.00, month: 'Abril', statusPercent: 100),
  AdminPayableMovements(reference: '0004', date: '23/04/2022', limitDate: '30/04/2022', amount: 400000.00, paid: 400000.00, month: 'Marzo', statusPercent: 100),
  AdminPayableMovements(reference: '0003', date: '23/03/2022', limitDate: '30/03/2022', amount: 400000.00, paid: 400000.00, month: 'Febrero', statusPercent: 100),
  AdminPayableMovements(reference: '0002', date: '23/02/2022', limitDate: '30/02/2022', amount: 400000.00, paid: 400000.00, month: 'Enero', statusPercent: 100),
  AdminPayableMovements(reference: '0001', date: '23/01/2022', limitDate: '30/01/2022', amount: 400000.00, paid: 400000.00, month: 'Diciembre', statusPercent: 100),
];