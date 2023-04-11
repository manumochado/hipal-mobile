
import 'package:animated_radio_buttons/animated_radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/wallet/ui/widgets/custom_text_field.dart';
import 'package:hipal/components/wallet/ui/widgets/custom_text_field2.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';
import '../widgets/confirm.dart';
import '../widgets/confirm_transaction.dart'; 

class WithdrawCorrespondent extends StatefulWidget {
  @override
  _WithdrawCorrespondentState createState() => _WithdrawCorrespondentState();
}
class _WithdrawCorrespondentState extends State<WithdrawCorrespondent> {
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
                            'Retiro en corresponsal',
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

                Container(
                  width: size.width - 124,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Depósito de origen',
                        style: TextStyle(
                          fontFamily: 'Basic Commercial SR Pro',
                          fontStyle: FontStyle.normal,
                          color: '#343887'.toColor(),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: '#7b42de'.toColor(),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )
                        ),

                        child: InkWell(
                          onTap: () => {
                            setState(() {
                              radioSelected = !radioSelected;
                            })
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: '#7b42de'.toColor(),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: '#FFFFFF'.toColor(),
                                width: 2,
                              ),
                        
                            ),
                        
                            child: Container(
                              height: radioSelected ? 12 : 5,
                              width: radioSelected ? 12 : 5,
                              decoration: BoxDecoration(
                                color: '#FFFFFF'.toColor(),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),  

                      Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: '#FFFFFF'.toColor(),
                          boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Disponible billetera',
                              style: TextStyle(
                                fontFamily: 'Basic Commercial SR Pro',
                                fontStyle: FontStyle.normal,
                                color: '#343887'.toColor(),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            Text(
                              '\$ 459.000,00',
                              style: TextStyle(
                                fontFamily: 'Basic Commercial SR Pro',
                                fontStyle: FontStyle.normal,
                                color: '#343887'.toColor(),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    
                      SizedBox(height: 35),

                      CustomTextField2(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      label: 'Monto',
                      hintText: 'Ingresa el monto a retirar',
                    ),

                    SizedBox(height: 35),

                    Text(
                      'Costo de la operación',
                      style: TextStyle(
                        fontFamily: 'Basic Commercial SR Pro',
                        fontStyle: FontStyle.normal,
                        color: '#343887'.toColor(),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      '\$ 2.723,00',
                      style: TextStyle(
                        fontFamily: 'Basic Commercial SR Pro',
                        fontStyle: FontStyle.normal,
                        color: '#696989'.toColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ],
                  ),
                ),
                
                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 149,
                      height: 53,
                      decoration: BoxDecoration(
                        color: '#FFFFFF'.toColor(),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: '#7E72FF'.toColor(),
                          width: 2,
                        ),
                      ),
                     child: Center(
                       child: Text(
                         'Cancelar',
                         style: TextStyle(
                           color: '#7E72FF'.toColor(),
                           fontSize: 16,
                           fontWeight: FontWeight.w700,
                         ),
                       ),
                     ),
                    ),

                    SizedBox(width: 20),

                    InkWell(
                      onTap: () => {
                        showModal(context)
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
                           'Continuar',
                           style: TextStyle(
                             color: '#ffffff'.toColor(),
                             fontSize: 16,
                             fontWeight: FontWeight.w700,
                           ),
                         ),
                       ),
                      ),
                    ),
                  ],
                )         
              
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

  showModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (BuildContext context) {
          return ConfirmTransaction(contextOrigin: context, route: 'withdrawcorrespondentcode',);
        });
  }
  
} 