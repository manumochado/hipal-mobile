import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hipal/widgets/text_with_box.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentButton extends StatefulWidget {
  EdgeInsets? margin;
  String title;
  String url;
  String subtitle;
  VoidCallback voidCallback;

  DocumentButton({
    required this.margin,
    required this.title,
    required this.url,
    required this.subtitle,
    required this.voidCallback,
  });

  @override
  createState() => _DocumentButton();
}

class _DocumentButton extends State<DocumentButton> {
  @override
  Widget build(BuildContext context) {
    final split = widget.url.split('.');
    String ruta;
    switch (split.last) {
      case "doc" "docx":
        ruta = 'assets/icons/doc.png';
        break;
      case "xls" "xlsx":
        ruta = 'assets/icons/xls.png';
        break;
      case "ppt" "pptx":
        ruta = 'assets/icons/ppt.png';
        break;
      case "pdf":
        ruta = 'assets/icons/pdf.png';
        break;
      case "txt":
        ruta = 'assets/icons/txt.png';
        break;
      case "jpg" "png":
        ruta = 'assets/icons/imagen.png';
        break;
      case "mp3":
        ruta = 'assets/icons/musica.png';
        break;
      default:
        ruta = 'assets/icons/other.png';
        break;
    }
    // TODO: implement build
    return Container(
      margin: widget.margin,
      child: SizedBox.fromSize(
        size: Size(140, 140),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Material(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        child: Image.asset(ruta),
                      ),
                      Container(height: 15),
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Color(0xFF5C5D87),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(height: 5),
                      TextWithBox(
                          text: widget.subtitle,
                          textColor: 0xFF7567E2,
                          textSize: 15,
                          backgroundColor: 0xFFFFFFFF,
                          padding: EdgeInsets.only(left: 10))
                    ],
                  ),
                  /*PopupMenuButton(
                    icon: Icon(const IconData(0xe91A, fontFamily: 'icomoon'),color: Color(0xFF8378FC), size: 25,),
                    offset: Offset(-25,18),
                    onSelected: (optionValue)=>{
                    if (optionValue == 1)
                    {}
                    else if (optionValue == 0)
                    {}
                    },
                    itemBuilder: (BuildContext context)=> <PopupMenuEntry>[
                      PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(const IconData(0xe900, fontFamily: 'icomoon'),color: Color(0xFF8378FC), size: 15,),
                              Text('Ver documento')
                            ],
                          ),
                          value: 0),
                      PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(const IconData(0xe918, fontFamily: 'icomoon'),color: Color(0xFF8378FC), size: 15,),
                              Text('Descargar')
                            ],
                          ),
                          value: 1)
                    ]
                ),*/
                  InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(widget.url));
                      },
                      child: Container(
                          padding: EdgeInsets.only(top: 25, right: 10),
                          child: Icon(
                            const IconData(0xe918, fontFamily: 'icomoon'),
                            color: Color(0xFF8378FC),
                            size: 35,
                          ))),
                ],
              )),
        ),
      ),
    );
  }
}
