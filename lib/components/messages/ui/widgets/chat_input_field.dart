import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: '');
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: 3.0,
        bottom: 6.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xff6456EB).withOpacity(0.08),
          ),
        ],
      ),
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: TextFormField(
                        //key: _formKey,
                        controller: _controller,
                        maxLines: 2,
                        //initialValue: state.messageInput,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          hintText: "Escribe tu mensaje...",
                          hintStyle: TextStyle(
                              color: Color(0xFFB1B4C7), fontSize: 12.0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 12.0, height: 1.2),
                        scrollPadding: EdgeInsets.all(0),
                        validator: (value) =>
                            (value == null || value == '') ? '' : null,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: 80.0,
                          height: 60.0,
                          child: FloatingActionButton(
                              mini: false,
                              backgroundColor: Colors.white,
                              child: Icon(
                                const IconData(0xe91c, fontFamily: 'icomoon'),
                                color: kColorIcon,
                                size: 40.0,
                              ),
                              onPressed: () async {
                                final textMsg = _controller.text;
                                _controller.clear();
                                if (textMsg != "") {
                                  final blocMessage =
                                      await context.read<MessagesBloc>();
                                  await blocMessage.messagesRepo.sendMessage(
                                      context,
                                      blocMessage.state.chat!,
                                      textMsg.toString());
                                }
                              }),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
