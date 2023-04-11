import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/ChatResponse.dart';

class ChatsList extends StatefulWidget {
  @override
  _ChatsList createState() => _ChatsList();
}

class _ChatsList extends State<ChatsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<ChatResponse> items = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ChatsBloc>(context).add(InitLoadChats(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(builder: (context, state) {
      items = (state.chats != null ? state.chats : [])!;
      if (!state.isLoadingRefresh) {
        _refreshController.refreshCompleted();
      }
      if (!state.isLoadingMore) {
        _refreshController.loadComplete();
      }
      return state.isLoadingChats
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
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () async {
                BlocProvider.of<ChatsBloc>(context)
                    .add(LoadRefreshChats(context));
              },
              onLoading: () async {
                BlocProvider.of<ChatsBloc>(context).add(LoadChats(context));
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (c, i) => _chatCard(i),
                itemCount: items.length,
              ));
    });
  }

  Widget _chatCard(int i) {
    String desc =
        '${items[i].user?.profiles?.first.apartment?.tower?.name ?? ''}'
        ', '
        '${items[i].user?.profiles?.first.apartment?.name ?? ''}';

    if (desc == ', ') {
      desc = items[i].user!.profiles!.first.rol![0].name;
    }

    return BlocBuilder<ChatsBloc, ChatsState>(builder: (context, state) {
      return Card(
        margin: (i == items.length - 1)
            ? EdgeInsets.only(bottom: 60.0, left: 4.0, right: 4.0, top: 4.0)
            : EdgeInsets.all(4.0),
        child: ListTile(
          leading: Container(
            width: 60.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: const Color(0xff6456EB),
              image: DecorationImage(
                image: items[i].user!.photo != null
                    ? NetworkImage(items[i].user!.photo!.url.toString())
                    : AssetImage('assets/images/image-default.png')
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
          ),
          title: Text(
            items[i].fullname != null ? items[i].fullname.toString() : '',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                color: Color(0xff343887)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(desc),
              Text(
                items[i].messageLast?.message != null
                    ? items[i].messageLast!.message.toString()
                    : '',
                style: TextStyle(fontSize: 12.0, color: Color(0xff343887)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          onTap: () => {
            BlocProvider.of<ChatsBloc>(context).add(ChatView(items[i])),
            BlocProvider.of<MessagesBloc>(context).add(TypeMessages("", "")),
            BlocProvider.of<MessagesBloc>(context).add(MessageClear()),
            BlocProvider.of<MessagesBloc>(context).add(LoadIdChat(items[i])),
            BlocProvider.of<MessagesBloc>(context)
                .add(LoadRefreshMessages(context)),
            Navigator.pushNamed(context, 'messages')
            // Navigator.pushReplacementNamed(context, 'messages')
          },
          trailing: Column(children: [
            SizedBox(height: 10.0),
            StreamBuilder(
                stream: Stream.periodic(const Duration(minutes: 1)),
                builder: (context, snapshot) {
                  return Text(
                      (items[i].messageLast?.createdAt != null)
                          ? timeago.format(
                              DateTime.now().subtract(DateTime.now().difference(
                                  items[i].messageLast?.createdAt as DateTime)),
                              locale: "es")
                          : "",
                      style:
                          TextStyle(color: Color(0xff6C7192), fontSize: 10.0));
                }),
            if (items[i].messageNotView > 0)
              Badge(
                toAnimate: false,
                badgeColor: Color(0xffFE9D6D),
                borderRadius: BorderRadius.circular(10.0),
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
                badgeContent: Text(items[i].messageNotView.toString(),
                    style: TextStyle(color: Color(0xffffffff), fontSize: 10.0)),
              ),
          ]),
        ),
      );
    });
  }
}
