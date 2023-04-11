import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/message.dart';

class BodyMessages extends StatefulWidget {
  @override
  _BodyMessages createState() => _BodyMessages();
}

class _BodyMessages extends State<BodyMessages> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Message> messagesArray = [];
  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      messagesArray = (state.messages != null ? state.messages : [])!;
      if (!state.isLoadingMoreMessages) {
        _refreshController.loadComplete();
      }

      return state.isLoadingMessages
          ? Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Color(0xff6456EB),
                  strokeWidth: 3,
                ),
              ),
            )
          : Container(
              child: SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                reverse: true,
                controller: _refreshController,
                onLoading: () async {
                  BlocProvider.of<MessagesBloc>(context)
                      .add(LoadMoreMessages(context));
                },
                child: ListView.builder(
                  itemCount: messagesArray.length,
                  itemBuilder: (context, index) {
                    return MessageWidget(
                      message: messagesArray[index],
                      idMsg: index,
                    );
                  },
                ),
              ),
            );
    });
  }
}
