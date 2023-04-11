import 'package:flutter/material.dart';
import 'package:hipal/components/messages/model/chatMessageType.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/messages/model/messageStatus.dart';
import 'package:hipal/constants.dart';

import 'audio_message.dart';
import 'emergency_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.message,
    required this.idMsg,
  }) : super(key: key);

  final Message message;
  final int idMsg;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(Message message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message, idMsg: idMsg);
        case ChatMessageType.emergency:
          return EmergencyMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage();
        default:
          return SizedBox();
      }
    }

    // return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: ((message.messageType == ChatMessageType.emergency)
            ? MainAxisAlignment.center
            : message.isSender!
                ? MainAxisAlignment.end
                : MainAxisAlignment.start),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: messageContaint(message),
          )
          // if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
    // });
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
