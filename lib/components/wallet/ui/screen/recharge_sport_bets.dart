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

class SportBetsScreen extends StatefulWidget {
  @override
  _SportBetsScreenState createState() => _SportBetsScreenState();
}
class _SportBetsScreenState extends State<SportBetsScreen> {
  String depositState = 'Seleccionar';
  String bankOriginState = 'Seleccionar';
  String personTypeState = 'Seleccionar';
  TextEditingController _amountController = TextEditingController();
  TextEditingController _refController = TextEditingController();
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
            body: Container(
              child: SingleChildScrollView(
                child: Column(
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
                                'Apuestas Deportivas',
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
              
                            Container(
                              width: 234,
                              height: 34,
                              decoration: BoxDecoration(
                                color: '#E7E4FB'.toColor(),
                                borderRadius: BorderRadius.circular(7),
                              ),
              
                              child: Center(
                                child: Text(
                                  'Disponible billetera: \$0,00',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Basic Commercial SR Pro',
                                    fontStyle: FontStyle.normal,
                                    color: '#696989'.toColor(),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          ]
                        ),
              
                        
              
                        
                      ],
                    ),
              
                    SizedBox(height: 50),
                    CustomSelectField(
                    label: 'Depósito de donde saldrá la recarga',
                    ops: ['Billetera', 'Opción 2', 'Opción 3', 'Otro'],
                    refState: depositState,
                    onChange: (value) {
                        setState(() {
                          depositState = value;
                        });
                    }
                    ),
              
                    SizedBox(height: 30),
                    CustomSelectField(
                    label: 'Operador apuestas deportivas',
                    ops: ['BetPlay', 'Wplay', 'Yajuego', 'Sportium', 'Zamba', 'Otro'],
                    refState: bankOriginState,
                    onChange: (value) {
                        setState(() {
                          bankOriginState = value;
                        });
                    }
                    ),
              
                    
                    SizedBox(height: 30),
              
                    CustomTextFieldFull(
                      controller: _refController,
                      keyboardType: TextInputType.number,
                      label: 'Referencia',
                      hintText: 'Ingresa la referencia a recargar',
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
                    ),
              
                SizedBox(height: 150),         
                  
                  ],
              
                  
                ),
              ),
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