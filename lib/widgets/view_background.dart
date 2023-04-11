import 'package:flutter/material.dart';

class ViewBackground extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isLogo;
  const ViewBackground(
      {Key? key, required this.child, this.title = "", this.isLogo = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBoxImg(
            title: title,
            isLogo: isLogo,
          ),
          this.child,
        ],
      ),
    );
  }
}

class _PurpleBoxImg extends StatelessWidget {
  final String title;
  final bool isLogo;
  const _PurpleBoxImg({Key? key, required this.isLogo, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: _purpleBackgroundImg(),
        child: isLogo
            ? _HeaderIcon()
            : Center(
                child: Row(
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 50.0),
                  )
                ],
              )));
  }

  BoxDecoration _purpleBackgroundImg() => BoxDecoration(
      border: Border.all(color: Colors.transparent),
      image: DecorationImage(
        image: AssetImage(
          "assets/images/bg_auth.png",
        ),
        fit: BoxFit.fill,
      ));
}

// ignore: must_be_immutable
class _HeaderIcon extends StatelessWidget {
  String logoWhite = 'assets/images/logoHipalWhite.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: Image(image: AssetImage(logoWhite)),
        ),
      ),
    );
  }
}
