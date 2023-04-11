import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/utils/extension_color.dart';
import '../../../../services/network_to_base.dart';

class PseDeposit extends StatelessWidget {
  final BuildContext contextOrigin;

  const PseDeposit({
    Key? key,
    required this.contextOrigin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 443,
        decoration: BoxDecoration(
          color: Color(0xffF2F0FA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),

                  Container(
                    height: 4,
                    width: 56,
                    color: Color.fromRGBO(162,170,187,1)
                  ),

                  InkWell(
                    onTap: () => {
                      Navigator.pop(contextOrigin)
                    },
                    child: Icon(
                      Icons.close,
                      color: Color.fromRGBO(117,116,147,1),
                      size: 20,
                    ),
                  ),
                ]
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              'Recarga por PSE',
              style: TextStyle(
                color: '#343887'.toColor(),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Image.asset(
              'assets/images/logopse.png',
              width: 100,
              height: 100,
            ),
            
           

            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Este medio te permite recargar tu billetera desde cualquier cuenta bancaria. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Basic Commercial SR Pro',
                  color: '#343887'.toColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            InkWell(
              onTap: () => Navigator.pushNamed(contextOrigin, 'other-banks'),
              child: Container(
                width: 138,
                height: 55,
                decoration: BoxDecoration(
                  color: '#867bfc'.toColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
               child: Center(
                 child: Text(
                   'Ir a PSE',
                   style: TextStyle(
                     color: '#ffffff'.toColor(),
                     fontSize: 16,
                     fontWeight: FontWeight.w900,
                   ),
                 ),
               ),
              ),
            )
          ],
        ));
  }
}
