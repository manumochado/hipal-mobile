import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.size,
    required this.image,
    this.extend = false,
    this.showLogo = false,
  }) : super(key: key);

  final Size size;
  final bool showLogo;
  final String image;
  final bool extend;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: extend ? size.height / 2 + 50 : size.height / 2,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0)),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      if (showLogo)
        Positioned(
            bottom: 10.0,
            child: Center(
                child: SvgPicture.asset('assets/icons/Hi_globo.svg',
                    width: 100, semanticsLabel: 'Hipal Logo')))
    ]);
  }
}
