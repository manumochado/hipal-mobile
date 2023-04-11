import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerBilleteraHeader extends StatelessWidget {
  const ContainerBilleteraHeader({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: size.height / 2 - 140,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0)),
          image: DecorationImage(
            image: AssetImage("assets/images/billetera.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: size.height / 2 - 140,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.4),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0)),
        ),
      ),
      Positioned(
          bottom: title == "" ? 75.0 : 100.0,
          child: Center(
              child: SvgPicture.asset('assets/icons/Hi_globo.svg',
                  width: 100, semanticsLabel: 'Hipal Logo'))),
      Positioned(
          bottom: 50.0,
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700))),
      Positioned(
          top: 15.0,
          left: 15.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25.0,
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'dashboard');
                },
              ),
              SizedBox(
                width: size.width / 2 - size.height / 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Billetera',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          )),
    ]);
  }
}
