import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/chats/bloc/profiles_bloc.dart';
import 'package:hipal/components/chats/model/UserProfile.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/ChatResponse.dart';

class ProfilesList extends StatefulWidget {
  @override
  _ProfilesList createState() => _ProfilesList();
}

class _ProfilesList extends State<ProfilesList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<UserChat> items = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfilesBloc>(context).add(LoadRefreshProfiles(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesBloc, ProfilesState>(builder: (context, state) {
      items = (state.profiles != null ? state.profiles : [])!;
      print(items.length);
      return state.isLoadingProfiles
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
          : items.length > 0
              ? SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: _refreshController,
                  onRefresh: () async {
                    // BlocProvider.of<ProfilesBloc>(context).add(LoadRefreshProfiles(context));
                    await Future.delayed(Duration(milliseconds: 1000));
                    _refreshController.refreshCompleted();
                  },
                  onLoading: () async {
                    BlocProvider.of<ProfilesBloc>(context)
                        .add(LoadProfiles(context));
                    await Future.delayed(Duration(milliseconds: 1000));
                    _refreshController.loadComplete();
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (c, i) => _chatCard(i),
                    itemCount: items.length,
                  ))
              : Container(
                  child: Center(
                    child: Text(
                      "Sin resultados",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff343887),
                      ),
                    ),
                  ),
                );
    });
  }

  Widget _chatCard(int i) {
    return BlocBuilder<ProfilesBloc, ProfilesState>(builder: (context, state) {
      if (i <= items.length - 1) {
        return Card(
          margin: (i == items.length - 1)
              ? EdgeInsets.only(bottom: 60.0, left: 4.0, right: 4.0, top: 4.0)
              : EdgeInsets.all(4.0),
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xff6456EB),
                image: DecorationImage(
                  image: items[i].user?.photo != null
                      ? NetworkImage(
                          items[i].user?.photo?.url.toString() as String)
                      : AssetImage('assets/images/image-default.png')
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
              ),
            ),
            title: Text(
              items[i].user?.lastname != null
                  ? items[i].user?.lastname.toString() as String
                  : "${items[i].user?.firstname}  ${items[i].user?.lastname.toString()}",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            subtitle: Text(
              (() {
                var isAdmin =
                    items[i].rolesDetail?.where((rol) => rol.name == "Admin");
                var isWatchman = items[i]
                    .rolesDetail
                    ?.where((rol) => rol.name == "Watchman");
                if (isAdmin != null && isAdmin.length > 0) {
                  return "Administrador";
                } else if (isWatchman != null && isWatchman.length > 0) {
                  return "Celador";
                } else if (items[i].apartmentsDetail!.first != null) {
                  return '${items[i].apartmentsDetail!.first.towerName.toString()} - ${items[i].apartmentsDetail!.first.name.toString()}';
                }
                return "";
              })(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () async {
              final chatsBloc = BlocProvider.of<ChatsBloc>(context);
              final dynamic response = await chatsBloc.chatsRepo
                  .createChat(context, {"profileUser": items[i].profiles?.id});
              if (response != null && response.statusCode == 201) {
                final chatsResponse = json.decode(response.body);
                ChatResponse chat = ChatResponse.fromJson(chatsResponse);

                final towerApart =
                    "${items[i].apartmentsDetail?.first.towerName}, ${items[i].apartmentsDetail?.first.name}";
                BlocProvider.of<ChatsBloc>(context)
                    .add(CreateChat(chat, towerApart));
                BlocProvider.of<ChatsBloc>(context)
                    .add(ChangeSearch("", 0, ''));
                BlocProvider.of<MessagesBloc>(context).add(LoadIdChat(chat));
                BlocProvider.of<MessagesBloc>(context)
                    .add(LoadRefreshMessages(context));
                Navigator.pushNamed(context, 'messages');
              }
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
