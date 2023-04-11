import 'package:flutter/material.dart';

class CardItemApartment extends StatefulWidget{
  CardItemApartment({
    Key? key,
    this.title = '',
    this.icon,
    this.content,
  });

  final String title;
  final Widget? content;
  final IconData? icon;

  @override
  State<CardItemApartment> createState() => _CardItemApartmentState();
}

class _CardItemApartmentState extends State<CardItemApartment> {
  @override
  Widget build(BuildContext context) {
    Widget? content = widget.content;

    return Container(
      margin: const EdgeInsets.only(
        top: 3.0,
        left: 16.0,
        right: 16.0,
        bottom: 6.0
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFFEFF3FE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme( 
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: SizedBox(
            height: double.infinity,
            child: Icon( widget.icon, color: Color(0xff8378FC), size: 40,),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFF5F5E88)
            ),
          ),
          collapsedIconColor: Color(0xFF8075FB),
          iconColor: Color(0xFF8075FB),
          children: <Widget>[
            if(content != null)
              content
          ],
        ),
      ),
    );
  }
}