import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/wallet/ui/screen/wallet_administration_payable_screen.dart';
import 'package:hipal/components/wallet/ui/screen/wallet_balance_screen.dart';
import 'package:hipal/components/wallet/ui/widgets/confirm.dart';
import 'package:hipal/components/wallet/ui/widgets/wallet_deposit.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';
import '../../../user/bloc/user_bloc.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_field_full.dart';

class OtherBankScreen extends StatefulWidget {
  @override
  _OtherBankScreenState createState() => _OtherBankScreenState();
}
class _OtherBankScreenState extends State<OtherBankScreen> {
  String depositState = 'Seleccionar';
  String bankOriginState = 'Seleccionar';
  String personTypeState = 'Seleccionar';
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
                            'Recarga PSE',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Basic Commercial SR Pro',
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ]
                    ),

                    
                  ],
                ),

                SizedBox(height: 50),
                CustomSelectField(
                label: 'Depósito a recargar',
                ops: ['Opción 1' 'Opción 2', 'Opción 3', 'Opción 4'],
                refState: depositState,
                onChange: (value) {
                    setState(() {
                      depositState = value;
                    });
                }
                ),

                SizedBox(height: 30),
                CustomSelectField(
                label: 'Banco de origen',
                ops: ['Avevillas' 'Bancolombia', 'Davivienda', 'Banco de Bogotá'],
                refState: bankOriginState,
                onChange: (value) {
                    setState(() {
                      bankOriginState = value;
                    });
                }
                ),

                SizedBox(height: 30),
                CustomSelectField(
                label: 'Tipo de persona',
                ops: ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'],
                refState: personTypeState,
                onChange: (value) {
                    setState(() {
                      bankOriginState = value;
                    });
                }
                ),
                SizedBox(height: 30),

                CustomTextFieldFull(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  label: 'Monto',
                  hintText: 'Ingresa el monto a recargar',
                ), 

                SizedBox(height: 30),

                InkWell(
              onTap: () => showModal(context),
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
                     fontWeight: FontWeight.w900,
                   ),
                 ),
               ),
              ),
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
        return Confirn(contextOrigin: context);
      }
    );

    
  }
} 