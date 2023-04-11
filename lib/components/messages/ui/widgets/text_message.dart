import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../bloc/messages_bloc.dart';

class TextMessage extends StatelessWidget {
  final Message message;
  final int idMsg;
  TextMessage({
    Key? key,
    required this.message,
    required this.idMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSender = message.isSender!;
    final blocMessage = BlocProvider.of<MessagesBloc>(context);
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isSender)
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff6456EB),
                    //blocMessage
                    image: DecorationImage(
                      image: blocMessage.state.chat!.user!.photo != null
                          ? NetworkImage(blocMessage
                              .state.chat!.user!.photo?.url
                              .toString() as String)
                          : AssetImage('assets/images/image-default.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                ),
              if (!isSender)
                SizedBox(
                  width: 15,
                ),
              Column(
                  crossAxisAlignment: isSender
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width - 130,
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 0.75,
                          vertical: kDefaultPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          color: isSender ? kMessageBackground : Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: isSender
                                  ? Radius.circular(20)
                                  : Radius.circular(0),
                              bottomRight: isSender
                                  ? Radius.circular(0)
                                  : Radius.circular(20)),
                        ),
                        child: Text(
                          message.message.toString(),
                          maxLines: null,
                          textAlign:
                              isSender ? TextAlign.right : TextAlign.left,
                          style: TextStyle(
                            color: kTextColorSecond,
                          ),
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: StreamBuilder(
                          stream: Stream.periodic(const Duration(minutes: 1)),
                          builder: (context, snapshot) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  timeago.format(
                                      DateTime.now().subtract(DateTime.now()
                                          .difference(
                                              message.createdAt as DateTime)),
                                      locale: "es"),
                                  textAlign: isSender
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  style: TextStyle(
                                      color: kColorTextTime, fontSize: 10),
                                )
                              ],
                            );
                          }),
                    )
                  ]),
            ])
      ],
    );
  }
}
