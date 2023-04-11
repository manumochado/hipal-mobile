import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignTextAdd extends StatefulWidget {
  String title;
  String descrip;
  DesignTextAdd(this.title, this.descrip);

  createState() =>_DesignTextAddState();
}

class _DesignTextAddState extends State<DesignTextAdd> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Color(0xff9FA7B8),
          fontSize: 12,
        ),
      ),
      subtitle:  const TextField(    
        enabled: true,
        style: TextStyle(
          color: Color(0xff343887),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(border: InputBorder.none,
        ),
      ),
    );
  }
}
