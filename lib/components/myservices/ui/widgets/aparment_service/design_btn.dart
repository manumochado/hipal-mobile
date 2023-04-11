// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignBtn extends StatefulWidget {
   String btnName;
   Widget view;
  DesignBtn( this.btnName, this.view,  {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DesignBtn> createState() => _DesignBtnState( btnName,view );
}

class _DesignBtnState extends State<DesignBtn> {
  String btnName;
    Widget view;
    _DesignBtnState(this.btnName,this.view);
  @override
  Widget build(BuildContext context) {
    
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Color(0xff7E72FF),
        ),
      ),
      color: const Color(0xFF776BF8),
      child: Container(
        height: 53,
        alignment: Alignment.center,
        child: Text(
          btnName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 16,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff7B6FFA).withOpacity(0.34),

              spreadRadius: 0,
              blurRadius: 9,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => view),
        );
      },
    );
  }
}
