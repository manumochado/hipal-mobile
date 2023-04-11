import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart'; 

class DocumentsAssemblyGral extends StatefulWidget {
  @override
  _DocumentsAssemblyGralState createState() => _DocumentsAssemblyGralState();
}
class _DocumentsAssemblyGralState extends State<DocumentsAssemblyGral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: '#7d41dd'.toColor(),
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Actas de Asamblea', 
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: '#343887'.toColor(),
                        )
                      ),

                      SizedBox(width: 10.0),

                      Container(
                        width: 41,
                        height: 23,
                        decoration: BoxDecoration(
                          color: '#FE9D6D'.toColor(),
                          borderRadius: BorderRadius.circular(15.6),
                        ),

                        child: Center(
                          child: Text(
                            '01',
                            style: TextStyle(
                              fontSize: 15.6,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 31),

                  Container(
                    width: 374,
                    height: 107,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: '#F2F0FA'.toColor(),
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            color: '#FFFFFF'.toColor(),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/logoPDF.png'
                            ),
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nombre:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                            Text('Fecha:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                            Text('Por:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                            Text('ID:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: '#5C5D87'.toColor(),
                              )
                            ),

                            Text('Año:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                          ]
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Informe 2022:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                            Text('26 Mar 2022:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                            Text('Manuel Torres:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                            Text('567912334:', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: '#5C5D87'.toColor(),
                              )
                            ),

                            Text('2022', 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: '#5C5D87'.toColor(),
                              )
                            ),
                          ]
                        ),

                        Image.asset(
                          'assets/images/download.png',
                          width: 26,
                          height: 26,
                        ),
                      ]
                    ),
                  ),

                  SizedBox(height: 43),

                  Row(
                    children: [
                      Text(
                        'Convocatoria de Asamblea', 
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: '#343887'.toColor(),
                        )
                      ),

                      SizedBox(width: 10.0),

                      Container(
                        width: 41,
                        height: 23,
                        decoration: BoxDecoration(
                          color: '#FE9D6D'.toColor(),
                          borderRadius: BorderRadius.circular(15.6),
                        ),

                        child: Center(
                          child: Text(
                            '01',
                            style: TextStyle(
                              fontSize: 15.6,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      
                    ],
                  ),

                  SizedBox(height: 32),

                      ContainerIcon(text: 'Orden del día',),

                      SizedBox(height: 43),

                      Row(
                    children: [
                      Text(
                        'Ficha del presidente y asamblea', 
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: '#343887'.toColor(),
                        )
                      ),

                      SizedBox(width: 10.0),

                      Container(
                        width: 41,
                        height: 23,
                        decoration: BoxDecoration(
                          color: '#FE9D6D'.toColor(),
                          borderRadius: BorderRadius.circular(15.6),
                        ),

                        child: Center(
                          child: Text(
                            '02',
                            style: TextStyle(
                              fontSize: 15.6,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 43),

                  ContainerIcon(text: 'Presidente',),

                  SizedBox(height: 10),

                  ContainerIcon(text: 'Asamblea',),
                  
                ],
              ),

              
              
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerIcon extends StatelessWidget {
  final String text;
  const ContainerIcon({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      decoration: BoxDecoration(
        color: '#F2F0FA'.toColor(),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 34,
                height: 34,

                decoration: BoxDecoration(
                  color: '#E3DFF8'.toColor(),
                  borderRadius: BorderRadius.circular(50),
                ),

                child: Center(
                  child: Image.asset(
                    'assets/images/logoPDF.png',
                    width: 16,
                    height: 16,
                  ),
                ),
              ),

              SizedBox(width: 10),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, 
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: '#343887'.toColor(),
                    )
                  ),
                  Text('2022/02/18', 
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: '#9FA7B8'.toColor(),
                    )
                  ),
                ]
              ),


            ],
          ),

          Image.asset(
            'assets/images/download.png',
            width: 26,
            height: 26,
          ),
        ]
      ),
    );
  }
} 