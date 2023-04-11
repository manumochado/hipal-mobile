import 'package:flutter/material.dart';
import 'package:hipal/components/wallet/ui/widgets/custom_text_field.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';
import '../widgets/confirm.dart';
import '../widgets/confirm_transaction.dart'; 

class WithdrawCashSuccess extends StatefulWidget {
  @override
  _WithdrawCashSuccessState createState() => _WithdrawCashSuccessState();
}
class _WithdrawCashSuccessState extends State<WithdrawCashSuccess> {
  bool radioSelected = false;
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Billetera'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'wallet');
                },
              ),
              centerTitle: true,
              backgroundColor: '#7746e0'.toColor(),
              toolbarHeight: 40,
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 90,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: '#7746e0'.toColor(),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
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

                    Column(
                      children: [
                        SizedBox(height: 50),
                        Container(
                          alignment: Alignment.center,
                          width: size.width,
                          child: Text(
                            'Retiro en efectivo',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Basic Commercial SR Pro',
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ]
                    ),

                    
                  ],
                ),

                
                SizedBox(height: 70),

                Text(
                  '¡Operación exitosa!',
                  style: TextStyle(
                    fontFamily: 'Basic Commercial SR Pro',
                    fontStyle: FontStyle.normal,
                    color: '#7746e0'.toColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  width: 227,
                  height: 62,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: '#E7E4FB'.toColor(),
                    borderRadius: BorderRadius.circular(10),
                   
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  
                      Text(
                        'Valor a retirar',
                        style: TextStyle(
                          fontFamily: 'Basic Commercial SR Pro',
                          fontStyle: FontStyle.normal,
                          color: '#696989'.toColor(),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '\$ 120.000,00',
                        style: TextStyle(
                          fontFamily: 'Basic Commercial SR Pro',
                          fontStyle: FontStyle.normal,
                          color: '#696989'.toColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),  
                       
                    ]
                  ),
                ),

                SizedBox(height: 35),

                Container(
                  width: 350,
                  height: 116,
                  padding: EdgeInsets.symmetric(horizontal: 10),

                  decoration: BoxDecoration(
                    color: '#F2F0FA'.toColor(),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/alert-circle.png',
                        width: 24,
                        height: 24,
                      ),

                      SizedBox(width: 10),

                      Container(
                        width: 290,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        
                            Text(
                              'Recuerda llevar tu cédula y seguir las instrucciones del asesor bancario.',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'Basic Commercial SR Pro',
                                fontStyle: FontStyle.normal,
                                color: '#343887'.toColor(),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(
                              '¡Recuerda que esta solicitud solo tendrá validez durante 24 horas!',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'Basic Commercial SR Pro',
                                fontStyle: FontStyle.normal,
                                color: '#343887'.toColor(),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 100),

                InkWell(
                  onTap: () => {
                    
                  },
                  child: Container(
                    width: 151,
                    height: 55,
                    decoration: BoxDecoration(
                      color: '#867bfc'.toColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                   child: Center(
                     child: Text(
                       'Terminar',
                       style: TextStyle(
                         color: '#ffffff'.toColor(),
                         fontSize: 16,
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                   ),
                  ),
                ),

                SizedBox(height: 10),     

                  
              
              ],

              
            ),
            extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
           
          ),
    );
  }

  
  
} 