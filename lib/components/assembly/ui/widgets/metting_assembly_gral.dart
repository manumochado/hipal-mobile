import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart'; 

class MettingAssemblyGral extends StatefulWidget {
  @override
  _MettingAssemblyGralState createState() => _MettingAssemblyGralState();
}
class _MettingAssemblyGralState extends State<MettingAssemblyGral> {

  bool candidate1 = false;
  bool candidate2 = false;
  bool candidate3 = false;
  bool screen1 = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Column(
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/group.png',
                          width: 27,
                          height: 23.22,
                        ),
                        SizedBox(width: 5),
                        Column(children: <Widget>[
                          Text(
                            'Quorum registro',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: '#9FA7B8'.toColor(),
                            ),
                          ),
                          Text(
                            '467 Unidades',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: '#343887'.toColor(),
                            ),
                          )
                        ]),
                      ]),
                    ),
                  
                  Container(
                    width: 63,
                    height: 78,
                    decoration: BoxDecoration(
                      color: '#7E72FF'.toColor(),
                      borderRadius: BorderRadius.circular(28),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Image.asset(
                            'assets/images/progress80.png',
                            width: 34,
                            height: 34,
                          ),

                          SizedBox(height: 5),

                          Text(
                            '80%',
                            style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        
                      ]
                    ),
                  ),

                  InkWell(
                    onTap: () => {
                      showAlertModal()
                    },
                    child: Container(
                    width: 96,
                    height: 36,
                    decoration: BoxDecoration(
                      color: '#867bfc'.toColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Votar',
                        style: TextStyle(
                          color: '#ffffff'.toColor(),
                          fontSize: 9.3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                                  ),
                  )               
                ]
              ),
            ),
          
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 225.87,

                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/videocap.png',
                        width: 347,
                        height: 195,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width * 0.5) - 23, top: 90),
                  child: ClipOval(
                    child: Container(
                      width: 46,
                      height: 46,
                      color: '#8378FC'.toColor(),

                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  
                )
              ],
            ),
          
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asamblea general',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: '#343887'.toColor(),
                        ),
                      ),
                      Text(
                        'propietarios',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: '#343887'.toColor(),
                        ),
                      )                       
                    ]
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Febrero 24, Jueves',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: '#8378FC'.toColor(),
                            ),
                          ),

                          SizedBox(width: 5),

                          Image.asset(
                            'assets/images/iconDateStreaming.png',
                            width: 10,
                            height: 10,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                          '7:00 pm',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: '#8378FC'.toColor(),
                          ),
                        ),

                        SizedBox(width: 5),

                        Image.asset(
                            'assets/images/iconTimeStreaming.png',
                            width: 10,
                            height: 10,
                          ),
                        ],
                      ),                       
                    ]
                  ),
                  
                ]
              ),
            ),

            SizedBox(height: 20),
            
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: '#F2F0FA'.toColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 23),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Escríbe un comentario',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: '#9FA7B8'.toColor(),
                          ),
                        ),

                        SizedBox(height: 13),

                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: '#ffffff'.toColor(),
                            borderRadius: BorderRadius.circular(19),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/EllipseCara.png'),
                              ),

                              Image.asset(
                                'assets/images/send.png',
                                width: 20,
                                height: 20,
                              ),                                
                            ]
                          ),
                        ),

                        SizedBox(height: 23),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('120 comentarios',
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: '#9FA7B8'.toColor(),
                                ),
                              ),

                              Text('Ver todos',
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: '#8378FC'.toColor(),
                                ),
                              ),
                              
                            ]
                          ),
                        ),

                        SizedBox(height: 13),

                        Container(
                          width: 374,
                          height: 113,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: '#E3DFF8'.toColor(),
                            borderRadius: BorderRadius.circular(19),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: '#ffffff'.toColor(),
                                  borderRadius: BorderRadius.circular(15.7),
                                ),

                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.7),
                                    child: Image.asset(
                                      'assets/images/usericov.png',
                                      width: 44,
                                      height: 44,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12),
                                
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Carolina Buitrago',
                                      style: TextStyle(
                                        fontFamily: 'inter',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: '#343887'.toColor(),
                                      ),
                                    ),

                                    SizedBox(height: 5),

                                    Text(
                                      'T3 - Apto 301',
                                      style: TextStyle(
                                        fontFamily: 'inter',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: '#9FA7B8'.toColor(),
                                      ),
                                    ),

                                    SizedBox(height: 18),

                                    Container(
                                      width: 260,
                                      child: Text(
                                        'Excelente servicio, muy puntuales y los productos de calidad... Gracias',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 20,
                                        style: TextStyle(
                                          fontFamily: 'inter',
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w400,
                                          color: '#9FA7B8'.toColor(),
                                        ),
                                      ),
                                    ),                                  
                                  ]
                                ),
                              ),
                            ]
                          ),
                        )
                      ]
                    ),
                  )
              
                    
                ]
              ),
            )
          ],
        ),
      ),
    );

    
  }

  showAlertModal(){
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
              builder: (context, StateSetter setState) {
        return Container(
          alignment: Alignment.center,
          width: 200,
          height: screen1 ? 500 : 419,
          color: Colors.black.withOpacity(0.8),

          child: Column(
            children: [
              SizedBox(height: 68),
              
              screen1
              
              ? Image.asset(
                  'assets/images/progress100.png',
                  width: 60,
                  height: 60,
                )
              : Container(),  

              SizedBox(height: 5),

              screen1
              
              ? Text(
                  '5:00',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: '#ffffff'.toColor(),
                  ),
                )
              : 

              Column(
                children: [
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        screen1 = true;
                        candidate1 = false;
                        candidate2 = false;
                        candidate3 = false;
                      }),
                      Navigator.pop(context)
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                    
                        Text(
                          'Cerrar',
                          style: TextStyle(
                            fontFamily: 'inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: '#B5B6C1'.toColor(),
                          ),
                        ),
                  
                        SizedBox(width: 9),
                  
                        Image.asset(
                          'assets/images/close.png',
                          width: 23,
                          height: 23,
                        ),
                  
                        SizedBox(width: 20),
                      ]
                    ),
                  ),
                ],
              ),  

              SizedBox(height: 16),
              Container(
                width: 359,
                height: screen1 ? 459 : 403,
                decoration: BoxDecoration(
                  color: '#ffffff'.toColor(),
                  borderRadius: BorderRadius.circular(31)
                ),

                child:   Column(
                  children: [
                    SizedBox(height: 33),
                    Container(
                      width: 282,
                      child: Text(
                        'Elige tu candidato para Presidente de Asamblea 2023',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: '#343887'.toColor(),
                        ),
                      )
                    ),

                    SizedBox(height: 38),

                    screen1 ?
                    
                    Column(children: <Widget>[
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              candidate1 = true;
                              candidate2 = false;
                              candidate3 = false;
                            })
                          },
                          child: CandidateItem(
                            name: 'Diana Andrea Bolaños',
                            voted: candidate1,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              candidate1 = false;
                              candidate2 = true;
                              candidate3 = false;
                            })
                          },
                          child: CandidateItem(
                            name: 'Juan Andres Buitrago',
                            voted: candidate2,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              candidate1 = false;
                              candidate2 = false;
                              candidate3 = true;
                            })
                          },
                          child: CandidateItem(
                            name: 'Pablo Montaño',
                            voted: candidate3,
                          ),
                        ),
                        SizedBox(height: 54),
                        GestureDetector(
                          onTap: () => {

                              setState(() {
                                screen1 = false; 
                              }),

                          
                          },
                          child: Container(
                            width: 275,
                            height: 53,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: '#867bfc'.toColor(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Votar',
                                style: TextStyle(
                                  color: '#ffffff'.toColor(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]) :

                    Column(children: <Widget>[
                        CandidateItemScreen2(
                          name: 'Diana Andrea Bolaños',
                          voted: 25,
                        ),
                        SizedBox(height: 10),
                        CandidateItemScreen2(
                          name: 'Juan Andres Buitrago',
                          voted: 55,
                        ),
                        SizedBox(height: 10),
                        CandidateItemScreen2(
                          name: 'Pablo Montaño',
                          voted: 20,
                        ),
                        SizedBox(height: 54),

                        Row(
                        children: <Widget>[
                          Container(
                            width: 179.5,
                            height: 56,
                            decoration: BoxDecoration(
                              color: '#ECECF5'.toColor(),
                              borderRadius: BorderRadius.only(
                                
                                bottomLeft: Radius.circular(31),
                              ),
                            ),

                            child: Center(
                              child: Text(
                                'Anterior',
                                style: TextStyle(
                                  color: '#343887'.toColor(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            
                          ),
                          Container(
                            width: 179.5,
                            height: 56,
                            decoration: BoxDecoration(
                              color: '#8378FC'.toColor(),
                              borderRadius: BorderRadius.only(
                                
                                bottomRight: Radius.circular(31),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Siguiente',
                                style: TextStyle(
                                  color: '#FFFFFF'.toColor(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                          
                        ]
                      ),
                        
                      ])

                      

                    
                  ],
                ),
              ),

              screen1 ? Container() : SizedBox(height: 34),

              screen1 ? Container() : 

              Text('¡Gracias por tu respuesta!',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: '#9EA3FF'.toColor(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
    );
  }

  void votation(String candidate) {
    setState(() {
      if (candidate == 'candidate1') {
        candidate1 = true;
        candidate2 = false;
        candidate3 = false;
      } else if (candidate == 'candidate2') {
        candidate1 = false;
        candidate2 = true;
        candidate3 = false;
      } else if (candidate == 'candidate3') {
        candidate1 = false;
        candidate2 = false;
        candidate3 = true;
      }
    });
  }

  
}

class CandidateItem extends StatelessWidget {
  final String name;
  final bool voted;
  const CandidateItem({
    required this.name,
    required this.voted,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 317,
      height: 54,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        color: voted ? '#ffffff'.toColor() : '#EFECF8'.toColor(),
        borderRadius: BorderRadius.circular(21),
        border: voted ? Border.all(color: '#8378FC'.toColor(), width: 1) : null,
    
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name,
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: voted ? '#8378FC'.toColor() :  '#343887'.toColor(),
            ),
          ),
    
          Container(
            width: 41,
            height: 41,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: voted ? '#7E72FF'.toColor() : '#EFECF8'.toColor(),
              border: Border.all(
                color: '#C0BEDE'.toColor(),
                width: 2
              ),
              borderRadius: BorderRadius.circular(50)
            ),
    
            child: voted ? Icon(Icons.check, color: Colors.white) : null,
          
          )
        ]
      ),
      
    );
  }
}

class CandidateItemScreen2 extends StatelessWidget {
  final String name;
  final double voted;
  const CandidateItemScreen2({
    required this.name,
    required this.voted,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: 317,
          height: 54,
          padding: EdgeInsets.only(left: 20, right: 10),
          decoration: BoxDecoration(
            color: '#EFECF8'.toColor(),
            borderRadius: BorderRadius.circular(21),
            
        
          ),
        
          
          
        ),

        Container(
          width: 317 * voted / 100,
          height: 54,
          decoration: BoxDecoration(
            color: '#D5D2FE'.toColor(),
            borderRadius: BorderRadius.circular(21),
          ),
          
        ),

        Container(
          width: 317,
          height: 54,
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name,
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: '#343887'.toColor(),
                  ),
                ),
          
                Text('${voted.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: '#8378FC'.toColor(),
                  ),
                )
              ]
            ),
        ),
      ],
    );
  }
}