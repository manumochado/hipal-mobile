import 'package:flutter/material.dart';
import 'package:hipal/components/dashboard/ui/widgets/design_btn_some.dart';

class ListBtnSome extends StatelessWidget {
  const ListBtnSome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: DisenoBtnSome('Billetera', 'assets/images/iconPago.png',
                  "onboardingWallet")),
          Expanded(
              child: DisenoBtnSome(
                  'Visitantes', 'assets/images/iconVisitantes.png', "visit")),
          Expanded(
              child: DisenoBtnSome('Domicilios',
                  'assets/images/iconDomicilios.png', "delivery")),
          Expanded(
              child: DisenoBtnSome('Directorio',
                  'assets/images/iconDirectorio.png', "directory")),
        ],
      ),
    );
  }
}
