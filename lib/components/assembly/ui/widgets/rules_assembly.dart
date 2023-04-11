import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:overlay_support/overlay_support.dart'; 

class RulesAssembly extends StatefulWidget {
  @override
  _RulesAssemblyState createState() => _RulesAssemblyState();
}
class _RulesAssemblyState extends State<RulesAssembly> {

  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 265,
              width: double.infinity,
              decoration: BoxDecoration(
                color: '#7d41dd'.toColor(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
            ),
    
            Container(
              height: 150,
              width: double.infinity,
    
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'assembly-screen');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 40),
                      alignment: Alignment.topLeft,
                      height: 150,
                      width: 50,
                      child: Image.asset('assets/images/backarrow.png')
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    alignment: Alignment.topLeft,
                    height: 150,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reglas durante la           asamblea',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 40),
                    alignment: Alignment.topLeft,
                    height: 150,
                    width: 50,
                  ),
                ]
              ),
    
    
            ),
    
            Container(
              margin: EdgeInsets.only(left: 25, top: 120),
              padding: EdgeInsets.all(25),
              height: 298,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          itemRules(
                            icon: 'hand2.png',
                            text1: 'Pedir la palabra',
                            text2: 'para intervenir',
                            text3: '',
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          itemRules(
                            icon: 'msg.png',
                            text1: 'Interviene sobre',
                            text2: 'el tema tratatado',
                            text3: 'del chat',
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          itemRules(
                            icon: 'clock.png',
                            text1: 'Tomate el tiempo',
                            text2: 'definido para',
                            text3: 'cada intervención',
                          ),
                        ],
                      )
                      
                    ]
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          itemRules(
                            icon: 'arrorbackup.png',
                            text1: 'Prepárate para',
                            text2: 'el momento en',
                            text3: 'que sea tu turno',
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          itemRules(
                            icon: 'Union.png',
                            text1: 'Respeta las',
                            text2: 'interveciones de',
                            text3: 'los demás',
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          itemRules(
                            icon: 'analogic.png',
                            text1: 'Asiste a la hora',
                            text2: 'de la convocatoria',
                            text3: '',
                          ),
                        ],
                      )
                      
                    ]
                  ),
                ]
              ),

              
            ),

            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 440),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      height: 8,
                      width: 8,
                      color: '#E8E8E9'.toColor(),
                    ),
                  ),

                  SizedBox(width: 5),

                  ClipOval(
                    child: Container(
                      height: 8,
                      width: 8,
                      color: '#8378FC'.toColor(),
                    ),
                  ),

                  SizedBox(width: 5),

                  ClipOval(
                    child: Container(
                      height: 8,
                      width: 8,
                      color: '#E8E8E9'.toColor(),
                    ),
                  )                
                ]
              ),
            ),

            InkWell(
              onTap: () => {
                setState(() => _agree = !_agree),
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top: 480),
                alignment: Alignment.center,
            
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: _agree ? Alignment.centerRight : Alignment.centerLeft,
                      height: 20,
                      width: 35,
                      decoration: BoxDecoration(
                        color:  _agree ? '#D6D3FF'.toColor() : '#5C5D87'.toColor(),
                        borderRadius: BorderRadius.circular(13),
                      ),
            
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: _agree ? '#8378FC'.toColor() : '#9FA7B8'.toColor(),
                          borderRadius: BorderRadius.circular(13),
                        ),
                      )
                    ),
            
                    SizedBox(width: 10),
            
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'He leído y entendido las reglas de la Asamblea',
                           
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: '#343887'.toColor(),
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                        'online Copropietarios 2021',
                       
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: '#343887'.toColor(),
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                      )
                        ],
                      ),
                    )
                  ]
                  
                ),
              ),
            ),

            

            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 100),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if(!_agree) {
                        
                      }else{
                        Navigator.pushNamed(context, 'welcome-assembly');
                      }
                    },
                    child: Container(
                      height: 53,
                      width: 339,
                      decoration: BoxDecoration(
                        color: '#8378FC'.toColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Siguiente',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  )
                ]
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}

class itemRules extends StatelessWidget {

  final String icon;
  final String text1;
  final String text2;
  final String text3;

  const itemRules({
    required this.icon,
    required this.text1,
    required this.text2,
    required this.text3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 58,
              height: 58,
              color: '#EDECFD'.toColor(),

              child: Center(child: Image.asset('assets/images/$icon')),
            ),
          ),

          Text(
      text1,
      style: TextStyle(
        fontFamily: 'Inter',
        color: '#5F5E88'.toColor(),
        fontSize: 10,
        fontWeight: FontWeight.w600
      ),
    ),
    Text(
      text2,
      style: TextStyle(
        fontFamily: 'Inter',
        color: '#5F5E88'.toColor(),
        fontSize: 10,
        fontWeight: FontWeight.w600
      ),
    ),
    Text(
      text3,
      style: TextStyle(
        fontFamily: 'Inter',
        color: '#5F5E88'.toColor(),
        fontSize: 10,
        fontWeight: FontWeight.w600
      ),
    )
        ],
      ),
    );
  }
} 