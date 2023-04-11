import 'package:flutter/material.dart';

// import 'package:hipal/components/messages/model/messageModel.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/constants.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';


class EmergencyMessage extends StatelessWidget {
  const EmergencyMessage({
    Key? key,
    this.message,
  }) : super(key: key);
  
  final Message? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(
              vertical: 0,
            ),
            child: Text(
              message!.message.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFD1242D),
              ),
            ),
          ),

          SizedBox( height: 6, ),

          Container(
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(minutes: 1)),
              builder: (context, snapshot) {
                return Text(
                  timeago.format(DateTime.now().subtract(DateTime.now().difference(message!.createdAt as DateTime)), locale: "es"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColorTextTime,
                    fontSize: 10
                  ),
                );
              }
            ),
          )
          
        ],
      ),
    );
  }
}
