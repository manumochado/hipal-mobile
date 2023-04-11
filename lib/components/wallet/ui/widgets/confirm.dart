import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:hipal/utils/extension_color.dart';
import '../../../../services/network_to_base.dart';

class Confirn extends StatelessWidget {
  final BuildContext contextOrigin;

  const Confirn({
    Key? key,
    required this.contextOrigin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
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
              height: 100,
            ),

            Text('Procesando recarga',
              style: TextStyle(
                fontFamily: 'Basic Commercial SR Pro',
                color: '#343887'.toColor(),
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text('Estamos procesando la recarga solicitada, esto puede tardar unos segundos.',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Basic Commercial SR Pro',
                  color: '#343887'.toColor(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Text(
              '¡Gracias por esperar!',
              style: TextStyle(
                fontFamily: 'Basic Commercial SR Pro',
                color: '#343887'.toColor(),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
    );    

            
  }
}
