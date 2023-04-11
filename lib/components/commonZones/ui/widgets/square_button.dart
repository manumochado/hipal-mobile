import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatefulWidget {
  EdgeInsets? margin;
  String title;
  String url;
  double iconSize;
  int colorIcon;
  String? subtitle;
  int? colorSubtitle;
  int? sizeSubtitle;
  int? colorBackgroungSubtitle;
  VoidCallback voidCallback;

  //Added parameters new
  Color? backgroundS;
  String sub;

  SquareButton({
    required this.margin,
    required this.title,
    required this.url,
    required this.iconSize,
    required this.colorIcon,
    this.subtitle,
    this.colorSubtitle,
    this.sizeSubtitle,
    this.colorBackgroungSubtitle,
    this.sub = 'Gratis',
    required this.voidCallback,
    this.backgroundS,
  });

  @override
  createState() => _SquareButton();
}

class _SquareButton extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: widget.margin,
        child: SizedBox.fromSize(
          size: Size(300, 320),
          child: Container(
            decoration: BoxDecoration(
              //Here goes the same radius, u can put into a var or function
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1D000000),
                  spreadRadius: 4,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Material(
                color: Colors.white,
                elevation: 10.0,
                shadowColor: Colors.grey,
                child: InkWell(
                  onTap: widget.voidCallback,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      Container(
                          width: 150.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: widget.url != ''
                                    ? NetworkImage(widget.url)
                                    : AssetImage(
                                            'assets/images/image-default.png')
                                        as ImageProvider,
                              ))),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xFF5C5D87),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(height: 5),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: widget.backgroundS!.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          widget.sub,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: widget
                                  .backgroundS!, //Color(textColor) Antiguo,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
