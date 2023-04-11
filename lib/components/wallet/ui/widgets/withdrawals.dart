import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:hipal/components/wallet/ui/widgets/pse_deposit.dart';
import 'package:hipal/utils/extension_color.dart';
import '../../../../services/network_to_base.dart';
import 'cash_deposit.dart';

class Withdrawals extends StatelessWidget {
  final BuildContext contextOrigin;

  const Withdrawals({
    Key? key,
    required this.contextOrigin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 370,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(162,170,187,1)
                    ),
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

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, 'withdrawCorrespondent')
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/store.png',
                            width: 50,
                            height: 50,
                          ),
                    
                          SizedBox(
                            width: 10,
                          ),
                    
                          Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    
                        Text(
                          'En corresponsales',
                          style: TextStyle(
                            color: '#343887'.toColor(),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                    
                       
                    
                        Text(
                          'Retira en un corresponsal bancario',
                          style: TextStyle(
                            color: '#343887'.toColor(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                    ),
                        ],
                      ),
                    ),
                  ),
            
                  
            
                  Icon(
                    Icons.arrow_forward_ios,
                    color: '#343887'.toColor(),
                    size: 20,
                  ),
                ]
              ),
            ),

            SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () => {
                Navigator.pushNamed(context, 'withdrawatm')
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/cajeros.png',
                            width: 50,
                            height: 50,
                          ),
              
                          SizedBox(
                            width: 10,
                          ),
              
                          Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    
                        Text(
                          'En cajeros',
                          style: TextStyle(
                            color: '#343887'.toColor(),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
              
                       
              
                        Text(
                          'Retira en cajeros del Banco de Bogotá o Red AVAL',
                          style: TextStyle(
                            color: '#343887'.toColor(),
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                    ),
                        ],
                      ),
                    ),
              
                    
              
                    Icon(
                      Icons.arrow_forward_ios,
                      color: '#343887'.toColor(),
                      size: 20,
                    ),
                  ]
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () => {
                Navigator.pushNamed(context, 'withdrawcash')
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/bancofull.png',
                            width: 50,
                            height: 50,
                          ),
              
                          SizedBox(
                            width: 10,
                          ),
              
                          Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    
                        Text(
                          'En el banco',
                          style: TextStyle(
                            color: '#343887'.toColor(),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
              
                       
              
                        Text(
                          'Retira en una oficina del Banco de Bogotá',
                          style: TextStyle(
                            color: '#343887'.toColor(),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                    ),
                        ],
                      ),
                    ),
              
                    
              
                    Icon(
                      Icons.arrow_forward_ios,
                      color: '#343887'.toColor(),
                      size: 20,
                    ),
                  ]
                ),
              ),
            )
          ],
        ));
  }

  showModal(BuildContext context) {
    return showModalBottomSheet(
      
      context: context,
      shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(30.0),
  ),
      builder: (BuildContext context) {
        return CashDeposit(contextOrigin: context);
      }
    );
  }

  showModalTwo(BuildContext context) {
    return showModalBottomSheet(
      
      context: context,
      shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(30.0),
  ),
      builder: (BuildContext context) {
        return PseDeposit(contextOrigin: context);
      }
    );
  }
}
