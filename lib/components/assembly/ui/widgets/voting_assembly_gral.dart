import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart'; 

class VotingAssemblyGral extends StatefulWidget {
  @override
  _VotingAssemblyGralState createState() => _VotingAssemblyGralState();
}
class _VotingAssemblyGralState extends State<VotingAssemblyGral> {

  List<Widget> list = [ItemOne(), ItemTwo()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            alignment: Alignment.center,
            height: 420,
            child: Swiper(
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  activeColor: '#7d41dd'.toColor(),
                  size: 15,
                  activeSize: 15,
                ),
              ),
              itemBuilder: (BuildContext context, int index) {

                return list[index];
              },
              itemCount: list.length,
              viewportFraction: 1,
              scale: 0.5,
            ),

            
            ),


            
          ]
        ),
      ),
    );
  }
}

class ItemOne extends StatelessWidget {
  const ItemOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: '#FFFFFF'.toColor(),
      ),

      child: Column(
        children: <Widget>[
          SizedBox(height: 33),
            Container(
              width: 359,
              height: 343,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: '#EFF3FE'.toColor(),
                borderRadius: BorderRadius.circular(31),
                
              
              ),
              child: Column(
                children: [
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
                ],
              ),
            ),

            SizedBox(height: 38),
        ]
      ),
    );
  }
} 


class ItemTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: '#FFFFFF'.toColor(),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 33),
            Container(
              width: 359,
              height: 125,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: '#EFF3FE'.toColor(),
                borderRadius: BorderRadius.circular(31),
                
              
              ),
              child: Column(
                children: [
                  Container(
                    width: 282,
                    child: Text(
                      'Las siguientes preguntas apareceran en el historial en la medida en que sean respondidas.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: '#343887'.toColor(),
                      ),
                    )
                  ),

                  
                ],
              ),
            ),

            SizedBox(height: 38),
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